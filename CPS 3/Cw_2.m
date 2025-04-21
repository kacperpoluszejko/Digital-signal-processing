% 1. Gradient składowych R,G,B
clear;

BitDepth=7;
mnoznik=(2^BitDepth-1)/255;

figure(1)
clf
rows = 100;
columns = 1024;
obrazek=uint8(zeros(rows*11,columns,3));

ramp0 = uint8(linspace(0, 255, columns));
ramp = repmat(ramp0, [rows*2, 1]);

obrazek(1:rows*2,1:columns,1)=ramp; % red
obrazek(rows*3+1:rows*5,1:columns,2)=ramp; % green
obrazek(rows*6+1:rows*8,1:columns,3)=ramp; % blue

obrazek(rows*9+1:rows*11,1:columns,1)=ramp; % white
obrazek(rows*9+1:rows*11,1:columns,2)=ramp; % whote
obrazek(rows*9+1:rows*11,1:columns,3)=ramp; % white

obrazek([rows*1:rows*2 rows*4:rows*5 rows*7:rows*8 rows*10:rows*11],1:columns,:)=round(obrazek([rows*1:rows*2 rows*4:rows*5 rows*7:rows*8 rows*10:rows*11],1:columns,:)*mnoznik)/mnoznik;

imshow(obrazek,'InitialMagnification',100);
%%

% 2. Przejścia tonalne zielony-żółty-czerwony
N=4;
obrazek2=uint8(zeros(256*N,256*N,3));
ramp2=uint8(linspace(0,255,256*N));
obrazek2(:,:,1)=repmat(ramp2,[256*N,1]);
obrazek2(:,:,2)=repmat(ramp2',[1,256*N]);

mnoznik=(2^BitDepth-1)/255;
obrazek3=round(obrazek2*mnoznik)/mnoznik;

figure(2)
imshow(obrazek2,'InitialMagnification',100);
figure(3)
imshow(obrazek3,'InitialMagnification',100);