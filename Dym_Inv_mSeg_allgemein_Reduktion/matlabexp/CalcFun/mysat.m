function erg=mysat(dd_dsk)
dd_sat=0.05;
% if isnan(dd_dsk)
%     dd_dsk=0;
% end
if abs(dd_dsk/dd_sat)<=1
    erg=dd_dsk/dd_sat;
else
    erg=sign(dd_dsk);
end
end