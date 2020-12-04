TrimRightBottomP=[-999,-999];
[TrimRightBottomP(1,1),TrimRightBottomP(1,2)]=ginput(1);
TrimRightBottomP=round(TrimRightBottomP);
if TrimRightBottomP(1,1) == -999
    pause('on');
else
    set(id_TrimRightBottomV,'XData',[TrimRightBottomP(1,1),TrimRightBottomP(1,1)]);
    set(id_TrimRightBottomH,'YData',[TrimRightBottomP(1,2),TrimRightBottomP(1,2)]);
    pause('off');
end
