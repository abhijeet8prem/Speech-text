clear;
clc;
[a,fs1]=audioread('a.wav');
[s,fs2]=audioread('s.wav');

%finding energy
E1=energy(a,fs1);
E2=energy(s,fs2);
Ma1=mean(E1);
Ms1=mean(E2);
%findng zero crssing
za=zerocrossing(a,fs1);
Ma2=mean(za);
zs=zerocrossing(s,fs2);
Ms2=mean(zs);
%  za=[za' zeros(1,length(E1)-length(za))]
A=[E1 
    za'];
A=A';

S=[E2 
    zs'];
S=S';

meas=[A 
    S];
species=cell(85,1);
for i=1:length(meas)
    if i<=length(A)
        species(i)=cellstr('A');
    else
        species(i)=cellstr('S');
    end
end


figure
x = meas(:,1:2);
%choose query point
newpoint =[Ma1 Ma2];
[n,d]=knnsearch(x,newpoint,'k',20);
gscatter(x(:,1),x(:,2),species)
line(newpoint(:,1),newpoint(:,2),'marker','x','color','k',...
'markersize',10,'linewidth',2)
line(x(n,1),x(n,2),'color',[.5 .5 .5],'marker','o',...
'linestyle','none','markersize',10)
set(legend,'location','best')
tb=tabulate(species(n,:));
m=cell2mat(tb(:,2))
[val,pos]=max(m)