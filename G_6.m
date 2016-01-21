% G6
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(G6)
    G = G6(1,i);
    T6 = 1 - L6(i);
    rep = tf(1,[1 0])*tf(1,[T6 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = L6(i);
    if(G6(1,i).den{1,1}(1)<1.5)
        t_sim = 10;
        t_s = 5;
    end
t = linspace(0,t_s,1000);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
title(strcat('OdpowiedŸ obiektu na wymuszenie skokowe dla L= ',num2str(L6(i))));
legend('OdpowiedŸ obiektu','Aproksymacja obiektem I rzêdu');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title(strcat('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe dla L= ',num2str(L6(i))))
grid on
end
