clear
% 1. Parametry probkowania oryginalnego sygnalu
Fs=11025;
NumberOfSamples=Fs*2; % 2 sekundy
time_s=[1:NumberOfSamples]/Fs;

% 2. Parametry sygnalu
F=(1:1:11)
for i=1:11
    F(i)=i*1000;
end

A=1; %rand(1,length(F)); % losujemy amplitudy

% 3. Generacja sygnalu
s=[];
for j=1:11
    s=[s A*sin(2*pi*F(j)*time_s)];
end

figure(100)
plot(s,'bd-')
sound(s,Fs);

% 4. Do zrobienia: 
% - wytworzyc sygnal sinusoidalny, ktory bedzie zmienial czestotliwosc od 1 kHz do 22 kHz (co 1 kHz) co 2 sekundy 
% - stworzyc tego jeden dlugi sygnal (44 sekund) i odtworzyc
% - zaobserwowac zmiane czestotliwosci slyszalnego sygnalu. W sprawozdaniu skomentowac.

