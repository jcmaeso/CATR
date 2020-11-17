function [] = simulationSetup(mws,command,filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filename);
tline = fgetl(fid);
historyCode = "";
while ischar(tline)
    historyCode = strjoin([historyCode,tline],'\n');
    tline = fgetl(fid);
end
%fprintf("%s",historyCode);
addToCstHistory(mws,command,historyCode);
fclose(fid);
end

