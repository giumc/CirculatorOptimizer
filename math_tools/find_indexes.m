function idx=find_indexes(f_array,f_test)

    idx=[];

    for i=1:length(f_array)

        [~,idx(i)]=min(abs(f_test-f_array(i)));

    end

    idx=unique(idx);

end
