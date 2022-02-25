clc;
%Gleichungen erstellen, Parameter INIT
INIT;
reg_Inv;
%Lösung INIT
q_erg=zeros(2*pars.ndsk,20);
%Risiduum INIT
R=zeros(20,1);
%Anfangswerte
q0=zeros(2*pars.ndsk,1);
for i=1:2*pars.ndsk
    if mod(i,2)==1
        q0(i)=pi/6*pars.r_h_wert;
    else
        q0(i)=0.001;
    end
end
%Solver
for i=1:20
    [q_erg(:,i),fval]=fsolve(@(q)DGL_mDisks_Inv(q,pars),q0,options);
    R(i)=sum(sum(fval.*fval));
    q0=q0+i*0.1;
end
%Plot
[mini,index]=min(R);
[P, Tension, Delta_l]=getResult(q_erg(:,index),pars);
P(4,:)=[];
plot3(P(1,:),P(2,:),P(3,:),'-*');
grid on;
xlabel('X-Achse');
ylabel('Y-Achse');
zlabel('Z-Achse');
axis([-0.2 0.2 -0.2 0.2 0 0.2]);
hold on;
%q-Parametisierung nach alpha-Parametisierung umrechnen
q_erg=q_erg';
phi=zeros(size(q_erg,1),pars.ndsk);
kappa=zeros(size(q_erg,1),pars.ndsk);
for i=1:size(q_erg,1)
    for ii=1:pars.ndsk
        phi(i,ii)=atan2((q_erg(i,ii*2)),(q_erg(i,ii*2-1)));
        kappa(i,ii)=sqrt((q_erg(i,ii*2)^2)+(q_erg(i,ii*2-1)^2))/pars.r_h_wert/pars.L0;
    end
end
clear i ii q0;