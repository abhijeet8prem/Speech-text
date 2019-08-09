function[za]=zerocrossing(a,fs1)
%finding zero count of each segment

%segmenting a
[A,n,t]=segment(a,fs1);

%generating hamming window
h=hamming(n);

za=zeros(t,1);

for i=1:t
    for j=1:n
        if j<n-1
        za(i)=za(i)+(abs(sign(A(i,j+1))-sign(A(i,j))))*h(j);
        end
    end
    za(i)=floor(za(i)/2);
end

