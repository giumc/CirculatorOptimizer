function init_branch(obj,varargin)

    obj.nlres=OptNLSeriesRes(varargin{:});

    order = [];

    if ~isempty(varargin)

        if isnumeric(varargin{1})

            if varargin{1}>=1

                order=varargin{1}-1;

            end

        else

            for i=1:length(varargin)

                if ischar(varargin{i})||isstring(varargin{i})

                    switch varargin{i}

                        case 'order'

                            order=varargin{i+1}-1;

                    end

                end

            end

        end

    end

    if ~isempty(order) && order>=1

        obj.passive=OptBandPassFilt(order);

        for i=1:length(obj.passive.resonators)

            obj.passive.resonators(i).q_unloaded.optimizable=false;

        end

    else

        if ~isempty(obj.passive)

            delete(obj.passive);

        end

    end

    %set_default_values

    if ~isempty(obj.passive)

        for i=1:length(obj.passive.resonators)

            obj.passive.resonators(i).f_center.set_value(...
                StarBranch.def_f_c,'override');
            obj.passive.resonators(i).q_loaded.set_value(...
                StarBranch.def_q_l,'override');

        end

        obj.passive.set_ref_impedance(StarBranch.def_term);

    end

    obj.nlres.f_center.set_value(StarBranch.def_f_c,'override');
    obj.nlres.q_loaded.set_value(StarBranch.def_q_l,'override');
    obj.nlres.set_ref_impedance(StarBranch.def_term);

end
