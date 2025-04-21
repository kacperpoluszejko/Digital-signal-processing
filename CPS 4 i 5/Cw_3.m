clear;
close all;
clc;

Fs=40000;
F=2000;
F2=3052;
N=1000;
A=2;
Hz=Fs/N;
G=N/2;

t=linspace(0,1,40001)
t2=t(1:N);

S1=A*sin(2*pi*F*t2);
S2=A*sin(2*pi*F2*t2);
S3=S2+S1;



%subplot(2,2,1);
%plot(t2,S1,'bd-');
%xlabel('Czas [s]');
%ylabel('Amplituda [a.u.]');
%axis([0 0.01 -2 2]);
subplot(2,1,1);
plot(t2,S3,'bd-');
xlabel('Czas [s]');
ylabel('Amplituda [a.u.]');
axis([0 0.01 -2 2]);


%T1=fft(S1);
T2=fft(S3);
%subplot(2,2,2);
Fbazowe=[0:length(t2)-1];
%plot(Fbazowe, abs(T1)/G);
%xlabel('Częstotliwość [Hz]');
%ylabel('Amplituda [a.u.]');
subplot(2,1,2);
plot(Fbazowe, abs(T2)/G, 'bd-');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [a.u.]');

