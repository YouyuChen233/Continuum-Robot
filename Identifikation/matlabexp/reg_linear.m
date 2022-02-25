clc;close all;
filenameDGL=sprintf('CalcFun\\DGL_mDisks_Inv_linear.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = DGL_mDisks_Inv_linear(pars,q)\n'));

fprintf(fileID,'L0=pars.L0;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; mu=pars.mu;\n');
% fprintf(fileID,'EJxx=y(1); Cb=y(2);\n');

% for i=1:pars.nseil
%     tmp1=sprintf('DR%d=pars.DR(%d);\n',i,i);
%     tmp2=sprintf('DL%d=pars.DL(%d);\n',i,i);
%     tmp3=sprintf('psi%d=pars.psi(%d);\n',i,i);
%     tmp4=sprintf('tau%d=0;\n',i);
%     fprintf(fileID,tmp1);
%     fprintf(fileID,tmp2);
%     fprintf(fileID,tmp3);
%     fprintf(fileID,tmp4);
% end
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
filename='Dsgn.txt';
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

