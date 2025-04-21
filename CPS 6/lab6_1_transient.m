clear
% 1) Generacja sygnału
Fs=1; % to bedzie potrzebne dopiero przy wizualizacji widma
f=0.05; % calkowita liczba okresow; nie mniej niz 3
N=200;
A=1;
t=[1:N]/Fs;
s=A*sin(2*pi*t*f);
s(1:round(1/f))=0;

% 2) Filtr
figure(1); clf;
DlugoscFiltra=15;
b1=ones(1,DlugoscFiltra)/DlugoscFiltra;
b2=zeros(1,100); b2(1:DlugoscFiltra)=b1; subplot(311); stem(b2); % na potrzeby rysunku, uzupelniamy zerami do 100

% 3) Filtracja sygnalu
y1 = filter(b1,1,s); % drugi argument to jedna liczba o wartsci 1, co odpowiada filtrowi typu FIR
y=y1(1:N);
%figure(2); clf; 
subplot(312)
plot(t,s,'bd-',t,y,'rd-'); grid on

%% 4) Charakterystyka czestotliwosciowa
f1=fft(b1,1000); f=[0:999]/1000; % na potrzeby rysowania charakterystyki, uzupelniamy zerami do 1000
subplot(313); plot(f,abs(f1)); grid on

% 5) Do zrobienia
% Uzywajac funkcji subplot i petli for, stworzyc rysunek z 9 subplotami. Na
% kazdym subplocie umiescic odpowiedz czasowa filtra (identycznie jak teraz
% na figure 2) dla roznych wartosci czestotliwosci sygnalu
% f: od 0.02 z krokiem 0.01 do 0.1 (lacznie 9 wartosci). Rysunek z
% subplotami umiescic w sprawozdaniu i skomentowac efekt znieksztalcenia
% pierwszego okresu sygnalu na wyjsciu filtra: dlaczego znieksztalcenie
% wyglada na wieksze dla wyzszych czestotliwosci sygnalu?
figure(2)
for i=1:1:9
    f=0.01*(i+1);
    s=A*sin(2*pi*t*f);
    s(1:round(1/f))=0;
    y1 = filter(b1,1,s); % drugi argument to jedna liczba o wartsci 1, co odpowiada filtrowi typu FIR
    y=y1(1:N);
    subplot(3, 3, i)
    plot(t,s,'bd-',t,y,'rd-'); grid on;
    title(['f=',num2str(f)]);

end




