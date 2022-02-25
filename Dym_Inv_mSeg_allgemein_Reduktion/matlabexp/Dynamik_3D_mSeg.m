clc;close all;
% Initialisieren
INIT;
reg_Inv;
reg_energie;
tspan=0:0.01:50;
%Option für Energiekonsistanz Test
E_test=1;
%Anfangswert
if E_test==0
    y0=zeros(4*pars.same,1);
    pars.tau=zeros(1,pars.nseil);
    for i=1:2*pars.same
        if mod(i,2)==1
            y0(i)=pi/6*pars.r_h_wert;
        else
            y0(i)=pi/4*pars.r_h_wert;
        end
    end
else
    y0=zeros(4*pars.same,1);
    for i=1:4*pars.same
        if mod(i,2)==1
            y0(i)=1e-6*pi/6*pars.r_h_wert;
        else
            y0(i)=1e-6;
        end
    end
end

%Solver

odefun = @(t,y)([y(2*pars.same+1:pars.same*4);-Massen(y,pars)\(DGL_mDisks_Inv(y,pars))]);%;zeros(5,1)]);
[t,y]=ode45(odefun, tspan, y0);
%q-Parametisierung nach alpha-Parametisierung umrechnen
phi=zeros(size(y,1),pars.same);
kappa=zeros(size(y,1),pars.same);
for i=1:size(y,1)
    for ii=1:pars.same
        %phi(i,ii)=atan2((y(i,ii*2)^2),(y(i,ii*2-1)^2));
        phi(i,ii)=atan2((y(i,ii*2)),(y(i,ii*2-1)));
        kappa(i,ii)=sqrt((y(i,ii*2)^2)+(y(i,ii*2-1)^2))/pars.r_h_wert/pars.L0;
    end
end
phi_full=zeros(size(y,1),pars.ndsk);
kappa_full=zeros(size(y,1),pars.ndsk);
for i=1:pars.same
    for ii=(pars.nsame(i)+1):pars.nsame(i+1)
        phi_full(:,ii)=phi(:,i);
        kappa_full(:,ii)=kappa(:,i);
    end
end
E_p=zeros(size(y,1),1);         %Potentielle Energie
E_k=zeros(size(y,1),1);         %Kinetische Energie
E_sum=zeros(size(y,1),1);       %Summe der Energie
%y1 bis y5 sind k1 bis k5, y6 bis y10 sind dk1 bis dk5
for i=1:size(y,1)    
    %Globale Massenträgheitstensor 
    getE_pars;    
    %Potentielle Energie berechnen
    for ii=1:pars.ndsk
        E_p(i)=E_p(i)+0.5*pars.E*pars.Jxx*(kappa_full(i,ii)^2)*pars.L0;
    end
    %Kinetische Energie berechnen
    for ii=1:pars.ndsk
        E_k(i)=E_k(i)+0.5*pars.m(ii)*v(:,ii)'*v(:,ii)+0.5*omega(:,ii)'*J{ii}*omega(:,ii);
    end
    %Summe der Energie berechnen
    E_sum(i)=E_p(i)+E_k(i);
end
if E_test==1
plot(t,E_k,t,E_p,t,E_sum)
legend('Ekin','Epot','Eges')

else
% Dynamik Plot
PE_all=zeros(3,size(y,1));
for i=1:size(y,1)
    P=getP(y(i,:),pars);
    P(4,:)=[];
    PE_all(:,i)=P(:,pars.ndsk);
    P(:,2:pars.ndsk+1)=P;
    P(:,1)=[0;0;0];
%     plot3(P(1,:),P(2,:),P(3,:),'-*');
%     grid on;
%     axis([-1 1 -1 1 0 1]);
%     ylabel("Y-Achse");
%     xlabel("X-Achse");
%     view([10,10]);
%     pause(0.001);
%     frame=getframe(gcf);
%     imind=frame2im(frame);
%     [imind,cm] = rgb2ind(imind,256);
%     if i==1
%         imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf,'DelayTime',1e-4);
%     else
%         imwrite(imind,cm,'test.gif','gif','WriteMode','append','DelayTime',1e-4);
%     end
end
end
clear E_test i ii J omega P  tspan v y0;




