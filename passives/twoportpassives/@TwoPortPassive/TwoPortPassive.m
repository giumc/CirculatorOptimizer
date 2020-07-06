classdef (Abstract) TwoPortPassive < handle & GetSetOptParam
    
    % interface for two port optimizable objects
    % inherits from handle and GetSetOptParam
    % 
    %
    % ----- PROPERTIES ------
    %
    % (Abstract)
    % label (string)
    %
    %
    % ----- METHODS -------
    %
    % (Abstract)
    % m = ABCD (obj, freq) 
    %
    % (Protected)
    % y_in(obj , z0, freq, port)        ->  input admittance
    % z_in(obj , z0, freq, port)        ->  input impedance
    % ABCD_term(obj , z0, freq, port)   ->  ABCD of terminated 2port
    % S_param (obj,z0,freq)             ->  Full S param (multifreq)
    % S_param_linear(obj,z0,freq)       ->  Linear term of S

    properties (Abstract)
        
        label string;
        
    end
    
    methods (Abstract)
        
        m = ABCD (obj,freq);
        
    end
    
   methods (Access=protected)
        
        s=S_param(obj,z0,freq);
        
        s=S_param_linear(obj,z0,freq);
        
        m=ABCD_term(obj,m,z0,freq);

   end
    
   methods (Access=protected,Static)
         
        adm=y_in(m,z0,freq);
        
        imp=z_in(m,z0,freq);
       
   end
   

end
