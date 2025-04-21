function value = SamplingReconstruction(signal,T,FilterLength)
% signal - oryginalny sygnal; zakladamy, ze czestotliwosc probkowania sygnalu wejsciowego jest znormalizowana (Fs=1).

sample0=floor(T);
reszta=T-sample0; % odeglosc na osi czasu punktu, w którym dokonujemy rekonstrukcji, od ostatniej poprzedzajacej probki
mnoznik=sinc([reszta+[FilterLength-1:-1:-FilterLength]]);%.*blackman(FilterLength*2)';
SamplesToUse=sample0+[-FilterLength+1:FilterLength];
value=sum(signal(SamplesToUse).*mnoznik);
end