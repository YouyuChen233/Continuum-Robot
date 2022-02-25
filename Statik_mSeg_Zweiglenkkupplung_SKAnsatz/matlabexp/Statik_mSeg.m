clc;close all;
%Gleichungen erstellen, Parameter INIT
addpath("CalcFun");
INIT;
reg_Inv;
reg_energie;
%Lösung INIT
q_erg=zeros(pars.ndsk,20);
%Risiduum INIT
R=zeros(20,1);
%Anfangswerte
q0=ones(pars.ndsk,1)*0.1;
%Solver
for i=1:20
    [q_erg(:,i),fval]=fsolve(@(q)DGL_mDisks_Inv(q,pars),q0,options);
    R(i)=sum(sum(fval.*fval));
    q0=q0+0.1;
end
theta_Starr=q_erg*pars.L0;
%Plot
[mini,index]=min(R);
P=getP(q_erg(:,index),pars);
P(4,:)=[];
plot3(P(1,:),P(2,:),P(3,:),'-*');
grid on;
hold on;
xlabel('X-Achse');
ylabel('Y-Achse');
zlabel('Z-Achse');
axis([-0.2 0.2 -0.3 0.3 -0.3 0.3]);
%
clear i options q0 Tension*;
Tension1=getTension1(q_erg(:,index),pars);
%Tension7=getTension7(q_erg(:,index),pars);
%Delta_l7=sum(getDelta_l7(q_erg(:,index),pars));
rmpath("CalcFun");
