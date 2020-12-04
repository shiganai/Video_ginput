close all
clearvars

% ��̓t�@�C���̑I��
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222�s���`�̖ؑ�v��\100CASIO\';
% filename_defalt=sprintf('%sCIMG*.mov',pathname_defalt);
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222�s���`�̖ؑ�v��\iPad\';
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20190222������v��\';
% pathname_defalt='D:\matlabpractice\yokomine\�p�b�e�B���O_�D��CC_190511\Cam2\';
pathname_defalt='S:\OneDrive - The University of Tokyo\�������\�o�C���J\�r�f�I��͗p\';
filename_defalt=sprintf('%s*.MOV',pathname_defalt);
% filename_defalt=sprintf('%s*.mp4',pathname_defalt);
[filename_cell,pathname,ok_flag]=uigetfile(filename_defalt,'��̓t�@�C���̑I��','multiselect','on');
if ok_flag == 0
    return;
end

% �t�@�C�������Z���z��Ɋi�[�B�P��I���̏ꍇ�̂ݕ����z��Ƃ��ďo�͂���邽��
if ischar(filename_cell) == 1
    filename_cell_tmp=filename_cell;
    filename_cell=cell(1,1);
    filename_cell{1,1}=filename_cell_tmp;
end

if length(filename_cell) ~= 1
    error("�t�@�C���͈�����I�����Ă�������")
end

filename=filename_cell{1,1};

fprintf(1,sprintf('%s\n',filename));

vidObj = VideoReader(strcat(pathname,filename));
vidObj.CurrentTime=0;

currAxes = axes;
currAxes.YDir = "reverse";
hold on
jj = 1;

frame_step_num = 1;
ii = frame_step_num;

formatOut = 'mmddHHMM';
dateString = datestr(now,formatOut);
fid_output=fopen(strcat('video_reader_output_',dateString,'.txt'),'a');

while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    
    if ii == frame_step_num
        fprintf(fid_output,'%10.5f',(jj-1) / vidObj.FrameRate);
        for ii = 1:4
            [x, y] = ginput(1);
            fprintf(fid_output,',%10.5f,%10.5f', x, y);
            scatter(x,y,100,"r+")
        end
        fprintf(fid_output,'\n');
        ii = 1;
    else
        ii = ii + 1;
    end
    jj = jj + 1;
end
fclose(fid_output);
hold off











































