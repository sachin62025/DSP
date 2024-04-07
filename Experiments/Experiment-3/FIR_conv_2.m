clc;
clear all;
Fs=200e3;        %say sampling frequency 200 kHz
Ts=1/Fs;         %set sampling time
dt=0:Ts:5e-3-Ts; %Lets say 5 ms

f1=1e3;  %say 1 kHz
f2=20e3; %say 20 kHz
f3=30e3; %say 30 kHz

%Noisy Signal
y=5*sin(2*pi*f1*dt)+5*sin(2*pi*f2*dt)+10*sin(2*pi*f3*dt);
subplot(3,3,1) ;
plot(dt,y);
title(' Noisy Signal= y(t)');
sound(y,Fs);
%convert the noisy signal to frequency domain
nfft=length(y);
nfft2=2.^nextpow2(nfft); 

fy=fft(y,nfft2);         %FFT of y signal fy is complex: both mag and phase, but we want only mag so->

subplot(3,3,2) ;
%stem(fy);
stem(abs(fy));           %FFT is mirrored.Because both the positive and negative frequency sinusoids are 90 degrees out of phase and have the same magnitude, they will both respond to real signals in the same way. Or rather, the magnitude of their response will be the same, but the correlation phase will be different.
title(' ***** Mirrored FFT signal: fy *****');

%So we will go for only left half of the mag of the fft signal
fy=fy(1:nfft2/2);
xfft=Fs.*(0:nfft2/2-1)/nfft2; %X-axis of the fft sinal

subplot(3,3,3) ;
plot(xfft,abs(fy));
title(' ***** Left side FFT signal: mag fy *****');

subplot(3,3,5) ;
plot(xfft,abs(fy/max(fy))); %Normalising Y-axis (magnitude) to 1
title('Y(w)=Left side FFT signal: mag fy Normalised');

cut_off=1.5e3/Fs/2; % cut off frequency should be normalised to Nyquist Freq, i.e. Fs/2
order=30;

%h=fir1(order,cut_off);
%h=fir1(order,cut_off,'high');
h=fir1(order,cut_off); %Impulse response in time domain 

subplot(3,3,4) ;
stem(h);
title('Impulse response in Time Domain= h(t)');

fh=fft(h,nfft2); %Transform impulse response from time domain to frequency domain
fh=fh(1:nfft2/2); %Only LHS of the +ve frequency (X-axis/2)

subplot(3,3,6);
plot(xfft,abs(fh)); 
%plot(xfft,abs(fh/max(fh))); %Normalising Y-axis (magnitude) to 1
title('H(w)=Impulse response in Frquency Domain');

mul=fh.*fy; %Multiply Impulse response in Freq domain*FFT of y signal

subplot(3,3,7) ;
con=conv(y,h);
plot(con);
title('Result#1:Filtered signal: convoluted = y(t)*h(t)');

subplot(3,3,9);
plot(abs(mul));
%plot(xfft,abs(mul/max(mul)));
title('Result#1=Result#2:Filtered signal:Frq IR*FreqSignal= Y(w)*H(w)');

fcon=fft(con,nfft2); %Transform convoluted response from time domain to frequency domain
fcon=fcon(1:nfft2/2); %Only LHS of the +ve frequency (X-axis/2)
subplot(3,3,8);
%plot(xfft,abs(fcon)); 
plot(xfft,abs(fcon/max(fcon))); 
title('=Frequency Transform of Result#1');


