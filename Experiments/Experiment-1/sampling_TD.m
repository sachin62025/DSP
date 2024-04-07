clc; % clear screen
clear all; % clear work space
close all; % close all figure windows
tfinal = 0.05; % define final value of time vector
t= 0:0.00005: tfinal; % define time vector for analog signal
fd= input('enter the analog frequency'); % enter the analog frequency
xt = sin(2*pi*fd*t); % define analog signal
fs1 = 1.3*fd;% simulate condition for under sampling
n1= 0: 1/fs1: tfinal; % define time vector for discrete signal
xn = sin(2*pi*n1*fd);% to generate under sampled signal 
subplot(3,1,1);
plot(t,xt,'b',n1,xn,'r*-');% plot the analog and sampled signal
title('under sampling');
fs2= 2*fd;% simulate condition for nyquist rate
n2= 0:1/fs2:tfinal; % define time vector for discrete signal
xn = sin(2*pi*n2*fd);% to generate under sampled signal
subplot(3,1,2);
plot(t,xt,'b',n2,xn,'r*-');% plot the analog and sampled signal
title('nyquist rate');
fs3 = 2.5*fd;% simulate condition for over sampling
n3= 0:1/fs3:tfinal;% define time vector for disrete signal
xn = sin(2*pi*n3*fd);%generate over sampling signal
subplot(3,1,3);
plot(t,xt,'b',n3,xn,'r*-');% plot the analog and sampled signal
title('over sampling');