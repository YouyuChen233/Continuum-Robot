function out = mysign(in)
if in > 1e-6
    out=1;
elseif in < -1e-6
    out=-1;
else
    out=0;
end
end