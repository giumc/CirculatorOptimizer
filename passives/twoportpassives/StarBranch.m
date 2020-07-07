classdef StarBranch < OptNLBranch
    
% Contains an OptBandPassFilt and OptNLSeriesRes
% member of OptNLBranch
% 
% ------ PROPERTIES ------
% 
% Public:
% label
% 
% ------ METHODS ------
% 
% Public:
% StarBranch(varargin) -> pass {'order',N} to initialize 
%                         passive as OptBandPassFilt(N-1)
%                         nlres as OptNLRes
%                         
%                         OSS: all resonators have q_unloaded set to 
%                         not optimizable
% ABCD(freq)           -> calculates ABCD matrix 
  	
    properties (Access=private,Constant)
        
        def_f_c=1;
        def_q_l=5;
        def_term=1;
        
    end
    
    properties 
    
        label = "TwoPort Branch with BP Filter + NL Resonator";
        
    end
    
    methods
    
        function obj=StarBranch(varargin)
            
            obj.init_branch(obj,varargin{:});
            
        end
    
        function m = ABCD(obj,freq)
        
            if ~isempty(obj.passive)
                
                m = obj.passive.ABCD(freq) * obj.nlres.seriesABCD(freq);
                
            else
                
                m = obj.nlres.seriesABCD(freq);
                
            end
            
        end
        
    end
    
    methods (Access=protected)
        
        function init_branch(obj,varargin)
        
            obj.nlres=OptNLSeriesRes(varargin{:});
            
            order = [];
            
            if ~isempty(varargin)
                
                if isnumeric(varargin{1})
                    
                    if varargin{1}>=2
                        
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
        
    end
        
end
