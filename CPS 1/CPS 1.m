clear;
close all;
clc;

%Zadanie 1 

time=linspace(0,1,1000);
%%

%Zadanie 2
b=2+rand;
signal=1.5+b*sin(2*pi*20*time);
b1=mean(signal);
%Częstotliwość próbkowania wynosi 1000Hz
%%

%Zadanie 3
 figure(1);
 plot(time,signal)
xlabel('[ms]')
set(gca,'YTick',-2:0.5:5)
set(gca,'XTick',0:0.1:1)
set(gca,'XTickLabel',0:100:1000)
%%

%Zadanie 4

figure(2);
h=plot(time,signal, '--gs');
get(h);
set(h,'LineWidth', 2); set(h(1),'Color', [1,0.5,0]);
set(h,'MarkerEdgeColor','black');  set(h, 'MarkerSize',6) 
set(h, 'MarkerFaceColor','b')
%%

%Zadanie5
noise=0.1*randn(1,1000);
e1=mean(noise);
e2=std(noise);
%%

%Zadanie 6

signal2=noise+signal;
figure(3);
f=plot(time, signal2,'.', time, signal);
get(f(1));
set(f(1), 'MarkerSize',10);
get(f(2));
set(f(2), 'Linewidth',1.5);
axis([0 0.05 -2 5]);

set(gca,'XTick',0:0.01:0.05);
set(gca,'XTickLabel',0:10:50);
xlabel('ms');
legend('signal2', 'signal');




