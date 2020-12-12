filename_template = "catr_%d.cst";
folder = 'multifreq_pinchos2_low';
freq_list = [30,80,120];
time_list = [];
mesh_options = [4,2;1.5,1;0.4,1];
%Create
for i = 1:length(freq_list)
    model_fun(fullfile(cd,folder,sprintf(filename_template,freq_list(i))),freq_list(i),[200,225,250],mesh_options(i,:),"low");
end

% Simulate
% for i = 1:length(freq_list)
%     tic;
%     startSimulationf(fullfile(sprintf(filename_template,freq_list(i))),folder)
%     time_list = [time_list toc];
%     fprintf("F: %f t:%f",freq_list(i),time_list(end));
% end
save("time_list");

function [] = startSimulationf(filename,folder)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cst = actxserver('CSTStudio.Application');
mws = invoke(cst, 'OpenFile', fullfile(cd,folder,filename));
solver = invoke(mws, 'FDSolver');
invoke(solver, 'start');
mws.invoke('quit');
end
