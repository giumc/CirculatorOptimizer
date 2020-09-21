function set_coupledlines(obj,varargin)

    for i=1:width(obj.get_Z_coupled)
        
        obj.coupledlines(i)=CoupledMicrostrip(varargin{:});
        
    end

end
