function [] = meshSetup(mws,command,filename,mesh_props)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filename);
tline = fgetl(fid);
historyCode = "";
while ischar(tline)
    historyCode = strjoin([historyCode,tline],'\n');
    tline = fgetl(fid);
end
historyCode = sprintf(historyCode,mesh_props);
addToCstHistory(mws,command,historyCode);
fclose(fid);
end