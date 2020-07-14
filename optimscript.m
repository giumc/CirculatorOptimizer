clear all
close all
clc

%%

circ_bandwidth=0.1;

max_order=5;

for i=1:max_order
    
    circ=StarCirc('order',i,'bandwidth',circ_bandwidth,...
        'type',"full");
    
    circ.optim_routine;
    
    circ.save_data;
    
    delete(circ)
    
end
