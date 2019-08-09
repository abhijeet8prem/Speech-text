function[E]=energy(a,fs)

%segmenting
[x,n,te]=segment(a,fs);
%generating hamming window
h=hamming(n);

%multipling with hamming window
for i=1:te
    for j=1:n
        z(i,j)=x(i,j)*h(j);
    end
end

%fnding energy
E=zeros(1,te);
for i=1:te
    for j=1:n
        E(i)=E(i)+(z(i,j))^2;
    end
end