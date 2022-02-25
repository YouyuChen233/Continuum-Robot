clc;close all;
% Initialisieren
INIT;
reg_Inv;
reg_energie;
tspan=0:0.1:50;
E_test=1;
%Anfangswert
if E_test==1
    y0=zeros(2*pars.ndsk,1);
    pars.tau=zeros(1,pars.nseil);
    for i=1:pars.ndsk
        if mod(i,2)==1
            y0(i)=8;
        else
            y0(i)=6;
        end
    end   
else
    y0=zeros(2*pars.ndsk,1);
    y0(1:pars.ndsk)=1e-4;
end
%%
%y1 bis y5 sind k1 bis k5, y6 bis y10 sind dk1 bis dk5
odefun = @(t,y)([y(pars.ndsk+1:pars.ndsk*2);-Massen(y,pars)\DGL_mDisks_Inv(y,pars)]);%;zeros(5,1)]);
[t,y]=ode45(odefun, tspan, y0);
E_p=zeros(size(y,1),1);         %Potentielle Energie
E_k=zeros(size(y,1),1);         %Kinetische Energie
E_sum=zeros(size(y,1),1);       %Summe der Energie
%y1 bis y5 sind k1 bis k5, y6 bis y10 sind dk1 bis dk5
for i=1:size(y,1)
    %get Position
    P=getP(y(i,:),pars);
    P(4,:)=[];
    %Globale Massenträgheitstensor (mit Satz von Steiner)
    getJ;
    %get globale Winkelgeschwindigkeit
    omega=getOmega(y(i,:),pars);
    %get globale Geschwindigkeit
    v=getV(y(i,:),pars);
    %Potentielle Energie berechnen
    for ii=1:pars.ndsk              
        theta(i,ii)=2*atan(pars.L0*0.5*y(i,ii));        
        x=theta(i,ii);
        E_p(i)=E_p(i)+pars.E*pars.Jxx/pars.L0*2*log(0.1e1 + tan(x / 0.2e1) ^ 2);
        %E_p(i)=E_p(i)+0.5*pars.E*pars.Jxx*(y(i,ii)^2)*k_l(i,ii);
    end
    %Kinetische Energie berechnen
    for ii=1:pars.ndsk
        E_k(i)=E_k(i)+0.5*pars.m(ii)*v(:,ii)'*v(:,ii)+0.5*omega(:,ii)'*J{ii}*omega(:,ii);
    end
    %Summe der Energie berechnen
    E_sum(i)=E_p(i)+E_k(i);
end
plot(t,E_k,t,E_p,t,E_sum)
legend('Ekin','Epot','Eges')
%%

% % % Dynamik Plot
% for i=1:1000
%     P=getP(y(i,:),pars);%     
%     P(4,:)=[];
%     plot3(P(1,:),P(2,:),P(3,:),'-*');  
%     grid on;
%     axis([-1 1 -1 1 0 1]);
%     ylabel("Y-Achse");
%     xlabel("X-Achse");
%     pause(0.001);
% end





