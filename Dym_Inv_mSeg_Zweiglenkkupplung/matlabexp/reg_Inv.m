clc;close all;
filenameDGL=sprintf('CalcFun\\DGL_mDisks_Inv.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = DGL_mDisks_Inv(y,pars)\n'));
fprintf(fileID,'unknown=zeros(pars.ndsk,1);\n');
fprintf(fileID,'L0=pars.L0; L1=pars.L1; L2=pars.L2;  E=pars.E; Jxx=pars.Jxx;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
for i=1:pars.ndsk
    tmp1=sprintf('m%d=pars.m(%d);\n',i,i);
    tmp2=sprintf('Ixx_lcl%d=pars.Ixx_lcl(%d);\n',i,i);
    tmp3=sprintf('Ixy_lcl%d=pars.Ixy_lcl(%d);\n',i,i);
    tmp4=sprintf('Ixz_lcl%d=pars.Ixz_lcl(%d);\n',i,i);
    tmp5=sprintf('Iyx_lcl%d=pars.Iyx_lcl(%d);\n',i,i);
    tmp6=sprintf('Iyy_lcl%d=pars.Iyy_lcl(%d);\n',i,i);
    tmp7=sprintf('Iyz_lcl%d=pars.Iyz_lcl(%d);\n',i,i);
    tmp8=sprintf('Izx_lcl%d=pars.Izx_lcl(%d);\n',i,i);
    tmp9=sprintf('Izy_lcl%d=pars.Izy_lcl(%d);\n',i,i);
    tmp10=sprintf('Izz_lcl%d=pars.Izz_lcl(%d);\n',i,i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
    fprintf(fileID,tmp5);
    fprintf(fileID,tmp6);
    fprintf(fileID,tmp7);
    fprintf(fileID,tmp8);
    fprintf(fileID,tmp9);
    fprintf(fileID,tmp10);    
end
for i=1:pars.nseil
    tmp1=sprintf('DR%d=pars.DR(%d);\n',i,i);
    tmp2=sprintf('DL%d=pars.DL(%d);\n',i,i);
    tmp3=sprintf('psi%d=pars.psi(%d);\n',i,i);
    tmp4=sprintf('tau%d=pars.tau(%d);\n',i,i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
end
for i=1:pars.ndsk
    tmp1=sprintf('kappa%d=y(%d);\n',i,i);
    tmp2=sprintf('dkappa%d=y(%d);\n',i,i+pars.ndsk);
    tmp3=sprintf('ddkappa%d=0;\n',i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);    
    fprintf(fileID,tmp3);
end
filename='dydt.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);
% Massen Matrix
filenameDGL='CalcFun\\Massen.m';
fileID=fopen(filenameDGL,'w');
fprintf(fileID,'function unknown = Massen(y,pars)\n');
fprintf(fileID,'L0=pars.L0; L1=pars.L1; L2=pars.L2;  E=pars.E; Jxx=pars.Jxx;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
for i=1:pars.ndsk
    tmp1=sprintf('m%d=pars.m(%d);\n',i,i);
    tmp2=sprintf('Ixx_lcl%d=pars.Ixx_lcl(%d);\n',i,i);
    tmp3=sprintf('Ixy_lcl%d=pars.Ixy_lcl(%d);\n',i,i);
    tmp4=sprintf('Ixz_lcl%d=pars.Ixz_lcl(%d);\n',i,i);
    tmp5=sprintf('Iyx_lcl%d=pars.Iyx_lcl(%d);\n',i,i);
    tmp6=sprintf('Iyy_lcl%d=pars.Iyy_lcl(%d);\n',i,i);
    tmp7=sprintf('Iyz_lcl%d=pars.Iyz_lcl(%d);\n',i,i);
    tmp8=sprintf('Izx_lcl%d=pars.Izx_lcl(%d);\n',i,i);
    tmp9=sprintf('Izy_lcl%d=pars.Izy_lcl(%d);\n',i,i);
    tmp10=sprintf('Izz_lcl%d=pars.Izz_lcl(%d);\n',i,i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
    fprintf(fileID,tmp5);
    fprintf(fileID,tmp6);
    fprintf(fileID,tmp7);
    fprintf(fileID,tmp8);
    fprintf(fileID,tmp9);
    fprintf(fileID,tmp10);    
end
for i=1:pars.nseil
    tmp1=sprintf('DR%d=pars.DR(%d);\n',i,i);
    tmp2=sprintf('DL%d=pars.DL(%d);\n',i,i);
    tmp3=sprintf('psi%d=pars.psi(%d);\n',i,i);
    tmp4=sprintf('tau%d=pars.tau(%d);\n',i,i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
end
for i=1:pars.ndsk
    tmp1=sprintf('kappa%d=y(%d);\n',i,i);
    tmp2=sprintf('dkappa%d=y(%d);\n',i,i+pars.ndsk);
    tmp3=sprintf('ddkappa%d=0;\n',i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);    
    fprintf(fileID,tmp3);
end
filename='M.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);

% % get Tension1
% filenameI='CalcFun\\getTension1.m';
% fileID=fopen(filenameI,'w');
% fprintf(fileID,'function unknown = getTension1(k1,k2,k3,k4,k5,dk1,dk2,dk3,dk4,dk5,pars)\n');
% fprintf(fileID,'m=pars.m;L0=pars.L0;E=pars.E;Jxx=pars.Jxx;Ixx_lcl=pars.Ixx_lcl;\n');
% fprintf(fileID,'Izz_lcl=pars.Izz_lcl;r_h_wert=pars.r_h_wert;tau1=pars.tau1;Cb=pars.Cb;mu=pars.mu;\n');
% for i=1:pars.nseil
%     tmp1=sprintf('DR%d=pars.DR%d;\n',i,i);
%     tmp2=sprintf('DL%d=pars.DL%d;\n',i,i);
%     tmp3=sprintf('psi%d=pars.psi%d;\n',i,i);
%     fprintf(fileID,tmp1);
%     fprintf(fileID,tmp2);
%     fprintf(fileID,tmp3);
% end
% filename='Tension1.txt';
% dydt1=importdata(filename);
% for i=1:1:size(dydt1,1)
%     str=cell2mat(dydt1(i));
%     expression='\(t\)';
%     replace='';
%     str = regexprep(str,expression,replace);
%     str = regexprep(str,expression,replace);
%     expression='(tau)([0-9])';
%     replace='F$2';
%     str = regexprep(str,expression,replace);
%     expression='(diff\(k)(\d)(, t\))';
%     replace='dk$2';
%     str = regexprep(str,expression,replace);
%     expression='mysign';
%     replace='mysat';
%     str = regexprep(str,expression,replace);
%     fprintf(fileID,'%s\n',str);
% end
% fprintf(fileID,'end');
% fclose(fileID);
clear ans dydt1 expression fileID filename filenameDGL filenameI i...
    replace str tmp*;
delete *.stats 

