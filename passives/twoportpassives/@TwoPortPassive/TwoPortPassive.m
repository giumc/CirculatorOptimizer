classdef (Abstract) TwoPortPassive < GetSetOptParam
    
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

    methods (Access=protected,Abstract)

            m = ABCD (obj,freq);

    end

    methods (Access=protected,Static)

        adm=y_in(m);

        imp=z_in(m);
        
        m=YshuntABCD(y);

    end

    methods
       
        function flag=isempty(obj)
       
            flag=isemptyobj(obj);
            
       end
       
   end
   
end
