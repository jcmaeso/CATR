frequency = 30:10:120;
lambda = round(0.25*0.3./frequency*1e6);
gcd_res = gcd(lambda(1),lambda(2));
for i = 3:length(frequency)
     gcd_res = gcd(lambda(i),gcd_res);
end
