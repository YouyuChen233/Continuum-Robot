function erg=dssCheck(in, theta,L0)
if abs(theta)<1e-4
    erg=L0;
else
    erg=in;
end
end