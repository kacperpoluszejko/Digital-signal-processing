clear;
close all;
clc;

Fs=20000;
N=20000;
A=1;
Hz=Fs/N;
G=N/2;

t=linspace(0,1,Fs+1);
t2=t(1:N);
Fbazowe=[0:length(t2)-1]*Hz;



okno=zeros(4,N);
okno(1,:)=ones(1,N);
okno(2,:)=blackman(N);
okno(3,:)=hamming(N);
okno(4,:)=hanning(N);

for i=1:4
F=[];
roznica=[];

    for f=4950:0.1:5050
    
        S=A*sin(2*pi*f*t2).*okno(i,:);
        T=abs(fft(S));
        h=find(Fbazowe==5000);
        F=[F T(h)];
        roznica=[roznica f-5000];
    end
    if i==1;
        semilogy(roznica, F, 'b-');
        hold on;
    end
    if i==2;
         
        semilogy(roznica, F, 'r-');
         hold on;
    end
    if i==3;
         
        semilogy(roznica, F, 'k-');
        hold on;
    end
    if i==4;
       
        semilogy(roznica, F, 'g-');
         
    end
    xlabel('$\Delta f$','interpreter','latex');
    ylabel('DFT value');
    axis([-50 50, 0.00001, 50000]);
    legend('bez okna','blackman', 'hamming','hanning')
end

