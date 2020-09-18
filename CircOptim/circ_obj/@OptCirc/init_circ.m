function init_circ(obj,varargin)

    %implementation for OptCirc
    
    obj.init_goal(varargin{:});

    obj.init_branch(varargin{:});
    
    if ~isempty(obj.passive)

        obj.order = obj.passive.order +1;

        obj.passive.set_ref_impedance(obj.def_term);

    else

        obj.order = 1;

    end
    
    obj.plot_tools=CircOptPlot(obj,varargin{:});

end
