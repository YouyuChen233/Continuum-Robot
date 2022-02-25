clc;  close all; %clear;
%Anzahl der Disks
pars.ndsk=6;
%Anzahl der Seilen
pars.nseil=1;
%Lage zum Beginn
pars.kappa0=ones(1,pars.ndsk)*(1e-12);
pars.m=1.7e-3*ones(1,pars.ndsk); %Masse des Disks
pars.g=0;
pars.E_seil=1e999;
pars.A_seil=1e-4;
pars.L0=0.02;% Segmentlänge Krümmung
pars.L1=(0.02-pars.L0)*0.5;% Segmentlänge Gerade
pars.L2=pars.L1;% Segmentlänge Gerade
pars.E=2.1e11;pars.Jxx=2.011e-14;% E-Modul, Massenträgheitsmoment des Cores
pars.r_h_wert=8e-3;%radialer Abstand der Bohrung
pars.Cb=1e-4;%Dampfung des Cores
pars.mu=0.01;%Reibungskoeffizient
pars.m_ext=0;
pars.r_ext_x=0;
pars.r_ext_y=0;
pars.r_ext_z=0;

pars.F_ext_x=0;
pars.F_ext_y=0;
pars.F_ext_z=0;
pars.M_ext_x=0;
pars.M_ext_y=0;
pars.M_ext_z=0;
pars.tau(1)=3;% Seilkraft
pars.tau(2)=0;% Seilkraft
pars.tau(3)=0;% Seilkraft
pars.tau(4)=0;% Seilkraft
pars.tau(5)=0;% Seilkraft
pars.tau(6)=0;% Seilkraft
pars.tau(7)=0;% Seilkraft
pars.tau(8)=0;% Seilkraft
pars.tau(9)=0;% Seilkraft
pars.tau(10)=0;% Seilkraft
pars.tau(11)=0;% Seilkraft
pars.tau(12)=0;% Seilkraft
%wie lange wird n-te Seile gezogen
pars.diffL(1)=0;
pars.diffL(2)=0;
pars.diffL(3)=0;
pars.diffL(4)=0;
pars.diffL(5)=0;
pars.diffL(6)=0;
pars.diffL(7)=-0.005967465037149;
pars.diffL(8)=0;
pars.diffL(9)=0;
pars.diffL(10)=0;
pars.diffL(11)=0;
pars.diffL(12)=0;
% Massenträgheit des Disks
pars.Ixx_lcl=1e-5*ones(1,pars.ndsk);
pars.Ixy_lcl=0*ones(1,pars.ndsk);
pars.Ixz_lcl=0*ones(1,pars.ndsk);
pars.Iyy_lcl=1e-5*ones(1,pars.ndsk);
pars.Iyx_lcl=0*ones(1,pars.ndsk);
pars.Iyz_lcl=0*ones(1,pars.ndsk);
pars.Izz_lcl=2e-5*ones(1,pars.ndsk);    
pars.Izx_lcl=0*ones(1,pars.ndsk);
pars.Izy_lcl=0*ones(1,pars.ndsk);
%wie viele Seile werden gezogen
pars.n_existT=0;
for i=1:pars.nseil
    if abs(pars.diffL(i))>0
        pars.n_existT=pars.n_existT+1;
    end
end
%Dicke des Disks
pars.DR(1)=0.008;pars.DL(1)=0.008;
pars.DR(2)=0.008;pars.DL(2)=0.008;
pars.DR(3)=0.008;pars.DL(3)=0.008;
pars.DR(4)=0.008;pars.DL(4)=0.008;
pars.DR(5)=0.008;pars.DL(5)=0.008;
pars.DR(6)=0.008;pars.DL(6)=0.008;
pars.DR(7)=0.008;pars.DL(7)=0.008;
pars.DR(8)=0.008;pars.DL(8)=0.008;
pars.DR(9)=0.008;pars.DL(9)=0.008;
pars.DR(10)=0.008;pars.DL(10)=0.008;
pars.DR(11)=0.008;pars.DL(11)=0.008;
pars.DR(12)=0.008;pars.DL(12)=0.008;
%Position-Winkel der Bohrung
pars.psi(1)=0;
pars.psi(2)=pi/2;
pars.psi(3)=pi;
pars.psi(4)=pi*3/2;
pars.psi(5)=0;
pars.psi(6)=pi/2;
pars.psi(7)=pi;
pars.psi(8)=pi*3/2;
pars.psi(9)=0;
pars.psi(10)=pi/2;
pars.psi(11)=pi;
pars.psi(12)=pi*3/2;
%Solver Option
options = optimoptions('fsolve','Display','iter');
options.Algorithm = "levenberg-marquardt";
options.MaxIterations = 1000;
options.MaxFunctionEvaluations = 500000000;
options.FunctionTolerance=1e-8;
options.StepTolerance=1e-8;
options.OptimalityTolerance=1e-8;
clear i;