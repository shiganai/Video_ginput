% トグルボタンが押される度にcallbackが働く
if get(zoom_wide_ID,'value') == 1 % ボタンが押された際に１となる
    if strcmpi(get(zoom_wide_ID,'string'),'WIDE') == 1
        set(zoom_wide_ID,'string','ZOOM');
        axis(axes_ID);
        axis([-20,20,-3,250,-5,30]);
    else
        set(zoom_wide_ID,'string','WIDE');
        axis(axes_ID);
        axis([1,2,-0.5,0.5,-1.6 -1.2]);
    end
end
