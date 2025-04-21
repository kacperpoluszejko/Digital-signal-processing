clear
% 1. Parametry próbkowania oryginalnego sygnału

NumberOfSamples=20000;
time_s=[1:NumberOfSamples];

% 2. Generacja sygnału oryginalnego
F=0.1; % wyrażona jako ułamek częstotliwości próbkowania
s=sin(2*pi*F*time_s);

% 3. Parametry rekonstrukcji
Oversampling=10; % nie zmieniamy
FilterLength=200; % wartość maksymalna: 2000

SamplesToReconstruct=[2000:4000]; % probki sygnalu oryginalnego miedzy ktorymi chcemy zrekonstruowac sygnal - NIE ZMIENIAC
time_r=[time_s(SamplesToReconstruct(1)):1/Oversampling:time_s(max(SamplesToReconstruct))-1/Oversampling]; % dosyc skomplikowane, chodzi o to, zeby dostac okragla calkowita liczbe probek w sygnale zrekonstruowanym, tak aby uniknac efektu przeciekania widma - NIE PYTAC :) (na razie)

% 4. Rekonstrukcja
value=zeros(1,length(time_r));
for j=1:length(time_r)
    value(j) = SamplingReconstruction(s,time_r(j),FilterLength);
end

% 5. Bezpośrednia generacja sygnału o większej częstotliwości próbkowania - tak powinien wyglądać sygnał po idealnej rekonstrukcji
s2=sin(2*pi*F*time_r);
blad=s2-value; % to jest błąd interpolacji

% 6. Wykresy
figure(2)
clf
subplot(2,1,1);    plot(time_s,s,'bd-',time_r,s2,'rd-',time_r,value,'gd-');    legend('low Fs','high Fs','reconstructed');
axis([time_r([min(SamplesToReconstruct) min(SamplesToReconstruct)+200]) min(s2)*1.2 max(s2)*1.2]);    grid on

subplot(2,1,2);    plot(time_s,blad,'bd-');
h=gca;    set(h,'XLim',[min(SamplesToReconstruct) min(SamplesToReconstruct)+200]);    % ustawiamy zakres na osi poziomej (alternatywa dla komendy axis)
grid on

% 7. Do zrobienia

% 1) Dla ustawionej czestotliwosci F=0.1 uruchomic skrypt dla roznych
% dlugosci filtra (zmienna FilterLength):20,64,200,640,2000. Dla jednej
% wybranej czestotliwosci zrobic zrzut rysunku 1 i umiescic w sprawozdaniu.

% 2) Dla kazdej dlugosci filtra oszacowac dokładnosc interpolacji, która definiujemy jako stosunek
% wartosci sredniokwadratowej tego bledu (zmienna blad) do wartosci
% sredniokwadratowej sygnalu (zmienna s2). Pokazac na wykresie zależnosc
% bledu interpolacji od dlugosci filtra i skomentowac.

% 3) Ten sam wykres co w punkcie 2 zrobic dla innych czestotliwosci
% sygnalu: 0.2, 0.3, 0.4, 0.49. 