filename_template = "catr_%f.cst";
freq_list = 30:120;
time_list = [];
%create
for i = 1:length(freq_list)
    model_fun(fullfile(cd,sprintf(filename_template,freq_list(i))),freq_list(i),[200,225,250])
end
%Simulate
for i = 1:length(freq_list)
    tic;
    startSimulation(fullfile(cd,sprintf(filename_template,freq_list(i))))
    time_list = [time_list toc];
    fprintf("F: %f t:%f",freq_list(i),time_list(end));
end
save("time_list");
