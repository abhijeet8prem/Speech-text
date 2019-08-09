clear;
clc;
[a,fs1]=audioread('A7.wav');
[s,fs2]=audioread('A8.wav');

%finding energy
E1=energy(a,fs1);
E2=energy(s,fs2);
Ma1=mean(E1)
Ms1=mean(E2)
%findng zero crssing
za=zerocrossing(a,fs1);
Ma2=mean(za)
zs=zerocrossing(s,fs2);
Ms2=mean(zs)