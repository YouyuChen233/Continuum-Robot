clc;close all;
filenameDGL=sprintf('CalcFun\\DGL_mDisks_Inv_nonlinear.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = DGL_mDisks_Inv_nonlinear(y,pars,q)\n'));
fprintf(fileID,'L0=pars.L0;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; mu=pars.mu;\n');
fprintf(fileID,'EJxx=y(1); Cb=y(2);\n');
for i=1:pars.ndsk
    tmp1=sprintf('m%d=y(%d);\n',i,i+2);
    tmp2=sprintf('Ixx_lcl%d=y(%d);\n',i,i+2+pars.ndsk);
    tmp3=sprintf('Ixy_lcl%d=y(%d);\n',i,i+2+2*pars.ndsk);
    tmp4=sprintf('Ixz_lcl%d=y(%d);\n',i,i+2+3*pars.ndsk);
    tmp5=sprintf('Iyx_lcl%d=y(%d);\n',i,i+2+4*pars.ndsk);
    tmp6=sprintf('Iyy_lcl%d=y(%d);\n',i,i+2+5*pars.ndsk);
    tmp7=sprintf('Iyz_lcl%d=y(%d);\n',i,i+2+6*pars.ndsk);
    tmp8=sprintf('Izx_lcl%d=y(%d);\n',i,i+2+7*pars.ndsk);
    tmp9=sprintf('Izy_lcl%d=y(%d);\n',i,i+2+8*pars.ndsk);
    tmp10=sprintf('Izz_lcl%d=y(%d);\n',i,i+2+9*pars.ndsk);
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
    tmp4=sprintf('tau%d=0;\n',i);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
end
for i=1:pars.ndsk
    tmp1=sprintf('dlt_x%d=q(%d);\n',i,i*2-1);
    tmp2=sprintf('dlt_y%d=q(%d);\n',i,i*2);
    tmp3=sprintf('ddlt_x%d=q(%d);\n',i,i*2-1+2*pars.ndsk);
    tmp4=sprintf('ddlt_y%d=q(%d);\n',i,i*2+2*pars.ndsk);
    tmp5=sprintf('dddlt_x%d=q(%d);\n',i,i*2-1+4*pars.ndsk);
    tmp6=sprintf('dddlt_y%d=q(%d);\n',i,i*2+4*pars.ndsk);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);    
    fprintf(fileID,tmp3);
    fprintf(fileID,tmp4);
    fprintf(fileID,tmp5);    
    fprintf(fileID,tmp6);
end
filename='dydt.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);
% k_tau
filenameDGL='CalcFun\\k_tau.m';
fileID=fopen(filenameDGL,'w');
fprintf(fileID,'function unknown = k_tau(pars,q)\n');
fprintf(fileID,'L0=pars.L0;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; mu=pars.mu;\n');
for i=1:pars.nseil
    tmp1=sprintf('DR%d=pars.DR(%d);\n',i,i);
    tmp2=sprintf('DL%d=pars.DL(%d);\n',i,i);
    tmp3=sprintf('psi%d=pars.psi(%d);\n',i,i);    
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);
    fprintf(fileID,tmp3);    
end
for i=1:pars.ndsk
    tmp1=sprintf('dlt_x%d=q(%d);\n',i,i*2-1);
    tmp2=sprintf('dlt_y%d=q(%d);\n',i,i*2);
%     tmp3=sprintf('ddlt_x%d=q(%d);\n',i,i*2-1+2*pars.ndsk);
%     tmp4=sprintf('ddlt_y%d=q(%d);\n',i,i*2+2*pars.ndsk);
%     tmp5=sprintf('dddlt_x%d=q(%d);\n',i,i*2-1+4*pars.ndsk);
%     tmp6=sprintf('dddlt_y%d=q(%d);\n',i,i*2+4*pars.ndsk);
    fprintf(fileID,tmp1);
    fprintf(fileID,tmp2);    
%     fprintf(fileID,tmp3);
%     fprintf(fileID,tmp4);
%     fprintf(fileID,tmp5);    
%     fprintf(fileID,tmp6);
end
filename='k_tau.txt';
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);
clear ans dydt1 expression fileID filename* i...
    replace str tmp* kk;
delete *.stats 

