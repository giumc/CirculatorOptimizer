tic;
d.calculate_S_lin_response;
toc;

tic;
x=d.get_opt_norm_values;
d.update_opt_norm_values(x);
toc;
tic;
d.calculate_S_lin_response;
toc;
