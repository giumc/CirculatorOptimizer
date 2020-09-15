function init_branch(obj,varargin)

    % implementation for MEMSStarBranch
    
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

        obj.passive=OptMEMSBPFilt('order',order,...
            'lastres','shunt_res',...
            varargin{:});

        for i=1:length(obj.passive.resonators)

            obj.passive.resonators(i).q_unloaded.optimizable=false;
            obj.passive.resonators(i).kt2.optimizable=false;
            
        end

    else

        if ~isempty(obj.passive)

            delete(obj.passive);

        end

    end

    %set_default_values

%     if ~isempty(obj.passive)
% 
%         obj.passive.set_f_c(obj.def_f_c);
%         
%         obj.passive.set_kt2(obj.def_kt2);
%         
%         obj.passive.set_ref_impedance(obj.def_term);
%         
%     end

    obj.init_branch@OptNLBranch(varargin{:});
    
end
