function [new_triangle] = triangle_unit(triangle1_base,triangle2_base,triangle1_heigth,triangle2_heigth,origin)
%move_triangle Move Triangle by XY vector
new_triangle = [0,0;...
    triangle1_base/2-triangle2_base/2,triangle1_heigth;...
    triangle1_base/2,triangle2_heigth+triangle1_heigth;...
    triangle1_base/2+triangle2_base/2,triangle1_heigth;
    triangle1_base,0];
new_triangle(:,1)= new_triangle(:,1)+origin(1);
new_triangle(:,2)= new_triangle(:,2)+origin(2);
end