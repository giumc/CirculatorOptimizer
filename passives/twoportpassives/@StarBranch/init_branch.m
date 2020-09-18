function init_branch(obj,varargin)

    % implementation for StarBranch
    
    obj.nlres=OptNLSeriesRes(varargin{:});
    
    order = [];

    if ~isempty(varargin)

        for i=1:length(varargin)

            if ischar(varargin{i})||isstring(varargin{i})

                switch varargin{i}

                    case 'order'

                        order=varargin{i+1}-1;

                        
                        varargin{i+1}=order; 
                        % subtract 1 to pass to OptBandPassFilt

                end

            end

        end

    end

    if ~isempty(order) && order>=1

        obj.passive=OptBandPassFilt('order',order,...
            'lastres','shunt_res',...
            varargin{:});

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
                obj.def_f_c,'override');
            obj.passive.resonators(i).q_loaded.set_value(...
                obj.def_q_l,'override');

        end

        obj.passive.set_ref_impedance(obj.def_term);

    end

    obj.init_branch@OptNLBranch(varargin{:});
    
end
