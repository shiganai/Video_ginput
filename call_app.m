close all
clearvars
clear all

% ��̓t�@�C���̑I��
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222�s���`�̖ؑ�v��\100CASIO\';
% filename_defalt=sprintf('%sCIMG*.mov',pathname_defalt);
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20181222�s���`�̖ؑ�v��\iPad\';
% pathname_defalt='D:\matlabpractice\utssi\yokomine\20190222������v��\';
% pathname_defalt='D:\matlabpractice\yokomine\�p�b�e�B���O_�D��CC_190511\Cam2\';
pathname_defalt='D:\matlabpractice\utssi\yokomine\�p�b�e�B���O_�g��_190925\';
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

filename = filename_cell{1,1};
app = app1(filename, pathname);

% changingValue = event.Value;
%             app.Slider.Value =  changingValue;
%             
%             
%             app.imageState.Text = "loading";
%             
%             time_frame = round(changingValue);
%             app.vidObj.CurrentTime = 1/app.vidObj.FrameRate*(time_frame);
%             
%             cdata_tmp = readFrame(app.vidObj);
%             EnhanceImage = 1;
%             app.cdata = uint8(EnhanceImage * cdata_tmp);
%             
% %             app.cdata = readFrame(app.vidObj);
%             
%             app.id_image.CData = app.cdata;
%             
%             app.imageState.Text = "loaded";

% % �t�@�C�������Z���z��Ɋi�[�B�P��I���̏ꍇ�̂ݕ����z��Ƃ��ďo�͂���邽��
% if ischar(filename_cell) == 1
%     filename_cell_tmp=filename_cell;
%     filename_cell=cell(1,1);
%     filename_cell{1,1}=filename_cell_tmp;
% end
% 
% for nnn=1:length(filename_cell)
% 
% filename=filename_cell{1,nnn};
% 
% fprintf(1,sprintf('%s\n',filename));
% 
% vidObj = VideoReader(strcat(pathname,filename));
% vidObj.CurrentTime=0;
% cdata=readFrame(vidObj);
% 
% TotalFrame=round(vidObj.Duration*vidObj.FrameRate);
% 
% % Figure�̐���
% fig_ID=figure;
% id_image=image(cdata);
% SizeImage_V=length(cdata(:,1,1));
% SizeImage_H=length(cdata(1,:,1));
% hold on;
% id_BallP=plot(1,1,'k+','markersize',10);
% id_TrimLeftTopV=plot([1,1],[1,SizeImage_V],'r');
% id_TrimLeftTopH=plot([1,SizeImage_H],[1,1],'r');
% id_TrimRightBottomV=plot([1,1],[1,SizeImage_V],'r');
% id_TrimRightBottomH=plot([1,SizeImage_H],[1,1],'r');
% % �v���C�p��Slider�̐ݒ�
% slider_ID=uicontrol('style','slider');
% fig_position=get(fig_ID,'position');
% slider_position=round([0.05*fig_position(1,3) 0.05*fig_position(1,4) 0.7*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(slider_ID,'position',slider_position,'SliderStep',[1/(TotalFrame-1),20/(TotalFrame-1)],'Max',TotalFrame,'Min',1);
% % Frame�ԍ��\���̂��߂̐ݒ�
% text_ID=uicontrol('style','text');
% text_position=round([0.8*fig_position(1,3) 0.05*fig_position(1,4) 0.15*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(text_ID,'position',text_position,'HorizontalAlignment','left','FontName','Arial','FontSize',12,'FontWeight','bold');
% set(text_ID,'String',1);
% 
% % �{�[���ʒu�ǂݍ��݃{�^���̐ݒ�
% ReadBall_ID=uicontrol('style','togglebutton');
% ReadBall_position=round([0.05*fig_position(1,3) 0.12*fig_position(1,4) 0.1*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(ReadBall_ID,'string','BallP','position',ReadBall_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% % �f���g�����ʒu�i����j�ǂݍ��݃{�^���̐ݒ�
% TrimLeftTop_ID=uicontrol('style','togglebutton');
% TrimLeftTop_position=round([0.18*fig_position(1,3) 0.12*fig_position(1,4) 0.22*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(TrimLeftTop_ID,'string','TrimLeftTop','position',TrimLeftTop_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% % �f���g�����ʒu�i�E���j�ǂݍ��݃{�^���̐ݒ�
% TrimRightBottom_ID=uicontrol('style','togglebutton');
% TrimRightBottom_position=round([0.42*fig_position(1,3) 0.12*fig_position(1,4) 0.22*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(TrimRightBottom_ID,'string','TrimRightBottom','position',TrimRightBottom_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % �{�[���C���p�N�g�t���[���̌���
% FrameImpact_ID=uicontrol('style','togglebutton');
% FrameImpact_position=round([0.67*fig_position(1,3) 0.12*fig_position(1,4) 0.2*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(FrameImpact_ID,'string','OutAsImpactF','position',FrameImpact_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % �ŏI����
% OK_ID=uicontrol('style','togglebutton');
% OK_position=round([0.9*fig_position(1,3) 0.12*fig_position(1,4) 0.05*fig_position(1,3) 0.05*fig_position(1,4)]); % [�p���A�c�A���A����]
% set(OK_ID,'string','OK','position',OK_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % time_frame=round(get(slider_ID,'Value'));
% %         set(text_ID,'String',time_frame);
% 
% % �Ăяo������
% set(slider_ID,'Value',1,'Callback','scr_slider_video_reader');
% BallP=[-999,-999];
% set(ReadBall_ID,'Callback','scr_ReadBallP');
% TrimLeftTopP=[-999,-999];
% set(TrimLeftTop_ID,'Callback','scr_TrimLeftTop');
% TrimRightBottomP=[-999,-999];
% set(TrimRightBottom_ID,'Callback','scr_TrimRightBottom');
% FrameImpact=1;
% set(FrameImpact_ID,'Callback','FrameImpact=round(get(slider_ID,''Value''));');
% OutMat=[FrameImpact,BallP,TrimLeftTopP,TrimRightBottomP];
% set(OK_ID,'Callback','scr_OK_video_reader');
% 
% % for kk=3100:1:3105
% %     kk
% %     vidObj.CurrentTime=1/vidObj.FrameRate*(kk-1);
% %     cdata=readFrame(vidObj);
% %     id_image.CData=cdata;
% % end
% 
% waitfor(fig_ID);
% 
% end