clc;close all;
%Gleichungen erstellen, Parameter INIT
INIT;
reg_Seil_Kin;
%Lösung INIT
q_erg=zeros(2*pars.same+pars.n_existT,20);
%Risiduum INIT
R=zeros(20,1);
%Anfangswerte
q0=zeros(2*pars.same+pars.n_existT,1);
for i=1:2*pars.same
    if mod(i,2)==1
        q0(i)=pi/6*pars.r_h_wert;
    else
        q0(i)=0.001;
    end
end
for i=1:pars.n_existT
    q0(i+2*pars.same)=0.5;
end
%Solver
for i=1:20
    [q_erg(:,i),fval]=fsolve(@(q)DGL_mDisks_Seil(q,pars),q0,options);
    R(i)=sum(sum(fval.*fval));
    q0=q0+0.1;
end
%Plot
[mini,index]=min(R);
P=getResult(q_erg(:,index),pars);
P(4,:)=[];
plot3(P(1,:),P(2,:),P(3,:),'-*');
view(0,0);
grid on;
xlabel('X-Achse');
ylabel('Y-Achse');
zlabel('Z-Achse');
axis([-1 1 -1 1 0 1]);
%q-Parametisierung nach alpha-Parametisierung umrechnen
q_erg=q_erg';
phi=zeros(size(q_erg,1),pars.same);
kappa=zeros(size(q_erg,1),pars.same);
for i=1:size(q_erg,1)
    for ii=1:pars.same
        phi(i,ii)=atan2((q_erg(i,ii*2)),(q_erg(i,ii*2-1)));
        kappa(i,ii)=sqrt((q_erg(i,ii*2)^2)+(q_erg(i,ii*2-1)^2))/pars.r_h_wert/pars.L0;
    end
end
phi_full=zeros(size(q_erg,1),pars.ndsk);
kappa_full=zeros(size(q_erg,1),pars.ndsk);
for i=1:pars.same
    for ii=(pars.nsame(i)+1):pars.nsame(i+1)
        phi_full(:,ii)=phi(:,i);
        kappa_full(:,ii)=kappa(:,i);
    end
end
clear i ii q0 options pars phi kappa fval;
