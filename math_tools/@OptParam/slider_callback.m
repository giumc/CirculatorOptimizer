function slider_callback(obj,src,event)

    obj.set_value(obj.denormalize(src.Value));
    obj.update_graphics;
    notify(obj,'GraphicUpdate');
end
