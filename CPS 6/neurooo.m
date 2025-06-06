% Filtracja danych elektrofizjologicznych na potrzeby detekcji potencjalow
% czynnosciowych
% 1) Wczytanie i wizualizacja danych

load 'C:\Users\kacpe\OneDrive\Pulpit\lab6-fir2\20s_BP_10-5000Hz';
figure(4); clf
t=[1:length(czas_S)];
plot(czas_S,napiecie_V); grid on; axis([12 13 -5e-4 5e-4]);

%% 2) Projekt filtra gornoprzepustowego 
% Uzyc narzedzia filterDesigner. Zastosowac opcje: Response Type=Highpass,
% Metod=Least-squares, Fs=20000, order=1000, Fstop=300, Fpass=350. Wyeksportowac 
% filtr (File->Export) z opcjami: Export To: MAT-File; Export As:
% coefficients; Variable Names: neuro1. Nazwa pliku: neuro1.mat.

% Wizualizacja filtra:
load neuro1_2.mat
figure(5); subplot(1,2,1); plot(neuro1_2); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro1_2))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s12=filter(neuro1_2,1,napiecie_V);
probki=[(length(neuro1_2)-1)/2:length(s12)-(length(neuro1_2)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych



% Wizualizacja filtra:
load neuro1_1.mat
figure(5); subplot(1,2,1); plot(neuro1_1); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro1_1))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s11=filter(neuro1_1,1,napiecie_V);
probki=[(length(neuro1_1)-1)/2:length(s11)-(length(neuro1_1)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych




% Wizualizacja filtra:
load neuro6.mat
figure(5); subplot(1,2,1); plot(neuro6); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro6))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s6=filter(neuro6,1,napiecie_V);
probki=[(length(neuro6)-1)/2:length(s6)-(length(neuro6)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych




% Wizualizacja filtra:
load neuro1.mat
figure(5); subplot(1,2,1); plot(neuro1); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro1))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s1=filter(neuro1,1,napiecie_V);
probki=[(length(neuro1)-1)/2:length(s1)-(length(neuro1)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych




% Wizualizacja filtra:
load neuro2.mat
figure(5); subplot(1,2,1); plot(neuro2); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro2))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s2=filter(neuro2,1,napiecie_V);
probki=[(length(neuro2)-1)/2:length(s2)-(length(neuro2)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych




% Wizualizacja filtra:
load neuro3.mat
figure(5); subplot(1,2,1); plot(neuro3); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro3))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s3=filter(neuro3,1,napiecie_V);
probki=[(length(neuro3)-1)/2:length(s3)-(length(neuro3)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych



% Wizualizacja filtra:
load neuro4.mat
figure(5); subplot(1,2,1); plot(neuro4); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro4))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s4=filter(neuro4,1,napiecie_V);
probki=[(length(neuro4)-1)/2:length(s4)-(length(neuro4)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych



% Wizualizacja filtra:
load neuro5.mat
figure(5); subplot(1,2,1); plot(neuro5); grid on;
subplot(1,2,2); semilogy(abs(fft(neuro5))); axis([0 500 1e-4 2]); grid on;

%% 3) Filtracja
s5=filter(neuro5,1,napiecie_V);
probki=[(length(neuro5)-1)/2:length(s5)-(length(neuro5)-1)/2]; % wycinamy poczatek i koniec danych, aby uniknac efektow brzegowych


figure(6); 

plot(czas_S(probki)-czas_S(probki(1)),s12(probki),'y', czas_S(probki)-czas_S(probki(1)),s11(probki),'c', czas_S(probki)-czas_S(probki(1)),s1(probki),'r-',czas_S(probki)-czas_S(probki(1)),s2(probki),'b-',czas_S(probki)-czas_S(probki(1)),s3(probki),'m-',czas_S(probki)-czas_S(probki(1)),s4(probki),'g-',czas_S(probki)-czas_S(probki(1)),s5(probki),'black-');
legend('100','200','300', '400', '500', '600', '700', '800')
xlabel('Czas [s]');
ylabel('Amplituda [a.u.]')
axis([12.755 12.78 -5e-4 5e-4]);

% 4) Do zrobienia
% a) Uzywajac narzedzia filterDesigner, zaprojektowac kilka wersji filtra
% gornoprzepustowego, rozniacych sie czestotliwoscia graniczna.
% Czestotliwosci Fpass i Fstop zwiekszac w krokach 100 Hz (400/450,
% 500/550,...) co najmniej do 700/750. Kolejne filtry zapisywac pod roznymi
% nazwami. 
% b) Uzyc filtrow zaprojektowanych w punkcie b do przefiltrowania
% oryginalnego sygnalu. Dla wybranego fragmentu danych o calkowitej
% dlugosci kilkadziesiat miliseknud narysowac ksztalt sygnalu po
% przepuszczeniu go przez kolejne filtry. (Prosze pamietac, ze skala
% pozioma i pionowa musi byc identyczna dla wszystkich wykresow.)
% Skomentowac: czy widac roznice miedzy filtrami pod wzgledem: 
% - skutecznosci filtracji skladowych niskoczestotliwosciowych
% - wplywu na ksztalt zarejestrowanych potencjalow czynnosciowych

%przyklady=[122950 151870 255500 364400]/20000;