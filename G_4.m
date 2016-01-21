% G4
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(G4)
    G = G4(1,i);
    rep = tf(1,[1 1])^n4(i);
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    if(G4(1,i).den{1,1}(1)<8)
        t_sim = 100;
    end
t = linspace(0,t_sim,1000);
G = G4(1,i);
T=G4(1,i).den{1,1}(1);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
title(strcat('OdpowiedŸ obiektu na wymuszenie skokowe dla n =',num2str(n4(i))))
legend('OdpowiedŸ obiektu','Aproksymacja obiektem I rzêdu');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title(strcat('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe dla n =',num2str(n4(i))))
grid on
end