function out = mysign(start,now)
if start-now>1e-6
    out=-1;
elseif start-now<-1e-6
    out=1;
else
    out=0;
end
end

