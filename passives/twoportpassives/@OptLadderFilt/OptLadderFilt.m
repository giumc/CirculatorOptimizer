classdef OptLadderFilt < TwoPortPassive 
      
% interface for Ladder Filters
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
%                             pass {'lastres',{'shunt_res','series_res'}} to pick last res
% get_OptParam()           ->  returns optimizable OptParam
% set_ref_impedance(value)
% Protected (Static) :
% pick_resonator(n,fc,ql,qu) -> initialize res according to n to
%                                default fc ql qu

    properties (Access=protected,Constant)
        
        def_order=1;
        
        def_r_term=1;
        
        def_style='shunt_res';
        
    end
    
    properties (SetAccess=protected)
        
        order int32 ;
        
        lastres {mustBeMember(lastres,{'shunt_res','series_res'})}=...
            OptLadderFilt.def_style;
        
        resonators OnePortRes;
        
        ref_impedance ;
        
    end
   
    methods 
       
        function obj=OptLadderFilt(varargin)
            
            obj.init_filt(varargin{:});
            
        end
        
        function set_ref_impedance(obj,value)
            
            obj.ref_impedance=value;
            
            for i=1:length(obj.resonators)
                
                obj.resonators(i).set_ref_impedance(obj.ref_impedance);
                
            end
            
        end
        
        function opt_par=get_OptParam(obj)
        
            opt_par=[];
            
            for i=1:length(obj.resonators)
                
               opt_par=[opt_par obj.resonators(i).get_OptParam];
                
            end
        
        end
        
        varargout=summary(obj);
        
        ret=get_normalized_params(obj,fc,fbw);
        
    end
    
    methods (Access=protected,Abstract) 
        
        resonator=pick_resonator(obj,n_res);
        m=ABCD(obj,freq);
        
    end
    
    methods (Access=protected)
        
        init_filt(obj,varargin);
        
    end
        
end
