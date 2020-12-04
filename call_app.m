close all
clearvars
clear all

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

% % ファイル名をセル配列に格納。単一選択の場合のみ文字配列として出力されるため
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
% % Figureの生成
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
% % プレイ用のSliderの設定
% slider_ID=uicontrol('style','slider');
% fig_position=get(fig_ID,'position');
% slider_position=round([0.05*fig_position(1,3) 0.05*fig_position(1,4) 0.7*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(slider_ID,'position',slider_position,'SliderStep',[1/(TotalFrame-1),20/(TotalFrame-1)],'Max',TotalFrame,'Min',1);
% % Frame番号表示のための設定
% text_ID=uicontrol('style','text');
% text_position=round([0.8*fig_position(1,3) 0.05*fig_position(1,4) 0.15*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(text_ID,'position',text_position,'HorizontalAlignment','left','FontName','Arial','FontSize',12,'FontWeight','bold');
% set(text_ID,'String',1);
% 
% % ボール位置読み込みボタンの設定
% ReadBall_ID=uicontrol('style','togglebutton');
% ReadBall_position=round([0.05*fig_position(1,3) 0.12*fig_position(1,4) 0.1*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(ReadBall_ID,'string','BallP','position',ReadBall_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% % 映像トリム位置（左上）読み込みボタンの設定
% TrimLeftTop_ID=uicontrol('style','togglebutton');
% TrimLeftTop_position=round([0.18*fig_position(1,3) 0.12*fig_position(1,4) 0.22*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(TrimLeftTop_ID,'string','TrimLeftTop','position',TrimLeftTop_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% % 映像トリム位置（右下）読み込みボタンの設定
% TrimRightBottom_ID=uicontrol('style','togglebutton');
% TrimRightBottom_position=round([0.42*fig_position(1,3) 0.12*fig_position(1,4) 0.22*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(TrimRightBottom_ID,'string','TrimRightBottom','position',TrimRightBottom_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % ボールインパクトフレームの決定
% FrameImpact_ID=uicontrol('style','togglebutton');
% FrameImpact_position=round([0.67*fig_position(1,3) 0.12*fig_position(1,4) 0.2*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(FrameImpact_ID,'string','OutAsImpactF','position',FrameImpact_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % 最終決定
% OK_ID=uicontrol('style','togglebutton');
% OK_position=round([0.9*fig_position(1,3) 0.12*fig_position(1,4) 0.05*fig_position(1,3) 0.05*fig_position(1,4)]); % [角横、縦、幅、高さ]
% set(OK_ID,'string','OK','position',OK_position,'HorizontalAlignment','center','FontName','Arial','FontSize',10,'FontWeight','bold',...
%     'value',0);
% 
% % time_frame=round(get(slider_ID,'Value'));
% %         set(text_ID,'String',time_frame);
% 
% % 呼び出し処理
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