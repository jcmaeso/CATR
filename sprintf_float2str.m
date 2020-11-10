function[ret] = sprintf_float2str(num)
    if isa(num,'string')
        ret = num;
    else
        ret = sprintf("%f",num);
    end
end