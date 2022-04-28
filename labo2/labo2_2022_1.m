%% parametros
k=30.03e-3;
j=1.9e-6;
L=4.3e-2;
R=6.5;
dt=0.0001;
t=0:dt:0.2;
%entradas del sistema
v=4.9;
%salidas del sistema
w=zeros(1,length(t));
i=zeros(1,length(t));
y=zeros(1,length(t));
w(1)=0;i(1)=0;y(1)=0;
%% ecuaciones
for n=2:length(t)
    y(n)=y(n-1)+dt*(k*v/(j*L)-R*y(n-1)/L-k^2*w(n-1)/(j*L));
    w(n)=w(n-1)+dt*y(n-1);
    i(n)=j*y(n)/k;
end
%% ploteo
close all
figure()
plot(t,w)
title("\omega vs t")
xlabel("t")
ylabel("\omega")
figure()
plot(t,i)
title("i vs t")
xlabel("t")
ylabel("i")
%% para valores diferentes de V
%entradas del sistema
v=[5 9 12 24 36];
%salidas del sistema
w=zeros(1,length(t));
i=zeros(1,length(t));
y=zeros(1,length(t));
w(1)=0;i(1)=0;y(1)=0;
%ecuaciones
for m=1:length(v)
    for n=2:length(t)
        y(n)=y(n-1)+dt*(k*v(m)/(j*L)-R*y(n-1)/L-k^2*w(n-1)/(j*L));
        w(n)=w(n-1)+dt*y(n-1);
        i(n)=j*y(n)/k;
    end
    %ploteo
    figure()
    subplot(1,2,1)
    plot(t,w)
    title("\omega vs t, v="+v(m)+"V")
    xlabel("t")
    ylabel("\omega")
    subplot(1,2,2)
    plot(t,i)
    title("i , v="+v(m)+"V")
    xlabel("t")
    ylabel("i")
end

