p='C:\Users\kacpe\OneDrive\Pulpit\laboratorium3\media\';
I = imread([p 'zdj.jpg']);

figure(1)
clf
imshow(I,'InitialMagnification',100);

BitDepth=6
mnoznik=(2^BitDepth-1)/255;
Iq=round(I*mnoznik)/mnoznik;
figure(2)
clf
imshow(Iq,'InitialMagnification',100);

% Do zrobienia:
% 1) Dla pliku 'hills.jpg' wykonaj kwantowanie z
% głębokością bitową zmieniającą się od 7 do 4. W sprawozdaniu należy
% umieścić jeden obrazek, odpowiadający maksymalnej głębokości bitowej, dla
% której są już widoczne zmiany w stosunku do obrazka oryginalnego.
% Wyeksportuj obrazek z tą głębokością bitową używając funkcji imwrite i umieść w sprawozdaniu.
% Zaznacz obszar, na którym widoczne są zmiany. Obrazek oryginalny powinien
% być także umieszczony w sprawozdaniu dla porównania.
% 2) To samo co w punkcie 1) dla kolejnych plików: tree.jpg oraz leaf2.jpg
%imwrite(figure(1), "leaf2good.png");