clear
figure(3); clf;
% 1) Definicja filtra dolnoprzepustowego
N=100;
Fg=0.1;
okno=hanning(N+1); 

% 2) Liczymy i rysujemy odpowiedz filtra dolnoprzepustowego
dolnoprzepustowy=fir1(N,Fg*2,'low',okno);
subplot(321); plot(dolnoprzepustowy,'bd-'); axis([0 100, -0.2 0.2]); grid on; title('Odpowiedź impulsowa'); xlabel('N'); ylabel('Amplituda [a.u.]');
N2=1e5; widmo1=abs(fft(dolnoprzepustowy,N2)); % faktyczna odpowiedz czestotliwosciowa, liczona z malym krokiem czestotliwosci
Fb2=[0:N2-1]/N2;
subplot(322); plot(Fb2,widmo1); grid on; title('Charakterystyka częstotliwościowa'); xlabel('Ułamek częstotliwości fs'); ylabel('Amplituda [a.u]');

% 3) Filtr gornoprzepustowy
sinus2=cos(2*pi*0.5*[1:N+1]);
gornoprzepustowy=dolnoprzepustowy.*sinus2;
widmo2=abs(fft(gornoprzepustowy,N2)); % faktyczna odpowiedz czestotliwosciowa, liczona z malym krokiem czestotliwosci
subplot(323); plot(gornoprzepustowy,'bd-'); axis([0 100, -0.2 0.2]); grid on; title('Odpowiedź impulsowa'); xlabel('N'); ylabel('Amplituda [a.u.]');
subplot(324); plot(Fb2,widmo2); grid on; title('Charakterystyka częstotliwościowa'); xlabel('Ułamek częstotliwości fs'); ylabel('Amplituda [a.u]');
%return

% 4) Filtr pasmowoprzepustowy
sinus2=cos(2*pi*0.2*[1:N+1]);
pamowoprzepustowy=dolnoprzepustowy.*sinus2;
widmo3=abs(fft(pamowoprzepustowy,N2)); % faktyczna odpowiedz czestotliwosciowa, liczona z malym krokiem czestotliwosci
subplot(325); plot(pamowoprzepustowy,'bd-'); axis([0 100, -0.2 0.2]);  grid on; title('Odpowiedź impulsowa'); xlabel('N'); ylabel('Amplituda [a.u.]');
subplot(326); plot(Fb2,widmo3); grid on; title('Charakterystyka częstotliwościowa'); xlabel('Ułamek częstotliwości fs'); ylabel('Amplituda [a.u]');

% Do zrobienia:
% a) Zamiescic figure 1 w sprawozdaniu (pamietac o wlasciwych opisach!).
% b) Wyjasnic, na czym polega metoda transofrmacji filtra
% dolnoprzepustowego do gorno- lub pasmowoprzepustowego.