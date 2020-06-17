function m=multiABCD(c,freq)
    
    %circulator multifrequency ABCD matrix
    freqs=IMtones(freq,c.modratio.value*c.f_center,c.harmonics);

    ABCD.filt=diag(ones(c.n_freqs*2,1));

    for k=1:c.design.order

        if k==c.design.order

            c.design.cell(k).ind=c.design.cell(k).q*...                                      
                                    c.loadimpedance/...
                                    (2*pi*c.design.cell(k).fres);
            c.design.cell(k).cap=1/(2*pi*c.design.cell(k).fres)^2/...
                      c.design.cell(k).ind;
            c.cave=c.design.cell(k).cap;
                  ABCD.cell(k).ind=inductormat_s(c,...
                c.design.cell(k).ind);
            ABCD.cell(k).tot=ABCD.cell(k).ind.mat ;

        elseif mod(c.design.order-k,2)==1 %% shunt resonator
        c.design.cell(k).ind=c.loadimpedance/...
                                c.design.cell(k).q/... 
                                (2*pi*c.design.cell(k).fres);
        c.design.cell(k).cap=1/(2*pi*c.design.cell(k).fres)^2/...
                      c.design.cell(k).ind;
        ABCD.cell(k).ind=inductormat_p(c,c.design.cell(k).ind);
        ABCD.cell(k).cap=capacitormat_p(c,c.design.cell(k).cap);
        ABCD.cell(k).tot= ABCD.cell(k).ind.mat * ...
                            ABCD.cell(k).cap.mat;

        elseif mod(c.design.order-k,2)==0 %%series resonator
            c.design.cell(k).ind=c.design.cell(k).q*...                                      
                                    c.loadimpedance/...
                                    (2*pi*c.design.cell(k).fres);
            c.design.cell(k).cap=1/(2*pi*c.design.cell(k).fres)^2/...
                      c.design.cell(k).ind;
            ABCD.cell(k).ind=inductormat_s(c,c.design.cell(k).ind);
            ABCD.cell(k).cap=capacitormat_s(c,c.design.cell(k).cap);
            ABCD.cell(k).tot= ABCD.cell(k).ind.mat *...
                                ABCD.cell(k).cap.mat ;
        else
        end
        %keyboard;
        ABCD.filt=ABCD.filt*ABCD.cell(k).tot;
    end
        %keyboard();
        ABCD.var{1}=varactormat_s(c,1);
        ABCD.var{2}=varactormat_s(c,2);
        ABCD.var{3}=varactormat_s(c,3);
        ABCD.loadres=resistormat_p(c,c.loadimpedance);
        ABCD.toground=ABCD.var{2}.mat*ABCDinverse(ABCD.filt)*ABCD.loadres.mat;
        ABCD.shuntdyn=Zshuntmat(c,ABCD.toground);
        ABCD.branch=ABCD.filt*ABCD.var{1}.mat;
        ABCD.branchrev=ABCD.var{3}.mat*ABCDinverse(ABCD.filt);
        ABCD.tot=...
                   ABCD.branch...
                  *ABCD.shuntdyn.ABCDshuntEq...
                  *ABCD.branchrev;
end
 
c.ABCD=ABCD;
end
