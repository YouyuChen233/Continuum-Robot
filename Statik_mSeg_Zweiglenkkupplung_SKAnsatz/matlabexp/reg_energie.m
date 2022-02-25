clc;% close all;
% getT
for kk=1:pars.nseil
    filenameDGL=sprintf('CalcFun\\getTension%d.m',kk);
    fileID=fopen(filenameDGL,'w');
    fprintf(fileID,sprintf('function unknown = getTension%d(y,pars)\n',kk));
    fprintf(fileID,'L0=pars.L0; L1=pars.L1; L2=pars.L2; E=pars.E; Jxx=pars.Jxx;\n');
    fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
    fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
    fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
    fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
    fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
    fprintf(fileID,'kappa0=pars.kappa0; \n');
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
        fprintf(fileID,tmp1);               
    end
    filename=sprintf('Tension%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    fprintf(fileID,'end');
    fclose(fileID);
end

%getDelta_l
for kk=1:pars.nseil
    filenameDGL=sprintf('CalcFun\\getDelta_l%d.m',kk);
    fileID=fopen(filenameDGL,'w');
    fprintf(fileID,sprintf('function unknown = getDelta_l%d(y,pars)\n',kk));
    fprintf(fileID,'L0=pars.L0; L1=pars.L1; L2=pars.L2; E=pars.E; Jxx=pars.Jxx;\n');
    fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
    fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');   
    fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
    fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
    fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
    fprintf(fileID,'kappa0=pars.kappa0; \n');
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
        fprintf(fileID,tmp1);               
    end
    filename=sprintf('delta_l%d.txt',kk);
    dydt1=importdata(filename);
    for i=1:1:size(dydt1,1)
        str=cell2mat(dydt1(i));
        fprintf(fileID,'%s\n',str);
    end
    
    
%     fprintf(fileID,'for i=1:pars.ndsk\n');
%     fprintf(fileID,'    if abs(y(i))<1e-4\n');
%     fprintf(fileID,'        unknown(i)=0;\n');
%     fprintf(fileID,'    end\n');
%     fprintf(fileID,'end\n');
    fprintf(fileID,'end');
    fclose(fileID);
end





% getP
filenameDGL=sprintf('CalcFun\\getP.m');
fileID=fopen(filenameDGL,'w');
fprintf(fileID,sprintf('function unknown = getP(y,pars)\n'));
fprintf(fileID,'L0=pars.L0; L1=pars.L1; L2=pars.L2; E=pars.E; Jxx=pars.Jxx;\n');
fprintf(fileID,'g=pars.g; r_h_wert=pars.r_h_wert; Cb=pars.Cb; mu=pars.mu;\n');
fprintf(fileID,'E_seil=pars.E_seil;A_seil=pars.A_seil;\n');
fprintf(fileID,'m_ext=pars.m_ext; r_ext_x=pars.r_ext_x; r_ext_y=pars.r_ext_y; r_ext_z=pars.r_ext_z;\n');
fprintf(fileID,'F_ext_x=pars.F_ext_x; F_ext_y=pars.F_ext_y; F_ext_z=pars.F_ext_z; \n');
fprintf(fileID,'M_ext_x=pars.M_ext_x; M_ext_y=pars.M_ext_y; M_ext_z=pars.M_ext_z; \n');
fprintf(fileID,'kappa0=pars.kappa0; \n');
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
        fprintf(fileID,tmp1);                
end
filename=sprintf('P_%dDisks.txt',pars.ndsk);
dydt1=importdata(filename);
for i=1:1:size(dydt1,1)
    str=cell2mat(dydt1(i));    
    fprintf(fileID,'%s\n',str);
end
fprintf(fileID,'end');
fclose(fileID);



clear ans dydt1 expression fileID filename filenameDGL filenameI i replace str tmp* kk;
delete *.stats 