clear

% 1. Wczytanie obrazka
%p='C:\home\Pawel\praca\dydaktyka\DSP\laby\lab2-sampling\obrazki\';
p='C:\Users\kacpe\OneDrive\Pulpit\lab2_2023\media\';
I = imread([p 'sitko.jpg']);

figure(1)
clf
imshow(I,'InitialMagnification',40);

% 2. Downsampling bez filtracji - aliasing
for ratio=6:9
    I2=I(1:ratio:end,1:ratio:end,:);
    figure(ratio)
    imshow(I2,'InitialMagnification',100);       
end

% 3. Efekt downsamplingu z filtrowaniem (z użyciem aplikacji Easy Thumbnails)
for ratio=6:9       
    I3=imread([p num2str(ratio) 'x_Trakai.jpg']);
    figure(ratio+100);
    imshow(I3,'InitialMagnification',100);    
end

% Do zrobienia
% Wykonaj samodzielnie fotografie, na której wyraznie widoczny bedzie efekt
% aliasingu