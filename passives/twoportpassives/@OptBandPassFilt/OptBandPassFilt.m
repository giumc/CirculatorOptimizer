classdef OptBandPassFilt < TwoPortPassive 
      
% implement shunt-first , all poles BP Filter
% member of TwoPortPassive
% 
% ------ PROPERTIES ------
% 
% Private, Constant:
% default values for f,q,r_term
% 
% Set-Access private:
% order                   ->  can be set only in constructor
% 
% Set-Access Private:
% 
% ref_impedance (double)  ->  when set, all the resonators.ref_impedance
%                             are set
% 
% Set-Access Protected:
% resonators (OnePortRes) 
% 
% Public:
% label (string)
% 
% ------ METHODS ------
% 
% Public:
% OptBandPassFilt(varargin)-> pass {'order',N} to set filter order
% get_opt_param()           ->  returns optimizable opt_param
% set_ref_impedance(value)
% Protected (Static) :
% pick_resonator(n,fc,ql,qu) -> initialize res according to n to
%                                default fc ql qu

    properties (Access=private,Constant)
        
        def_f=1;
        def_q_l=3;
        def_r_term=50;
        def_order=1;
        
    end
    
    properties (SetAccess=private)
        
        order int32 = OptBandPassFilt.def_order;
        
    end
    
    properties 
        
        label = "Optimizable All poles BandPass Filter (shunt first) ";
        
    end
    
    properties (SetAccess=private)
        
        ref_impedance = OptBandPassFilt.def_r_term; 
        
    end
    
    properties (SetAccess=protected)
        
        resonators OnePortRes;
        
    end
    
    methods 
       
        function obj=OptBandPassFilt(varargin)
            
            if ~isempty(varargin)
                
                if isnumeric(varargin{1})
                    
                    obj.order=varargin{1};
                    
                else
                    
                    if strcmp(varargin{1},'order')
                        
                        if ~isempty(varargin{2})
                            
                            obj.order=varargin{2};
                            
                        end
                        
                    end
                    
                end
           
            end
            
            for i=1:obj.order

                obj.resonators(i)=obj.pick_resonator(i,obj.def_f,obj.def_q_l);
                           
            end
            
                addlistener(obj,'ref_impedance','PostSet',@obj.update_ref_impedance);
            
        end
        
        function set_ref_impedance(obj,value)
            
            obj.ref_impedance=value;
            
            for i=1:length(obj.resonators)
                
                obj.resonators(i).ref_impedance=obj.ref_impedance;
                
            end
            
        end
        
        m=ABCD(obj,freq);
        
    end
    
    methods (Access=protected,Static) 
        
        resonator=pick_resonator(n_res,f_c,q_l);
        
    end
        
end
