clc; % clear screen
close all; % close all figure windows
clear all; % clear work space
f1 = input('Enter the first sine wave frequency = '); % Enter the first sinusoidal frequency 
f2 = input('Enter the second sine wave frequency = '); % Enter the second sinusoidal freq
fn = 2*max(f1,f2); % simulate condition for nyquist rate
fs = fn/2;% define sampling frequency for under sampling as half nyquist rate
t = [0:1/fs:0.1]; % define time vector
x = cos(2*pi*f1*t)+cos(2*pi*f2*t); % Generate the discrète time signal
xk = fft(x); % take Fourier transform of discrète time signal
f = [0:length(xk)-1]*fs/length(xk); % define the frequency axis
figure(1); % open figure window
plot(f,abs(xk)); % plot the absolute value of fourier transform of discrete signal
xlabel('frequency'); % label x axis
ylabel('amplitude'); % label y axis
title('Under Sampling'); % graph title
grid;
fs = fn; % nyquist rate
t = [0:1/fs:0.1]; % define time vector
x = cos(2*pi*f1*t)+cos(2*pi*f2*t); % Generate the discrète time signal
xk = fft(x); % take Fourier transform of discrète time signal
f = [0:length(xk)-1]*fs/length(xk); % define the frequency axis
figure(2); % open figure window
plot(f,abs(xk)); % plot the absolute value of Fourier transform of discrete signal
xlabel('frequency'); % label x axis
ylabel('amplitude'); % label y axis
title('Nyquist Rate Sampling'); % graph title
grid;
fs = 2*fn; % oversampling
t = [0:1/fs:0.1]; % défine time vector
x = cos(2*pi*f1*t)+cos(2*pi*f2*t); %Generate the discrete time signal
xk = fft(x); % take Fourier transform of discrete time signal
f = [0:length(xk)-1]*fs/length(xk); % define the frequency axis
figure(3); % open figure window
plot(f,abs(xk)); % plot the absolute value of Fourier transform of discrete signal
xlabel('freq'); % label x axis
ylabel('amplitude'); % label y axis
title('Over Sampling'); % graph title
grid;
