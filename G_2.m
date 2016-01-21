% G2
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(G2)
    G = G2(1,i);
    num = 1;
    den = [T2(i)^2 2*T2(i) 1];
    delay = 1;
    if(G2(1,i).den{1,1}(1)<1.5)
        t_s = 20;
        t_sim = 40;
    elseif(G2(1,i).den{1,1}(1)<10)
        t_s = 150;
        t_sim = 100;
    elseif(G2(1,i).den{1,1}(1)<51)
        t_s = 150;
        t_sim = 150;
    elseif(G2(1,i).den{1,1}(1)<500)
        t_s = 500;
        t_sim = 300;
    else
        t_s = 4000;
        t_sim = 3000;
    end
t = linspace(0,t_s,1000);
G = G2(1,i);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
title(strcat('OdpowiedŸ obiektu na wymuszenie skokowe dla T =',num2str(T2(i))))
legend('OdpowiedŸ obiektu','Aproksymacja obiektem I rzêdu');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title(strcat('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe dla T =',num2str(T2(i))))
grid on
end