classdef OptBandPassFilt < TwoPortPassive 
      
% implement shunt-last , all poles BP Filter
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
% get_OptParam()           ->  returns optimizable OptParam
% set_ref_impedance(value)
% Protected (Static) :
% pick_resonator(n,fc,ql,qu) -> initialize res according to n to
%                                default fc ql qu
% set_def_bounds()
    properties (Access=private,Constant)
        
        def_order=1;
        
        def_r_term=1;
        
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

                obj.resonators(i)=obj.pick_resonator(i);
                           
            end
            
        end
        
        function set_ref_impedance(obj,value)
            
            obj.ref_impedance=value;
            
            for i=1:length(obj.resonators)
                
                obj.resonators(i).set_ref_impedance(obj.ref_impedance);
                
            end
            
        end
        
        m=ABCD(obj,freq);
        
        function opt_par=get_OptParam(obj)
        
            opt_par=[];
            
            for i=1:length(obj.resonators)
                
               opt_par=[opt_par obj.resonators.get_OptParam];
                
            end
        
        end
        
        function set_bounds(obj)
        
            for i=1:length(obj.resonators)
               
                obj.resonators(i).set_bounds;
                
            end
        
        end
        
    end
    
    methods (Access=protected) 
        
        resonator=pick_resonator(obj,n_res);
        
    end
        
end
