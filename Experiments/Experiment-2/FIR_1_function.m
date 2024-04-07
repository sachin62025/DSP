%fir1Functions

clear;
clc;

%fir1

n = 100; % "order" of filter = # of samples of delay 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
% for simple LOW PASS filter
Wn = 0.5; % which set to half of Nyquist Freq 
         % normalised cut-off frequency which is to be [0,1]

h = fir1(n,Wn); % default LOW PASS filter

freqz(h); %Frequency response of h

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
% Normalised cut-off frequency set relative to to sampling frequency
Fs = 48000;
Nyq = Fs/2;
cutoffFreq = 1000;
Wn = cutoffFreq/Nyq;  % normalised cut-off frequency which is to be [0,1], 1 is Nyquist 
h = fir1(n,Wn);       % default LOW PASS filter
freqz(h);           %Frequency response of h
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% for simple HIGH PASS filter
% Normalised cut-off frequency set relative to to sampling frequency
Fs = 48000;
Nyq = Fs/2;
cutoffFreq = 1000;
Wn = cutoffFreq/Nyq;  % normalised cut-off frequency which is to be [0,1], 1 is Nyquist 
h = fir1(n,Wn,'high');% default HIGH PASS filter
freqz(h);           %Frequency response of h


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
% for simple BAND PASS filter
% Normalised cut-off frequency set relative to to sampling frequency
Fs = 48000;
Nyq = Fs/2;
%cutoffFreq = 1000;   %this is unnecessary in case of BAND-PASS
Wn = [0.25 0.75];     % pass band cut-offs
h = fir1(n,Wn,'high');% default BAND PASS filter
freqz(h);           %Frequency response of h
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
% for simple BAND STOP filter
% Normalised cut-off frequency set relative to to sampling frequency
Fs = 48000;
Nyq = Fs/2;
%cutoffFreq=1000;   %this is unnecessary in case of BAND-PASS
Wn = [0.25 0.75];     % pass band cut-offs
h = fir1(n,Wn,'stop');% default BAND STOP filter
freqz(h);           %Frequency response of h
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Inpur SIGNAL - White Noise
Fs = 48000;
N = 1*Fs;           % Number of samples
x = 0.2*randn(N,1); % Input SIGNAL

y = conv(x,h);
sound(x,Fs);
%sound(y,Fs);

