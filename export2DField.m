clc
clear

filename="catr_qz_vol.cst";
cst = actxserver('CSTStudio.Application');
mws = invoke(cst, 'OpenFile', fullfile(cd,'cst',filename));
SelectTreeItem = mws.invoke('SelectTreeItem','2D/3D Results\E-Field\e-field (f=60) [ffs]');

export = mws.invoke("ASCIIExport");
invoke(export,"Reset");
invoke(export,"FileName","320.txt");
invoke(export,"SetfileType","ASCII");
invoke(export,"Mode","Volume");
invoke(export,"Mode","FixedWidth");
invoke(export,"UseSubvolume","True");
invoke(export,"SetSubvolume","-50","50","0","100","200","250");
invoke(export,"StepX",50);
invoke(export,"StepY",0.1);
invoke(export,"StepZ",0.0625);
invoke(export,"Execute");

%% 

fid = fopen("test.txt");
tline = fgetl(fid);
historyCode = "";
y_field = [];
i = 0;
while ischar(tline)
    i = i+1;
    if i < 3
        tline = fgetl(fid);
        continue;
    end
    splitted_line = strsplit(tline," ");
    if splitted_line(2) == "0"
       y_field = [y_field str2double(splitted_line(7))+1j*str2double(splitted_line(8))];
    end
    tline = fgetl(fid);
end
