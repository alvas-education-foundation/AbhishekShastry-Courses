%{
A raw ECG signal is available at ECE-3year-Code-Challenge, with file name a01_3.csv, you can download this file and perform the following task:
Read and plot this signal
Filter the ECG signal using Butterworth and plot the filtered signal.
Apply the Pan Tompkins algorithm and find the R peaks.
Segregate this signal into each beat and plot.
Apply the Fourier Transform to each beat and understand the frequency components by plotting the periodogram.
%}
%% CODE
clc;
clear all;
close all;
d = importdata('data.xls');
Raw_data = ((d.data(:,2)))
Time_data = ((d.data(:,1)))
%% ECG Signal Plot
figure(1);

plot(Time_data,Raw_data);
title('Raw ECG Signal Plot');
xlabel('Time----->');
ylabel('ECG Data----->');

%% Filtering of ECG Signal
fp= 500;
fs= 80;
n= 2;
[b,a]= butter(n,fs/fp);
filtered_signal = filter(b,a,Raw_data);
figure(2)

plot(Time_data(1:1000),filtered_signal(1:1000))
title('Filtered ECG Signal')
xlabel('Time----->');
ylabel('ECG Data----->');

%% Detecting R-Peaks using Pan Tompkins algorithm and Segregation of signal
R_D = Raw_data
y=length(R_D);
fs = 200;              
N = length (R_D);       
t = [0:N-1]/fs;        
R_D = R_D - mean (R_D );    
R_D = R_D/ max( abs(R_D )) ;
b=[1 0 0 0 0 0 -2 0 0 0 0 0 1];
a=[1 -2 1];
h=filter(b,a,[1 zeros(1,12)]); 
x1 = conv (R_D ,h);
x1 = x1/ max( abs(x1 )); 
b = [-1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 -32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
a = [1 -1];
h1=filter(b,a,[1 zeros(1,32)]); 
x2 = conv (x1 ,h1);
x2 = x2/ max( abs(x2 ));
h = [-1 -2 0 2 1]/8;
x3 = conv (x2 ,h);
x3 = x3 (2+[1: N]);
x3 = x3/ max( abs(x3 ));
figure(3)
subplot(2,1,1);
plot([0:length(x3)-1]/fs,x3);
subplot(2,1,2);
plot(t(200:600),x3(200:600));
title('Segregation of signal');
xlim([1 3])
x4 = x3 .^2;
x4 = x4/ max( abs(x4 ));
h = ones (1 ,31)/31;
Delay = 15; 
x5 = conv (x4 ,h);
x5 = x5 (15+[1: N]);
x5 = x5/ max( abs(x5 ));
maxr = max(x5);
thresh = mean (x5 );
k=thresh*maxr;
y =(x5>k)';
left = find(diff([0 y])==1);
right = find(diff([y 0])==-1);
left=left-20;
for i=1:length(left)
   [R2(i) Rl(i)] = max( R_D(left(i):right(i)) );
   Rl(i) = Rl(i)+left(i) ;
   for j=1:20
   x(j)=left(j);
  for l=1:20;
  k(l)=left(j)-left(j+1);
  y=-1*mean2(k(l));
  end
 end
end
figure(4)
plot (t,R_D/max(R_D) , t(Rl) ,R2 , 'r*');
title('Detection of R-Peaks');
xlabel('Time----->');
ylabel('ECG Data----->');
xlim([1 3])
