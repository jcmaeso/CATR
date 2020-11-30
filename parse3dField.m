function [mat_field] = parse3dField(filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
file_data = importdata(filename);
raw_data = file_data.data;
field = [];
z_cut = [];
z_pos = [];
y_pos = [];
last_z = raw_data(1,3);

for i = 1:length(raw_data)
    if raw_data(i,1) == 0
       E = {};
       E.x = complex(raw_data(i,4),raw_data(i,5)); 
       E.y = complex(raw_data(i,6),raw_data(i,7));
       E.z = complex(raw_data(i,8),raw_data(i,9));
       z_cut = [z_cut E];
       y_pos = [y_pos raw_data(i,2)];
    end
    if raw_data(i,3) ~= last_z
        z_pos = [z_pos raw_data(i,3)];
        y_pos = [];
        last_z = raw_data(i,3);
        field = [field; z_cut];
        z_cut = [];
    end
end
mat_field = {};
mat_field.E = field;
mat_field.z = z_pos;
mat_field.y = y_pos;
end
