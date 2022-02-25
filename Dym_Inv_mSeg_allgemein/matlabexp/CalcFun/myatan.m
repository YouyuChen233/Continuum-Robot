function erg=myatan(dd_dsk)
dd_sat=0.05;
% if isnan(dd_dsk)
%     dd_dsk=0;
% end
erg=atan(dd_dsk/dd_sat)/pi*2;
end