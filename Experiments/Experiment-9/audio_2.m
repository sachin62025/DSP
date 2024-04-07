clc;
clear all;

%Noisy Signal

load handel.mat

filename = 'handel.wav';
audiowrite(filename,y,Fs);
clear y Fs
info = audioinfo("handel.wav");
[y,Fs] = audioread('handel.wav');
%sound(y,Fs);
Ts=1/Fs;         %set sampling time
t = 0:(1/Fs):8.9249;
t = t(1:end-1);

nfft=length(y);
nfft2=2.^nextpow2(nfft); 
fy=fft(y,nfft2);

fy=fy(1:nfft2/2);
xfft=Fs.*(0:nfft2/2-1)/nfft2;
plot(xfft,abs(fy));
title(' ***** Left side FFT signal: mag fy *****');

f_pass = input('Enter the Pass Band Frequency: ');
f_stop = input('Enter the Stop Band Frequency: ');
rp = input('Enter the Pass Band Ripple: ');
rs = input('Enter the Stop Band Ripple: ');

wp = 2 * f_pass /Fs;
ws = 2 * f_stop/Fs;
%cut_off=1.5e3/Fs/2; % cut off frequency should be normalised to Nyquist Freq, i.e. Fs/2
%order=30;

num = - 20 * log( sqrt(rp*rs))- 13;
den = 14.6 * (f_stop-f_pass)/Fs;
n = ceil (num/den) ;
n1 = n+1;           %Adjusting the filter order. 
                    % The order of window must be an odd number and 
                    % the order of filter must be one less than that of the window
if(rem(n,2)~=0)
n1 = n;
n = n-1;
end
z = hamming(n1);

% LOW PASS FILTER
h_low = fir1(n,wp,z);

% HIGH PASS FILTER
h_high = fir1(n,wp,'high',z);

% BAND PASS FILTER
wn = [wp ws]; 
h_band = fir1(n,wn,"bandpass",z);

con_L=conv(y,h_low);
%sound(con_L,Fs);

con_H=50.*conv(y,h_high);
sound(con_H,Fs);

con_B=conv(y,h_band);
%sound(con_B,Fs);

