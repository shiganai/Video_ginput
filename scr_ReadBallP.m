BallP=[-999,-999];
[BallP(1,1),BallP(1,2)]=ginput(1);
BallP=round(BallP);
if BallP(1,1) == -999
    pause('on');
else
    set(id_BallP,'XData',BallP(1,1),'YData',BallP(1,2));
    pause('off');
end
