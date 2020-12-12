function [] = startSimulation(filename)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cst = actxserver('CSTStudio.Application');
mws = invoke(cst, 'OpenFile', fullfile(cd,'multifreq',filename));
solver = invoke(mws, 'FDSolver');
invoke(solver, 'start');
mws.invoke('quit');
end

