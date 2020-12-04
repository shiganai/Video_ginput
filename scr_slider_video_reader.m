%===========================================================
%=========　スライダー値の読み込み ===========================
%===========================================================
time_frame=round(get(slider_ID,'Value'));
set(text_ID,'String',time_frame);

vidObj.CurrentTime=1/vidObj.FrameRate*(time_frame-1);
cdata_tmp=readFrame(vidObj);

% cdata_tmp = readFrame(vidObj, time_frame);

% 画像強調
EnhanceImage=1;
cdata=uint8(EnhanceImage*cdata_tmp);

id_image.CData=cdata;
