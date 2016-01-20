close all
u=1;
K=1;
Km=1;
%% G1
close all
sstep = 0.01;
for i = 1:length(G1)
    num = 1;
    den = [T1(i) 1 ];
    delay = 1;
    if(G1(1,i).den{1,1}(1)<1.5)
        t_s = 5;
        t_sim = 30;
    elseif(G1(1,i).den{1,1}(1)<10)
        t_s = 100;
        t_sim = 40;
    elseif(G1(1,i).den{1,1}(1)<51)
        t_s = 300;
        t_sim = 80;
    elseif(G1(1,i).den{1,1}(1)<500)
        t_s = 1000;
        t_sim = 100;
    else
        t_s = 4000;
        t_sim = 100;
    end
t = linspace(0,t_s,1000);
G = G1(1,i);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G2
close all
sstep = 0.01;
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
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G3
close all
sstep = 0.0000001;
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
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G4
close all
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
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G5
close all
for i = 1:length(G5)
    G = G5(1,i);
    rep = tf(1,[1 1])*tf(1,[alfa5(i) 1])*tf(1,[alfa5(i)^2 1])*tf(1,[alfa5(i)^3 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    if(G5(1,i).den{1,1}(1)<1.5)
        t_sim = 100;
    end
t = linspace(0,t_sim,1000);
G = G5(1,i);
T=G5(1,i).den{1,1}(1);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G6
close all
for i = 1:length(G6)
    G = G6(1,i);
    T6 = 1 - L6(i);
    rep = tf(1,[1 0])*tf(1,[T6 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = L6(i);
    if(G6(1,i).den{1,1}(1)<1.5)
        t_sim = 4000;
    end
t = linspace(0,t_sim,1000);
y = step(G,t);
x0 = [1 1];
x = lsqnonlin('wsk',x0,[],[],[],t,y');
figure()
plot(t,y,t,odp_skokowa_modelu(x,t));
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G7
close all
for i = 1:length(G7)
    for j = 1:length(L7)
    T7a = 1 - L7(j);
    rep = tf(T7(i),[T7(i) 1])*tf(1,[T7a 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = L7(j);
    G = G7(1,i);
    t_sim = 100;
    t = linspace(0,t_sim,1000);
    y = step(G,t);
    x0 = [1 1];
    x = lsqnonlin('wsk',x0,[],[],[],t,y');
    figure()
    plot(t,y,t,odp_skokowa_modelu(x,t));
    legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
    hold on
    grid on

    Tm = x(1);
    lambda = x(2);
    sim('imc_model')
    figure()
    plot(odp.time,odp.data);
    title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
    grid on
    end
end

%% G8
close all
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
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end

%% G9
close all
for i = 1:length(G9)
G = G9(1,i);
rep = tf(1,[1 1])*tf(1,[T9(i)^2 1.4*T9(i) 1]); 
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
legend('OdpowiedŸ obiektu na wymuszenie skokowe','Aproksymacja I stopnia');
hold on
grid on

Tm = x(1);
lambda = x(2);
sim('imc_model')
figure()
plot(odp.time,odp.data);
title('OdpowiedŸ uk³adu z regulatorem na wymuszenie skokowe')
grid on
end