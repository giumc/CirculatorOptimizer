classdef OptParam < matlab.mixin.Copyable & matlab.mixin.SetGet 
    
    % optimizable parameter. 
    % inherits from matlab.mixin.Copyable and matlab.mixin.SetGet
    % 
    % ----- PROPERTIES ------
    % 
    % SetAccess-protected:
    % value
    % min
    % max
    % 
    % Access-protected:
    % global_max
    % global_min
    %
    % event :
    % ValueUpdate (if value is set)
    % 
    % Public:
    % optimizable       - > only 0 or 1
    % unit (string)
    % label (string)
    % rescale_factor    -> between 0 or 1
    % 
    % ----- METHODS -----
    %
    % Public:
    % set_value;
    % set_max;
    % set_min;
    % rescale_bounds     -> updates max/min as value*(1+/-f)
    
    
    %%
    
    events
       ValueUpdate; 
    end
    
    %% properties
    
    properties (Access=private,Constant)
        
        def_value=0.5;
        def_min=0;
        def_max=1;
        def_global_max=1e20;
        def_global_min=0;
        def_label="Default";
        def_unit="";
        def_opt=true;
        def_rescale_factor=0.5;
        
    end
    
    properties (SetAccess=protected)
        
        value double = OptParam.def_value;
        min double = OptParam.def_min;
        max double = OptParam.def_max;
        
    end
    
    properties (Access=protected)
        
        global_max double = OptParam.def_global_max;
        global_min double = OptParam.def_global_min;
        
    end
    
    properties
        
        label string = "Default";
        optimizable double = true;
        unit string = "";
        rescale_factor double = OptParam.def_rescale_factor;
        
    end
    
    %% methods
    
    methods
        
        function obj=OptParam(varargin)
                    
            if ~isempty(varargin)
                
                if isnumeric(varargin{1})
                    
                    obj.set_value(varargin{1},'override');
                    
                else
                    
                    for i=1:length(varargin)
                        
                        if (ischar(varargin{i})||isstring(varargin{i}))
                            
                            switch varargin{i}
                                
                                case 'value'
                                    
                                    obj.set_value(varargin{i+1},'override');
                                    
                                case 'unit'
                                    
                                    obj.unit = varargin{i+1};
                                    
                                case 'label'
                                    
                                    obj.label=varargin{i+1};
                                    
                            end
                            
                        end
                        
                    end
                                    
                end
                
            end
            
        end
        
    end %Constructor

    methods 
        
        x = normalize(obj);
        x = denormalize(obj,x0);
        
        function set.optimizable(obj,value)
        
            if value==0 || value==1
                
                obj.optimizable=value;
                
            else
                
                error("optimizable property can be either 0 or 1");
                
            end
            
        end
        
        function set.rescale_factor(obj,value)
            
            if value>1 
                error("Bound scaling above 1 is not possible");
                
            else
                
                if value<0
                    error("Bound scaling below 0 is not possible");
                
                else
                
                    obj.rescale_factor=value;
                    
                end
                    
            end
        
        end
        
        function rescale_bounds(obj)
        
            f=obj.rescale_factor;
            obj.set_min(obj.value*(1-f));
            obj.set_max(obj.value*(1+f));

        end
        
    end %Math
    
    methods
        
        set_value(obj,value,varargin);
        set_min(obj,value);
        set_max(obj,value);
        
    end %SET functions

end
