OutMat=[FrameImpact,BallP,TrimLeftTopP,TrimRightBottomP];

fid_output=fopen('video_reader_output.txt','a');
fprintf(fid_output,'%s,%i,%i,%i,%i,%i,%i,%i\n',filename,FrameImpact,BallP(1,1),BallP(1,2),TrimLeftTopP(1,1),TrimLeftTopP(1,2),TrimRightBottomP(1,1),TrimRightBottomP(1,2));
fclose(fid_output);
close(fig_ID);