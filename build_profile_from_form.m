function [def_profile] = build_profile_from_form(form,repetition_factor)
%build_profile_from_form This function builds a profile from an input form
%with a repetition factor
%   Detailed explanation goes here

    %Create the profile
    profile_top = build_profile_side(form,repetition_factor);
    %retrive the lenght in x coordinate
    movement_dist = profile_top(end,1)-profile_top(1,1);
    %Build the equivalent profiles by rotating and moving
    profile_right = move_points(rotate_points(profile_top,90),[movement_dist,0]);
    profile_bottom = move_points(rotate_points(profile_right,90),[movement_dist,0]);
    profile_left = move_points(rotate_points(profile_bottom,90),[movement_dist,0]);
    def_profile = move_points([profile_top;profile_right;profile_bottom;profile_left],[-movement_dist/2,movement_dist/2]);
end


function [profile] = build_profile_side(form,repetitions)
%move_triangle Move Triangle by XY vector
    offset = ones(size(form)).*form(end,:);
    profile = form;
    for i = 1:repetitions-1
        new_form = form+i*offset;
        profile = [profile;new_form(2:end,:)];
    end
end

