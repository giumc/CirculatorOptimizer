function update_bounds(obj)

    update_bounds@GetSetOptParam(obj);

    obj.mod_freq.set_min(0);
    obj.mod_freq.set_max(obj.def_max_mod_freq);

    obj.mod_depth.set_min(0);
    obj.mod_depth.set_max(obj.def_max_mod_depth);

end
