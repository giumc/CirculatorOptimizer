classdef OptCap <  OptParam & OnePortPassive
    
   % optimizable capacitor
   properties (Access=private,Constant)

       def_cap=1e-12;
   
   end

    methods

    function obj=OptCap(varargin)

        obj=obj@OptParam(varargin{:});

        obj.unit='Farad';

        obj.label='Cap';

    end

        function imp=z(obj,freq)
            imp=diag(1 ./ (1i * 2 * pi * freq *obj.value ));

        end

        function adm=y(obj,freq)
            adm = inv(obj.z(freq));
        end

        function OptParam=get_OptParam(obj)

            OptParam=[];

            if obj.optimizable

                OptParam=obj;

            end

        end

    end

end
