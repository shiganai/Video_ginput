TrimLeftTopP=[-999,-999];
[TrimLeftTopP(1,1),TrimLeftTopP(1,2)]=ginput(1);
TrimLeftTopP=round(TrimLeftTopP);
if TrimLeftTopP(1,1) == -999
    pause('on');
else
    set(id_TrimLeftTopV,'XData',[TrimLeftTopP(1,1),TrimLeftTopP(1,1)]);
    set(id_TrimLeftTopH,'YData',[TrimLeftTopP(1,2),TrimLeftTopP(1,2)]);
    pause('off');
end

