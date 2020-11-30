clc;
clear;

filename="catr_qz_vol.cst";
cst = actxserver('CSTStudio.Application');
mws = invoke(cst, 'OpenFile', fullfile(cd,'cst',filename));
stepX = 50;
stepY = 0.1;


for i=30:10:120
    lambda4 = 25*(3e-1/i);
    export_file_name = fullfile(cd,'qz',sprintf("qz_%d.txt",i));
    SelectTreeItem = mws.invoke('SelectTreeItem',sprintf('2D/3D Results\\E-Field\\e-field (f=%d) [ffs]',i));
    export = mws.invoke("ASCIIExport");
    invoke(export,"Reset");
    invoke(export,"FileName",export_file_name);
    invoke(export,"SetfileType","csv");
    invoke(export,"SetCsvSeparator",";");
    invoke(export,"Mode","Volume");
    invoke(export,"Mode","FixedWidth");
    invoke(export,"UseSubvolume","True");
    invoke(export,"SetSubvolume","-50","50","0","100","200","250");
    invoke(export,"StepX",stepX);
    invoke(export,"StepY",stepY);
    invoke(export,"StepZ",lambda4);
    invoke(export,"Execute");
end
%Clean Up
invoke(mws,'quit');
delete(export);
delete(cst);

%% Parse to matlab matrix
for i=30:10:120
    qz = parse3dField(fullfile(cd,"qz",sprintf("qz_%d.csv",i)));
    save(fullfile(cd,"qz",sprintf("qz_%d.mat",i)),"qz")
end