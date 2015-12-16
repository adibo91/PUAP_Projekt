close all;
clear all;

u=1;
T=1;
Tm=1;
Km=1;
lambda=0.1;

figure(1)
for i=1:10
    sim('imc_model');
    lambda=lambda+0.1;
    hold on
    grid on
    plot(odp.time,odp.data);
end
title('Wp≥yw parametru lambda')
plot(odp.time,odp.data,'g');

figure(2)
K=1;
Tm=1;
Km=1;
lambda=0.1;
for i=1:10
    sim('imc_model');
    T=T+0.1;
    hold on
    grid on
    plot(odp.time,odp.data);
end
title('Odpowiedü uk≥adu przy zmianie sta≥ej czasowej T obiektu')
plot(odp.time,odp.data,'g');


% figure(4)
% T=1;
% K=1;
% Tm=1;
% Km=1;
% lambda=0.1;
% for i=1:10
%     sim('imc_model');
%     Km=Km+0.1;
%     hold on
%     grid on
%     plot(odp.time,odp.data);
% end
% title('Odpowiedü uk≥adu przy zmianie parametry Km obiektu')
% plot(odp.time,odp.data,'g');
% 
% figure(5)
% T=1;
% K=1;
% Tm=1;
% Km=1;
% lambda=0.1;
% for i=1:10
%     sim('imc_model');
%     Tm=Tm+0.1;
%     hold on
%     grid on
%     plot(odp.time,odp.data);
% end
% title('Odpowiedü uk≥adu przy zmianie parametry Tm obiektu')
% plot(odp.time,odp.data,'g');
