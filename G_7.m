% G7
close all
clear all
clc
load('transfer_functions.mat');
K=1;
Km=1;
for i = 1:length(T7)
    for j = 1:length(L7)
    T7a = 1 - L7(j);
    rep = tf(T7(i),[T7(i) 1])*tf(1,[T7a 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = L7(j);
    G = G7(1,i);
    t_sim = 1000;
    t = linspace(0,t_sim,1000);
    y = step(G,t);
    x0 = [1 1];
    x = lsqnonlin('wsk',x0,[],[],[],t,y');
    figure()
    plot(t,y,t,odp_skokowa_modelu(x,t));
    title(strcat('Odpowiedü obiektu na wymuszenie skokowe dla T= ',num2str(T7(i)),', L= ',num2str(L7(j))))
    legend('Odpowiedü obiektu','Aproksymacja obiektem I rzÍdu');
    hold on
    grid on

    Tm = x(1);
    lambda = x(2);
    sim('imc_model')
    figure()
    plot(odp.time,odp.data);
   title(strcat('Odpowiedü uk≥adu z regulatorem na wymuszenie skokowe dla T= ',num2str(T7(i)),', L= ',num2str(L7(j))))
    grid on
    end
end
