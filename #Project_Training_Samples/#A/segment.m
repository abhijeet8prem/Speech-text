function[x,n,t]=segment(amp,fs)
n=0.03*fs;
off=floor(0.015*fs);
v=1;
ln=length(amp);
t=floor(ln/(n-off));
%segmenting 
for i=1:t
    for j=1:n
        if v<=ln
        x(i,j)=amp(v);
        v=v+1;
        else
         x(i,j)=0; 
        end
    end
    v=v-off;
end
