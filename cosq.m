function [Etheta,Ephi] = cosq(Theta,Phi,q)
%cosq Create Cosq in theta-Phi
%   Detailed explanation goes here
Etheta=cosd(Theta/2).^q.*sind(Phi);
Ephi=cosd(Theta/2).^q.*cosd(Phi);
end

