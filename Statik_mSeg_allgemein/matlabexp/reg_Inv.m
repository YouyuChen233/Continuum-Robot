clc;close all;
% getGleichungssystem
filenameDGL=sprintf('CalcFun\\DGL_mDisks_Inv.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = DGL_mDisks_Inv(y,pars)\n'));
fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
fprintf(fileID,'kappa0=pars.kappa0; varphi0=pars.varphi0; \n');
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
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
end
filename='dydt.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end\n');
fclose(fileID);

% getResult
filenameDGL=sprintf('CalcFun\\getResult.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function [unknown, Tension, Delta_l] = getResult(y,pars)\n'));
fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
fprintf(fileID,'kappa0=pars.kappa0; varphi0=pars.varphi0; \n');
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
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
end
filename=sprintf('P_%dDisks.txt',pars.ndsk);
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'Tension=zeros(pars.nseil,pars.ndsk);\n');
for i=1:pars.nseil
    fprintf(fileID,'Tension(%d,:)=getTension%d(y,pars);\n',i,i);
end
fprintf(fileID,'Delta_l=zeros(pars.nseil,pars.ndsk);\n');
for i=1:pars.nseil
    fprintf(fileID,'if abs(pars.tau(%d))>1e-6\n',i);
    fprintf(fileID,'Delta_l(%d,:)=getDelta_l%d(y,pars);\n',i,i);
    fprintf(fileID,'end\n');
end
fprintf(fileID,'end\n');
% getT
for kk=1:pars.nseil    
    fprintf(fileID,sprintf('function unknown = getTension%d(y,pars)\n',kk));
    fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
    fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
    fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
    fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
    fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
    fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
    fprintf(fileID,'kappa0=pars.kappa0; varphi0=pars.varphi0; \n');
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);
    end
    filename=sprintf('Tension%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    fprintf(fileID,'end\n');
    
end

%getDelta_l
for kk=1:pars.nseil    
    fprintf(fileID,sprintf('function unknown = getDelta_l%d(y,pars)\n',kk));
    fprintf(fileID,'L0=pars.L0; E=pars.E; Jxx=pars.Jxx;\n');
    fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
    fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
    fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
    fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
    fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
    fprintf(fileID,'kappa0=pars.kappa0; varphi0=pars.varphi0; \n');
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
        fprintf(fileID,tmp1);
        fprintf(fileID,tmp2);
    end
    filename=sprintf('delta_l%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    fprintf(fileID,'end\n');
    
end
fclose(fileID);
clear ans dydt1 expression fileID filename* i...
    replace str tmp* kk;
delete *.stats 

