% G8
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(G8)
G = G8(1,i);
rep = tf([-alfa8(i) 1],[1 1])*tf(1,[1 1])*tf(1,[1 1]); 
num = rep.num{1,1}; 
den = rep.den{1,1};
delay = 0;
t_sim = 100;
t = linspace(0,t_sim,1000);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
title(strcat('Odpowiedü obiektu na wymuszenie skokowe dla alfa= ',num2str(alfa8(i))));
legend('Odpowiedü obiektu','Aproksymacja obiektem I rzÍdu')
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title(strcat('Odpowiedü uk≥adu z regulatorem na wymuszenie skokowe dla',' alfa= ',num2str(alfa8(i))))
grid on
end