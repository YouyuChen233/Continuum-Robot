clc;close all;
% getI
for kk=1:pars.ndsk
    filenameDGL=sprintf('CalcFun\\getI%d.m',kk);
    fileID=fopen(filenameDGL,'w');
    fprintf(fileID,sprintf('function unknown = getI%d(y,pars)\n',kk));
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);        
    end
    filename=sprintf('I%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    fprintf(fileID,'end');
    fclose(fileID);
end


% getOmega
filenameDGL='CalcFun\\getOmega.m';
fileID=fopen(filenameDGL,'w');
fprintf(fileID,'function unknown = getOmega(y,pars)\n');
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);        
end
filename='Omega.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);

% getV
filenameDGL='CalcFun\\getV.m';
fileID=fopen(filenameDGL,'w');
fprintf(fileID,'function unknown = getV(y,pars)\n');
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);        
end
filename='V.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);

% getP
filenameDGL=sprintf('CalcFun\\getP.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = getP(y,pars)\n'));
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);        
end
filename=sprintf('P_%dDisks.txt',pars.ndsk);
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);


filename='CalcFun\\getJ.m';
fileID=fopen(filename,'w');
for i=1:pars.ndsk
    tmp1=sprintf('J{%d}=getI%d(y(i,:),pars);\n',i,i);
    fprintf(fileID,tmp1);
end
fclose(fileID);
clear ans dydt1 expression fileID filename filenameDGL filenameI i replace...
    str tmp* kk;
delete *.stats 