clc;close all;
filename='CalcFun\\getE_pars.m';
fileID=fopen(filename,'w');
for i=1:pars.ndsk
    tmp1=sprintf('J{%d}=getI%d(y(i,:),pars);\n',i,i);
    fprintf(fileID,tmp1);
end
fprintf(fileID,'P=getP(y(i,:),pars);\n');   
fprintf(fileID,'P(4,:)=[];\n');    
fprintf(fileID,'omega=getOmega(y(i,:),pars);\n');
fprintf(fileID,'v=getV(y(i,:),pars);\n');
% getI
for kk=1:pars.ndsk
    fprintf(fileID,sprintf('function unknown = getI%d(y,pars)\n',kk));
    fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
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
        tmp1=sprintf('dlt_x%d=y(%d);\n',i,i*2-1);
        tmp2=sprintf('dlt_y%d=y(%d);\n',i,i*2);
        tmp3=sprintf('ddlt_x%d=y(%d);\n',i,i*2-1+2*pars.ndsk);
        tmp4=sprintf('ddlt_y%d=y(%d);\n',i,i*2+2*pars.ndsk);
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);
        fprintf(fileID,tmp3);
        fprintf(fileID,tmp4);
    end
    filename=sprintf('I%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    fprintf(fileID,'end\n');    
end


% getOmega
fprintf(fileID,'function unknown = getOmega(y,pars)\n');
fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
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
    tmp1=sprintf('dlt_x%d=y(%d);\n',i,i*2-1);
    tmp2=sprintf('dlt_y%d=y(%d);\n',i,i*2);
    tmp3=sprintf('ddlt_x%d=y(%d);\n',i,i*2-1+2*pars.ndsk);
    tmp4=sprintf('ddlt_y%d=y(%d);\n',i,i*2+2*pars.ndsk);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
end
filename='Omega.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end\n');


% getV
fprintf(fileID,'function unknown = getV(y,pars)\n');
fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
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
    tmp1=sprintf('dlt_x%d=y(%d);\n',i,i*2-1);
    tmp2=sprintf('dlt_y%d=y(%d);\n',i,i*2);
    tmp3=sprintf('ddlt_x%d=y(%d);\n',i,i*2-1+2*pars.ndsk);
    tmp4=sprintf('ddlt_y%d=y(%d);\n',i,i*2+2*pars.ndsk);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
end
filename='V.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end\n');
fclose(fileID);
clear ans dydt1 expression fileID filename* i replace...
    str tmp* kk;
delete *.stats