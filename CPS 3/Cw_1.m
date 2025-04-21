% Skrypt prezentuje efekt szumu kwantyzacji z uwzlgednieniem efektu
% korelacji "szumu" z sygnalem. 

clear
% 1. Parametry próbkowania oryginalnego sygnału.
Fs=1;
NumberOfSamples=1000;
time_s=[1:NumberOfSamples]/Fs;

% 2. Generacja sygnału sinusoidalnego
F=0.02;
A=10000; %amplituda wyrazona jako wielokrotnosc LSB
s=A*sin(2*pi*F*time_s);
f=[0:NumberOfSamples-1]/NumberOfSamples*Fs;

% 4. Kwantyzacja
sq=round(s)+[rand(1,length(s))-0.5]*1e-15; % minimalny szum koniecznie trzeba dodac, jesli chcemy potem korzystac ze skali logarytmicznej przy rysowanie widma

% 5. Wykresy sygnałów przed i po kwantyzacji
figure(1); clf;
subplot(3,3,1); plot(time_s,s,'bd-'); grid on; axis([0 100 -A A]); ylabel('Sygnał oryginalny');% sygnał oryginalny
subplot(3,3,2); plot(time_s,sq,'bd-'); grid on; axis([0 100 -A A]); ylabel('Sygnał po kwantyzacji'); % sygnał po kwantyzacji
%%

% 6. Wykres szumu kwantyzacji
subplot(3,3,5); plot(time_s,sq-s,'bd-'); grid on; axis([0 100 -1 1]); text(1,0.8,['\sigma=' num2str(std(sq-s))]); ylabel('szum kwantyzacji');
%%

% 7. Dithering: szum kwantyzacji można uczynić mniej skorelowanym z
% sygnałem stosując technikę ditheringu. W tym celu do kolejnych próbek sygnału dodaje się
% *przed skwantowaniem* wartości pseudolosowe, wyznaczone z rozkładu
% jednorodnego (prostokątnego) z przedziału od -q/2 do +q/2 (q - krok
% kwantyzacji). 

dither=rand(1,length(s))-0.5; % generujemy sygnał pseudolosowy (dither)
sqd=round(s+dither); % kwantyzacja sygnału z dodanym ditherem
subplot(3,3,3); plot(time_s,sqd,'bd-'); grid on; axis([0 100 -A A]);
subplot(3,3,6); plot(time_s,sqd-s,'bd-'); grid on; axis([0 100 -1 1]); text(1,0.8,['\sigma=' num2str(std(sqd-s))]);
%%

% 8. Widma częstotliwościowe
%subplot(3,3,7); semilogy(f,abs(fft(s)*2/length(s))); grid on; axis([0 Fs/2 1e-6 A*2]);
subplot(3,3,7); plot(f,abs(fft(s)*2/length(s))); grid on; axis([0 Fs/2 0 A*1.2]);
subplot(3,3,8); plot(f,abs(fft(sq)*2/length(s))); grid on; axis([0 Fs/2 0 A*1.2]);
subplot(3,3,9); plot(f,abs(fft(sqd)*2/length(s))); grid on; axis([0 Fs/2 0 A*1.2]);
%subplot(3,3,9); semilogy(f,abs(fft(sqd)*2/length(s))); grid on; axis([0 Fs/2 1e-6 A*2]);

odp1=std(sq-s);
odp2=std(sqd-s);
odp3=abs(fft(sq)*2/length(s));
odp4=zeros(1,1000);
for i=1:500
    if odp3(i)<max(odp3)
    odp4(i)=odp3(i);
    end
end
odp5=max(odp4);

D=[1, 10, 100, 1000, 10000, 100000];
E=[0.2536, 0.2875 ,0.2944,0.2823,0.2947,0.3212];
F=[0.3730,0.3884  ,0.3962,0.4143,0.4117,0.4359];
G=[0.2462, 0.2131 ,0.2462, 0.1965, 0.2617,0.1972];
figure(2)
semilogx(D,E,'black.-', 'Markersize', 15, 'LineWidth',1.5);
hold on;
semilogx(D,F,'b.-', 'Markersize', 15, 'Linewidth', 1.5);
semilogx(D,G,'m.-', 'Markersize', 15, 'Linewidth', 1.5);
legend('Szum bez dithera', 'Szum z ditherem', 'Najwyższa harmoniczna');
xlabel('Amplituda');

%get(h(1))
%set(h(1), 'Markersize', 15)
% 9. Do zrobienia
% Ustawić czestotliwosć F=0.02. Dla różnych wartości amplitudy sygnału
% (kolejno A=1; 10; 100; 1000) odczytać następujące parametry sygnału:
% - wartość średniokwadratową szumu kwantyzacji bez dithera
% - wartość średniokwadratową szumu kwantyzacji z ditherem
% - amplitudę nawyższej harmonicznej dla sygnału bez dithera
% Zmierzone wartości tych parametrów narysować w funkcji amplitudy sygnału
% i skomentować. Czy wartości te zmieniają się monotonicznie z
% amplitudą sygnału? 