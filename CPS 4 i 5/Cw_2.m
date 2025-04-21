clear
dzwiek=0;   % na razie nie zmieniamy
% 1) Generujemy sygnal prostokatny
Fs=1; % to bedzie potrzebne dopiero przy wizualizacji widma
N=500; % calkowita liczba okresow; nie mniej niz 3
Period=176; % okres sygnalu to Period/Fs; wartosc 176 odpowiada czestotliwosci okolo 250 Hz; chcemy, aby okres byl liczba calkowita parzysta
Hz=Fs/(N*Period);
G=Period*N/2;
A=0.5;
t=[1:N*Period];
s1=A*ones(1,Period); % generujemy wektor o dlugosci period i wartosciach rownych zadanej amplitudzie
s1(1,1:round(length(s1)/2))=-s1(1,1:round(length(s1)/2)); % odwracamy znak w pierwszej polowce wektora probek, uzyskujac jeden okres prostokata
Sprost=repmat(s1,1,N); % generujemy caly sygnal

% 2) Rysujemy sygnal oraz widmo amplitudowe i fazowe
figure(2);   clf;
%subplot(3,3,1);     plot(Sprost);     axis([0 Period*3 -1 1]);       grid on;
CzestotliwosciPikow=N+1:2*N:N*Period; % Dla tych czestotliwosci wystapia piki w widmie prostokata
CzestotliwosciZerowane=setdiff([1:N*Period],CzestotliwosciPikow);

f=fft(Sprost);      f(CzestotliwosciZerowane)=0; Fbazowe=[0:length(Sprost)-1]*Hz; % zerujemy wartości DFT dla czestotliwosci innych niz te, gdzie wystepuja piki
%subplot(3,3,4);     plot(Fbazowe, abs(f)/G,'bd-');    grid on;
%subplot(3,3,7);     plot(1:length(f),angle(f),'bd-');    grid on; % rysujemy faze tylko dla pikow
%%

% 3) Przygotowujemy korekte fazy
f2=zeros(1,length(f));      f3=f2; % predefinicja tablic dla widm
KorektaFazy=0.2*(2*(rand(1,length(CzestotliwosciPikow)))-1); % losujemy wartosci o ktora beda przesuwane fazowo poszczegolne skladowe
KorektaFazy(88:-1:45)=-KorektaFazy(1:44); % nieparzystosc fazy musi byc zachowna, aby sygnal po transformacie odwrotnej mial nadal wartosci rzeczywiste, a nie zespolone

% 4) Odtwarzamy sygnal prostokatny z widma, biorac ograniczona liczbe wspolczynnikow Fouriera
for LiczbaHarmonicznych=2:3:44 % w kolejnych iteracjach petli odtwarzamy prostokat uzywajac coraz wiecej harmonicznych
    f2(1,CzestotliwosciPikow(1:LiczbaHarmonicznych))=f(1,CzestotliwosciPikow(1:LiczbaHarmonicznych));
    f2(1,CzestotliwosciPikow(end:-1:end-LiczbaHarmonicznych+1))=f(1,CzestotliwosciPikow(end:-1:end-LiczbaHarmonicznych+1));

    s2=real(ifft(f2));
    subplot(3,5,(LiczbaHarmonicznych+1)/3);     plot(real(s2));     axis([0 Period*3 -1 1]);   h=text(150,0.8,['skladowe=' num2str(LiczbaHarmonicznych)]);  set(h,'FontSize',14);   grid on;
    %subplot(3,3,5);     plot(abs(f2),'bd-');    grid on;        % amplituda
    %subplot(3,3,8);     plot(1:length(f2),angle(f2),'bd-');   axis([0 1e5 -4 4]);  grid on;    % faza

    f3(CzestotliwosciPikow)=f2(CzestotliwosciPikow).*exp(sqrt(-1)*KorektaFazy);      s3=real(ifft(f3));  grid on;    % odtwarzamy sygnal z przesunietymi losowo wartosciami fazy
    %subplot(3,3,3);     plot(real(s3));     axis([0 Period*3 -1 1]);   grid on;

    %subplot(3,3,6);     plot(abs(f3),'bd-');    grid on;
    %subplot(3,3,9);     plot(1:length(f3),angle(f3),'bd-');     axis([0 1e5 -4 4]);    grid on;

    pause(0.3);
end

% 5) Do zrobienia
% 1. Unormuj transformate Fouriera tak, aby wysokosc pikow odpowiadala
% amplitudzie skladowych (tak samo lab5_1_podstawy). Skoryguj zakres skali
% liniowej na wykresie widma amplitudowego.

% 2. Utworz kopie skryptu. Utworz nowy rysunek z 15 oddzielnymi wykresami (funkcja subplot). Na
% kolenych wykresach umiesc sygnal prostokatny zrekonstruowany dla roznej
% liczby skladowych: od 2 do 44 (tak jak jest pokazane na figure 1 w gornym rzedzie,
% drugi rysunek).