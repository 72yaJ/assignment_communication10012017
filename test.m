%{
clear 

Tb=1;A=1;fc=4;%�����źŲ���:��Ԫ����Tb;�����źŷ���A;Ƶ��fc;

dt=0.001;t=0:dt:Tb;

s=A*sin(2*pi*fc*t);%ƥ���˲������������ź�;

h=sin(2*pi*fc*(Tb-t));% ƥ���˲����弤��Ӧh��t��=s(Tb-t);

y=conv(s,h)*dt; %���������֣�ƥ���˲������

ty=[1:1:length(y)]*dt;

subplot(3,1,1);

plot(t,s,'g');

subplot(3,1,2);

plot(t,h,'g');

subplot(3,1,3);

plot(ty,0*ty,'g',ty,y,'g');hold on

axis([0,2,-0.5,0.5]);

xlabel('�����źŵ�ƥ���ǲ������') 


return
%}


clear all;
close all;
N=100;
N_sample=8;      
Ts=1;
dt=Ts/N_sample;
t=0:dt:(N*N_sample-1)*dt;
gt=ones(1,N_sample);
d=sign(randn(1,N));
a=sigexpand(d,N_sample); % ������������
st=conv(a,gt);  % ����˫����NRZ���ֻ�������

ht1=gt;
rt1=conv(st,ht1); % �����˲������
ht2=5*sinc(5*(t-5)/Ts);
rt2=conv(st,ht2);
figure(1)
subplot(321)
plot(t,st(1:length(t)));
axis([0 20 -1.5 1.5]);ylabel('����˫����NRZ���ֻ������� ');
subplot(322)
stem(t,a);
axis([0 20 -1.5 1.5]);ylabel('������������');
subplot(323)
plot(t,[0 rt1(1:length(t)-1)]/8);
axis([0 20 -1.5 1.5]);ylabel('�����˲������');
subplot(324)
dd=rt1(N_sample:N_sample:end);
ddd=sigexpand(dd,N_sample);
stem(t,ddd(1:length(t))/8);
axis([0 20 -1.5 1.5 ]);ylabel('�����˲���������');
subplot(325)
plot(t-5,[0 rt2(1:length(t)-1)]/8);
axis([0 20 -1.5 1.5 ]);
xlabel('t/Ts');ylabel('�����ͨ�˲������');
subplot(326)
dd=rt2(N_sample-1:N_sample:end);
ddd=sigexpand(dd,N_sample);
stem(t-5,ddd(1:length(t))/8);
axis([0 20 -1.5 1.5 ]);
xlabel('t/Ts');ylabel('�����ͨ�˲���������� ');
function[out]=sigexpand(d,M);
N=length(d);
out=zeros(M,N);
out(1,:)=d;
out=reshape(out,1,M*N);
end




