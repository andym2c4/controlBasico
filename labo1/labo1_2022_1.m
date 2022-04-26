%% Parametros
c1=1;%capacitancias area de la seccion
c2=1;
r1=7;%resistencia
r2=6;
q=1.11;%caudal maximo de la fuente, bomba presurizadora 
tmax=60;
dt=1;
t=0:dt:tmax;
%variables:
h1=zeros(1,length(t));
h2=zeros(1,length(t));
q1=zeros(1,length(t));
q2=zeros(1,length(t));
%inicializando:
h1(1)=0;h2(1)=0;q1(1)=0;q2(1)=0;
%% Ecuaciones
for n=2:length(t)
    h1(n)=(r1*c1*h1(n-1)+r1*c2*h2(n-1)/(r1+r2+r1*r2*c2)+q/c1)/(1+c1*r1-1/(r1+r2+r1*r2*c2));
    h2(n)=((c1*r1+1)*c2*h2(n-1)/c1+c1*r1*h1(n-1)/(1+c1*r1)+q/c2)/((r1*r2*c2+r1+r2)*(1+c1*r1)/(r1*r2*c1)-1/(1+r1*c1));
    q1(n)=(h1(n)-h2(n))/r1;
    q2(n)=h2(n)/r2;
    t(n)=t(n-1)+dt;
end
%% Imprimir Resultados h y q
close all
figure()
subplot(2,2,1)
plot(t,h1)
title("h_{1} vs t")
ylabel("h_{1} (m)")
xlabel("t (s)")
subplot(2,2,2)
plot(t,h2)
title("h_{2} vs t")
ylabel("h_{2} (m)")
xlabel("t (s)")
subplot(2,2,3)
plot(t,q1)
title("q_{1} vs t")
ylabel("q_{1} (m)")
xlabel("t (s)")
subplot(2,2,4)
plot(t,q2)
title("q_{2} vs t")
ylabel("q_{2} (m)")
xlabel("t (s)")
%% Para valores diferentes de q
% Parametros
c1=1;%capacitancias area de la seccion
c2=1;
r1=7;%resistencia
r2=6;
q=[0.6 0.7 0.8 0.9 1.11];%caudal de la fuente, bomba presurizadora 
tmax=60;
dt=1;
t=0:dt:tmax;
%variables:
h1=zeros(1,length(t));
h2=zeros(1,length(t));
q1=zeros(1,length(t));
q2=zeros(1,length(t));
%inicializando:
h1(1)=0;h2(1)=0;q1(1)=0;q2(1)=0;
%ecuaciones
for m=1:length(q)
    for n=2:length(t)
        h1(n)=(r1*c1*h1(n-1)+r1*c2*h2(n-1)/(r1+r2+r1*r2*c2)+q(m)/c1)/(1+c1*r1-1/(r1+r2+r1*r2*c2));
        h2(n)=((c1*r1+1)*c2*h2(n-1)/c1+c1*r1*h1(n-1)/(1+c1*r1)+q(m)/c2)/((r1*r2*c2+r1+r2)*(1+c1*r1)/(r1*r2*c1)-1/(1+r1*c1));
        q1(n)=(h1(n)-h2(n))/r1;
        q2(n)=h2(n)/r2;
        t(n)=t(n-1)+dt;
    end
    %imprimir resultados
    figure()
    subplot(2,2,1)
    plot(t,h1)
    title("h_{1} vs t (q="+q(m)+")")
    ylabel("h_{1} (m)")
    xlabel("t (s)")
    subplot(2,2,2)
    plot(t,h2)
    title("h_{2} vs t")
    ylabel("h_{2} (m)")
    xlabel("t (s)")
    subplot(2,2,3)
    plot(t,q1)
    title("q_{1} vs t")
    ylabel("q_{1} (m)")
    xlabel("t (s)")
    subplot(2,2,4)
    plot(t,q2)
    title("q_{2} vs t")
    ylabel("q_{2} (m)")
    xlabel("t (s)")
end
