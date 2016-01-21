% G3
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(G3)
    G = G3(1,i)
    rep = tf(1,[1 1])*tf(1,[T3(i) 1])*tf(1,[T3(i) 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    if(G3(1,i).den{1,1}(1)<1.5)
        t_sim = 10;
    elseif(G3(1,i).den{1,1}(1)<10)
        t_sim = 100;
    elseif(G3(1,i).den{1,1}(1)<51)
        t_sim = 250;
    elseif(G3(1,i).den{1,1}(1)<500)
        t_sim = 1000;
    else
        t_sim = 3000;
    end
t = linspace(0,t_sim,1000);
G = G3(1,i);
T=G3(1,i).den{1,1}(1);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
title(strcat('OdpowiedŸ obiektu na wymuszenie skokowe dla T =',num2str(T3(i))))
legend('OdpowiedŸ obiektu','Aproksymacja obiektem I rzêdu');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title(strcat('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe dla T =',num2str(T3(i))))
grid on
end
