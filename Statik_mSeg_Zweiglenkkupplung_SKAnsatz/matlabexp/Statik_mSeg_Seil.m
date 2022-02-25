clc;close all;
%Gleichungen erstellen, Parameter INIT
INIT;
reg_Seil_Kin;
reg_energie;
%Lösung INIT
q_erg=zeros(pars.ndsk+pars.n_existT,20);
%Risiduum INIT
R=zeros(20,1);
%Anfangswerte
q0=ones(pars.ndsk+pars.n_existT,1)*0.5;
%Solver
for i=1:20
    [q_erg(:,i),fval]=fsolve(@(q)DGL_mDisks_Seil(q,pars),q0,options);
    R(i)=sum(sum(fval.*fval));
    q0=q0+0.1;
end
%Plot
[mini,index]=min(R);
P=getP(q_erg(:,index),pars);
P(4,:)=[];
plot3(P(1,:),P(2,:),P(3,:),'-*');
grid on;
xlabel('X-Achse');
ylabel('Y-Achse');
zlabel('Z-Achse');
axis([-1 1 -1 1 0 2]);
clear i options q0;

