function erg=mysat(dd_dsk)
% Sat-Funktion für das Reibmodell
dd_sat=0.05;
if abs(dd_dsk/dd_sat)<=1
    erg=dd_dsk/dd_sat;
else
    erg=sign(dd_dsk);
end
end