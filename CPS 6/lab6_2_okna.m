clear
figure(3); clf;

% 1) Definicja parametrów filtra
N=25;

zapis=zeros(4,100000);

for i=1:4
N=N*2;
Fg=0.1;
okno=rectwin(N+1);
okno1=blackman(N+1); 
okno3=hamming(N+1);
okno2=hanning(N+1);

okno_wizualizacja=zeros(1,1001); okno_wizualizacja(501-N/2:501+N/2)=okno;
okno1_wizualizacja=zeros(1,1001); okno1_wizualizacja(501-N/2:501+N/2)=okno1;
okno2_wizualizacja=zeros(1,1001); okno2_wizualizacja(501-N/2:501+N/2)=okno2;
okno3_wizualizacja=zeros(1,1001); okno3_wizualizacja(501-N/2:501+N/2)=okno3;% dopelniamy nasze okno czasowe z lewej i prawej strony zerami na potrzevby wizualizacji

% 2) Liczymy i rysujemy odpowiedz filtra dolnoprzepustowego
B = fir1(1000,Fg*2); % Definicja filtra "idealnego" (czyli bardzo wysokiego rzedu) na potrzeby wizualizacji
subplot(411); plot([-500:500],B); grid on;
title('Filtr idealny');
%legend('rectwin','blackman','hamming','hanning')
% rysujemy filtr "idealny"
subplot(412); plot([-500:500],okno_wizualizacja, 'b-');
hold on;
plot([-500:500],okno1_wizualizacja,'r-');
hold on;
plot([-500:500],okno2_wizualizacja,'g-');
hold on;
plot([-500:500],okno3_wizualizacja,'c-');
axis([-500 500 -0.2 1.2]);
grid on; %rysujemy nasze okno czasowe
title('Okno czasowe');
legend('rectwin','blackman','hamming','hanning')

b=fir1(N,Fg*2,'low',okno);
b1=fir1(N,Fg*2,'low',okno1);
b2=fir1(N,Fg*2,'low',okno2);
b3=fir1(N,Fg*2,'low',okno3);
subplot(413); plot([-N/2:N/2],b,'b.-');
hold on; 
plot([-N/2:N/2],b1,'r.-'); 
hold on; 
plot([-N/2:N/2],b2,'g.-'); 
hold on; 
plot([-N/2:N/2],b3,'c.-'); 
grid on;
title('Filtr po zastosowaniu okna');
legend('rectwin','blackman','hamming','hanning')


%% 3) Charakterystyka czestotliwosciowa
N2=1e5; widmo2=abs(fft(b,N2));
widmo21=abs(fft(b1,N2));
widmo22=abs(fft(b2,N2));
widmo23=abs(fft(b3,N2));% faktyczna odpowiedz czestotliwosciowa, liczona z malym krokiem czestotliwosci
Fb2=[0:N2-1]/N2;
subplot(414); semilogy(Fb2,widmo2, 'b-');
hold on;
semilogy(Fb2,widmo21, 'r-');
hold on;
semilogy(Fb2,widmo22, 'g-');
hold on;
semilogy(Fb2,widmo23, 'c-');
grid on; axis([0 1 1e-6 2])
title('Charakterystyka częstotliwościowa');
legend('rectwin','blackman','hamming','hanning')
figure(6); %semilogy(Fb2,widmo2, 'b-');
hold on;
semilogy(Fb2,widmo21, 'b-');
hold on;
semilogy(Fb2,widmo22, 'g-');
hold on;
semilogy(Fb2,widmo23, 'c-');
grid on; axis([0.08 0.12 1e-6 2])
title('Charakterystyka częstotliwościowa');
legend('rectwin','blackman','hamming','hanning')

zapis(i,:)=widmo21;

end

figure(8);
semilogy(Fb2,zapis(1,:), 'b-',Fb2,zapis(2,:), 'r-',Fb2,zapis(3,:), 'g-',Fb2,zapis(4,:), 'c-');
title('Charakterystyka częstotliwościowa (blackman)');
legend('N=50','N=100','N=200','N=400')





% 4) Do zrobienia
% a) Na figure 1 nalozyc wykresy ksztaltu okna, odpowiedzi filtra oraz
% charakterystyki amplitudowej filtra dla okien: prostokatnego (jak w
% skrypcie), blackman, hamming, hanning. Rysunek zamiescic w sprawozdaniu.
% Skomentowac:
% - Ktore z tych okien daje najmniejsza szerokosc pasma przejsciowego fltra? 
% - Ktore daje najlepsze tlumienie w pasmie zaporowym? 
% - Ktore daje najwieksze zafalowania w pasmie przenoszenia (wystarczy sprawdzic maksymalne
% wzmocnienie w pasmie przenoszenia dla kazdego filtra, powiekszajac kazdy
% wykres wokol wartosci 1 na osi pionowej)?

% b) Powtorzyc krok a dla rzedu filtra N=100,200,400. Zamiescic wykresy w sprawozdaniu. Dla wybranego okna
% (jedno z trzech: blackman, hamming, hanning) narysowac charakterystyki
% amplitudowe dla czterech wartosci rzedu filtra (50,100,200,400) na
% wspolnym wykresie.

% c) Prosze pamietac o rozsadnym wyskalowaniu wszystkich wykresow!