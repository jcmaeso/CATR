filename_template = "catr_%d.cst";
freq_list = 10:10:120;
time_list = [];
%mesh_options = [4,2;1.5,1;0.4,1];
mesh_options = [5,2;5,2;4,2];
folder = fullfile("cst","sonda");
%Create
for i = 1:length(freq_list)
    %model_fun(fullfile(cd,folder,sprintf(filename_template,freq_list(i))),freq_list(i),[200,225,250,275,300],mesh_options(i,:),"low","asymp",fullfile(pwd,"sonda_30GHz.ffs"))
    model_fun(fullfile(cd,folder,sprintf(filename_template,freq_list(i))),freq_list(i),[200,225,250,275,300],mesh_options(1),"low","asymp",fullfile(pwd,"sonda_30GHz.ffs"))
end

% Simulate
% for i = 1:length(freq_list)
%     tic;
%     startSimulationf(fullfile(cd,sprintf(filename_template,freq_list(i))))
%     time_list = [time_list toc];
%     fprintf("F: %f t:%f",freq_list(i),time_list(end));
% end
% save("time_list");

function [] = startSimulationf(filename)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cst = actxserver('CSTStudio.Application');
mws = invoke(cst, 'OpenFile', fullfile(cd,folder,filename));
solver = invoke(mws, 'FDSolver');
invoke(solver, 'start');
mws.invoke('quit');
end
