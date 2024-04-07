% PROGRAM FOR THE DESIGN OF FIR LPF, HPF, BPF & BSF USING RECTANGULAR WINDOW
%Enter the Pass Band Ripple: .05
%Enter the Stop Band Ripple: .04
%Enter the Pass Band Frequency: 1500
%Enter the Stop Band Frequency: 2000
%Enter the Sampling Frequency: 8000

%We want to design a Discrete Time Low Pass Filter for a voice signal. The specifications are:
%Passband fp=1500 Hz, with 0.05dB ripple;
%Stopband fs=2000 Hz, with 50dB attenuation and with 0.04dB ripple;
%Sampling Frequency f=8000 Hz.
%Recall the mapping from analog to digital frequency normalised passband fequency is given by wp = 2*fp/f, and normalised stopband fequency is given by ws = 2*fp/f with f as the sampling frequency.

clc; close all; clear all;
rp = input('Enter the Pass Band Ripple: ');
rs = input('Enter the Stop Band Ripple: ');
fp = input('Enter the Pass Band Frequency: ');
fs = input('Enter the Stop Band Frequency: ');
f = input('Enter the Sampling Frequency: ');
wp = 2 * fp/f;
ws = 2 * fs/f;
num = - 20 * log(sqrt(rp*rs))- 13;
den = 14.6 * (fs-fp)/f;
n = ceil (num/den) ;
n1 = n+1;
if(rem(n,2)~=0)
n1 = n;
n = n-1;
end
y = boxcar (n1) ;
disp('Filter ordern n= ');n

% LOW PASS FILTER
b = fir1(n,wp,y);
[h,w] = freqz(b,1,256);
%[h,w] = freqz(b,a,n) returns the n-point frequency response vector h and the corresponding angular frequency vector w for the digital filter with transfer function coefficients stored in b and a.
%Ref: https://in.mathworks.com/help/signal/ref/freqz.html
m = 20 * log(abs(h));
subplot(2,2,1) ;
plot (w/pi,m) ;
title(' ***** RECTANGULAR WINDOW or BOXCAR *****');
ylabel('Gain indb------>');xlabel(' (a) Normalised Frequency------->');

% HIGH PASS FILTER
b = fir1(n,wp,'high',y);
[h,w] = freqz(b,1,256);
m = 20*log(abs(h));
subplot(2,2,2);
plot(w/pi,m);
ylabel('Gain in db------>');
xlabel(' (b) Normalised Frequency------->');

% BAND PASS FILTER
wn = [wp ws]; 
b = fir1(n,wn,y);
[h,w] = freqz(b,1,256);
m = 20*log(abs(h));
subplot(2,2,3) ;
plot (w/pi, m) ;
ylabel('Gain in db------>');
xlabel(' (c) Normalised Frequency------->');

% BAND STOP FILTER
b = fir1(n,wn,'stop',y);
[h,w] = freqz(b,1,256);
m = 20*log(abs(h));
subplot(2,2,4) ;
plot (w/pi, m) ;
ylabel('Gain in db------>');
xlabel(' (d) Normalised Frequency------->');