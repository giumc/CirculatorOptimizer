function flag=isemptyobj(obj)

        if builtin('isempty',obj)

            flag=true;

        else

            if ~isvalid(obj)

                flag=true;

            else

                flag=false;

            end

        end

   end
