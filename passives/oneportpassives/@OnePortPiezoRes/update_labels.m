function update_labels(obj)

    obj.set_default_labels;
    obj.f_center.label=strcat(obj.f_center.label,"_",obj.label);
    obj.kt2.label=strcat(obj.kt2.label,"_",obj.label);
    obj.q_unloaded.label=strcat(obj.q_unloaded.label,"_",obj.label);
    obj.c0.label=strcat(obj.c0.label,"_",obj.label);
    
end
