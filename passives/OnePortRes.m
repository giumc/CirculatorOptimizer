classdef (Abstract) OnePortRes < OnePortPassive
    
   % interface for oneport resonator
   %
   % inherits from OnePortPassive
   %
   % has three opt_param instances : 
   % f_center
   % q_loaded
   % q_unloaded
   % 
   % and one double:
   % ref_impedance
   % opt_param values can be set from constructor as name value pairs
   % or by accessing the object
   % 
   % classes who inherit OnePortRes have to implement
   % the following methods:
   % z(freq) (from OnePortPassive)
   % y(freq) (from OnePortPassive)  
   % l
   % c
   % r
   % OSS: both z and y have to handle frequency arrays
   
    properties 
      
       ref_impedance double = 50;
       
       f_center opt_param = opt_param('value',1);
       
       q_loaded opt_param = opt_param('value',5);
       
       q_unloaded opt_param = opt_param('value',1e3);
       
       label string;
       
   end
  
    methods

        function obj=OnePortRes(varargin)
            
            if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if ischar(varargin{i})||isstring(varargin{i})
                        
                        switch varargin{i}
                            
                            case {'f','f_center','f_c'}
                                
                                obj.f_center.set_value(varargin{i+1},'override');
                            
                            case {'q','q_ref','q_l','q_loaded'}
                                
                                obj.q_loaded.set_value(varargin{i+1},'override');
                            
                            case {'q_u','qu','q_unloaded'}
                                
                                obj.q_unloaded.set_value(varargin{i+1},'override');
                                
                        end
                        
                    end
                    
                end
                
            end % set values as Name Value pair
            
            obj.f_center.unit='Hertz';
            
            obj.f_center.label='F_c';
            
            obj.q_loaded.unit='';
            
            obj.q_loaded.label='Q_L';
            
            obj.q_unloaded.unit='';
            
            obj.q_unloaded.label='Q_U';
            
        end
        
    end
    
    methods (Abstract)
        
        ind=l(obj);
        cap=c(obj);
        res=r(obj);

    end

end
