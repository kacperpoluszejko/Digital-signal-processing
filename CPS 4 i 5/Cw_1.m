clear
% 1) Podstawowe parametry sygnału
Fs=44100; % to bedzie potrzebne dopiero przy wizualizacji widma
N=20; % calkowita liczba okresow; nie mniej niz 3
SamplesPerPeriod=46; % liczba próbek na okres
A=0.5;
t=[1:N*SamplesPerPeriod];
G=SamplesPerPeriod*N/2;
Hz=Fs/(SamplesPerPeriod*N);



% 2) Sinus
Ssin=A*sin(2*pi*t/SamplesPerPeriod);

% 3) Prostokat
s1=A*ones(1,SamplesPerPeriod); % generujemy wektor o dlugosci jednego okresu prostokata i wartosciach rownych zadanej amplitudzie
s1(1,1:round(length(s1)/2))=-s1(1,1:round(length(s1)/2)); % odwracamy znak w pierwszej polowce wektora probek, uzyskujac jeden okres prostokata
Sprost=repmat(s1,1,N); % generujemy caly sygnal

% 4) Trojkat
ZboczeNarastajace=linspace(-A,A,SamplesPerPeriod/2+1)
s1(1:length(ZboczeNarastajace))=ZboczeNarastajace;
s1(length(ZboczeNarastajace):end)=-ZboczeNarastajace(1:end-1);
Strojk=repmat(s1,1,N); % generujemy caly sygnal

% 5) Wykresy
figure(1)
clf
s=[Ssin' Sprost' Strojk']'; %wygodniej to miec w jednej macierzy
for i=1:3 % 1:3 - dla kazdego ze zdefiniowanych przebiegow...
    S=s(i,:);
    subplot(3,3,i);     plot(t,S,'bd-'); title('Sygnał'); xlabel('[Hz]'); ylabel('[a.u.]');   axis([0 t(N*SamplesPerPeriod) -0.6 0.6]); grid on;
    F=fft(S);    f1=find(abs(F)>0.01);
    Fbazowe=[0:length(t)-1]*Hz; % co trzeba zrobic, zeby skala czestotliwosci byla w Hz a nie jednostkach znormalizowanych
    subplot(3,3,i+3);   plot(Fbazowe,abs(F)/G); title('Widmo amplitudowe'); xlabel('[Hz]'); ylabel('[a.u.]');  grid on;    %axis([0 t(3*Period) -0.6 0.6]);
    subplot(3,3,i+6);   plot(Fbazowe,angle(F),'b-',Fbazowe(f1),angle(F(f1)),'rd'); title('Widmo fazowe'); xlabel('[Hz]'); ylabel('[a.u.]'); grid on;    %axis([0 t(3*Period) -0.6 0.6]);
end

% Do zrobienia:
% Uwaga ogolna: opisac osie na wszystkich wykresach (komendy xlabel oraz
% ylabel); dotyczy to także kolejnych skryptow!

% 1. Zaobserwowac wysokosc piku dla sinusa dla kilku roznych wartosci zmiennej N (czyli dla roznej dlugosci generowanego sygnalu).
% Nastepnie znormalizowac wartosci w widmie amplitudowym tak, aby wysokosc piku
% w widmie sygnalu sinusoidalnego byla identyczna jak wartosc amplitudy (zmienna
% A) dla dowolnej liczby probek.

% 2. Obliczyc czestotliwosci bazowe tak, aby byly wyrazone w Hz a nie
% jednostkach znormalizowanych.
