classdef BandPassGoal < Goal
   % subclass of Goal, where the goal is set by specifying 
   % bandwidth, in band goal and out of band goal
   %  
   % subclass properties can be set as Name,Value pairs
   % when constructing object.
   %
   % properties :
   % f_center
   % bandwidth 
   % inbandgoal
   % outofbandgoal
   %
   % OSS: bandwidth is fractional to f_center
   
    properties (SetAccess=private)
        
        f_center = 1;
        
        bandwidth = 0.1 ;
        
        inbandgoal = 1 ;
        
        outofbandgoal = 0 ;
        
    end
    
    methods 
       
        function obj=BandPassGoal(varargin)
        
            vararg_super={};%to be passed to superclass constructor
            
            if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if isstring(varargin{i})||ischar(varargin{i})
                        
                        switch varargin{i}
                            
                            case {'f_array','label'}
                                
                                if isempty(vararg_super)
                                    
                                    vararg_super={varargin{i},varargin{i+1}};
                                    
                                else
                                    
                                    vararg_super={vararg_super{:},varargin{i},varargin{i+1}};
                                
                                end
                                
                        end
                        
                    end
                    
                end
                
            end
            
            obj=obj@Goal(vararg_super{:});
            
            if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if isstring(varargin{i})||ischar(varargin{i})
                        
                        switch varargin{i}

                            case 'f_center'

                                obj.f_center=varargin{i+1};

                            case 'bandwidth'

                                obj.bandwidth=varargin{i+1};

                            case 'inbandgoal'

                                obj.inbandgoal=varargin{i+1};

                            case 'outofbandgoal'

                                obj.outofbandgoal=varargin{i+1};
                                
                        end

                    end
                    
                end
                
            end
              
            obj.set_goal(obj.calculateBPGoal);
            
        end
               
    end
    
    methods (Access=private)
        
        goal=calculateBPGoal(obj);
        
    end
        
end
