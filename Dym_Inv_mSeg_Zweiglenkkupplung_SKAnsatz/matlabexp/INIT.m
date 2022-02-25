clc; close all; clear;
pars.ndsk=6;                            % Anzahl der Disks
pars.nseil=9;                           % Anzahl der Seilen
pars.m=1.699e-0*ones(1,pars.ndsk);      % Masse des Disks
pars.L0=0.08;                           % Segmentlänge
pars.L1=0.01; 
pars.L2=0.01; 
pars.E=2.1e11;pars.Jxx=2.011e-14;       % E-Modul, Massenträgheitsmoment des Cores
pars.g=0;                            % Beschleunigung der Gravitation
pars.r_h_wert=8e-3;                     % radialer Abstand der Bohrung
pars.Cb=0;                              % Dampfung des Cores
pars.mu=0;                           % Reibungskoeffizient
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
% Seilkraft
pars.tau(1)=0;       
pars.tau(2)=0;  
pars.tau(3)=0;       
pars.tau(4)=0;       
pars.tau(5)=0;    
pars.tau(6)=1;     
pars.tau(7)=0;     
pars.tau(8)=0;     
pars.tau(9)=0;     
pars.tau(10)=0;    
pars.tau(11)=0;    
pars.tau(12)=0; 
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
%Dicke des Disks
pars.DR(1)=0.02;pars.DL(1)=0.03;
pars.DR(2)=0.02;pars.DL(2)=0.03;
pars.DR(3)=0.02;pars.DL(3)=0.03;
pars.DR(4)=0.02;pars.DL(4)=0.03;
pars.DR(5)=0.02;pars.DL(5)=0.03;
pars.DR(6)=0.02;pars.DL(6)=0.03;
pars.DR(7)=0.02;pars.DL(7)=0.03;
pars.DR(8)=0.02;pars.DL(8)=0.03;
pars.DR(9)=0.02;pars.DL(9)=0.03;
pars.DR(10)=0.02;pars.DL(10)=0.03;
pars.DR(11)=0.02;pars.DL(11)=0.03;
pars.DR(12)=0.02;pars.DL(12)=0.03;
%Position-Winkel der Bohrung
pars.psi(1)=0;
pars.psi(2)=pi;
pars.psi(3)=pi/4;
pars.psi(4)=-pi/2;
pars.psi(5)=0;
pars.psi(6)=0;
pars.psi(7)=pi;
pars.psi(8)=-pi/2;
pars.psi(9)=0;
pars.psi(10)=pi/2;
pars.psi(11)=pi;
pars.psi(12)=-pi/2;