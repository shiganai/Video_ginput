close all
clearvars

% 解析ファイルの選択
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222市原柿の木台計測\100CASIO\';
% filename_defalt=sprintf('%sCIMG*.mov',pathname_defalt);
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222市原柿の木台計測\iPad\';
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20190222検見川計測\';
% pathname_defalt='D:\matlabpractice\yokomine\パッティング_船橋CC_190511\Cam2\';
pathname_defalt='D:\matlabpractice\utssi\yokomine\パッティング_吉岡_190925\';
filename_defalt=sprintf('%s*.MOV',pathname_defalt);
% filename_defalt=sprintf('%s*.mp4',pathname_defalt);
[filename_cell,pathname,ok_flag]=uigetfile(filename_defalt,'解析ファイルの選択','multiselect','on');
if ok_flag == 0
    return;
end

% ファイル名をセル配列に格納。単一選択の場合のみ文字配列として出力されるため
if ischar(filename_cell) == 1
    filename_cell_tmp=filename_cell;
    filename_cell=cell(1,1);
    filename_cell{1,1}=filename_cell_tmp;
end

if length(filename_cell) ~= 1
    error("ファイルは一つだけ選択してください")
end

filename=filename_cell{1,1};

fprintf(1,sprintf('%s\n',filename));

vidObj = VideoReader(strcat(pathname,filename));
vidObj.CurrentTime=0;


currAxes = axes;
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    pause(1/vidObj.FrameRate);    
end