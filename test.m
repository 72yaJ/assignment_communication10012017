%{
clear 

Tb=1;A=1;fc=4;%输入信号参数:码元长度Tb;正弦信号幅度A;频率fc;

dt=0.001;t=0:dt:Tb;

s=A*sin(2*pi*fc*t);%匹配滤波器输入正弦信号;

h=sin(2*pi*fc*(Tb-t));% 匹配滤波器冲激响应h（t）=s(Tb-t);

y=conv(s,h)*dt; %计算卷积积分，匹配滤波器输出

ty=[1:1:length(y)]*dt;

subplot(3,1,1);

plot(t,s,'g');

subplot(3,1,2);

plot(t,h,'g');

subplot(3,1,3);

plot(ty,0*ty,'g',ty,y,'g');hold on

axis([0,2,-0.5,0.5]);

xlabel('正弦信号的匹配虑波器输出') 


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
a=sigexpand(d,N_sample); % 输入数字序列
st=conv(a,gt);  % 输入双极性NRZ数字基带波形

ht1=gt;
rt1=conv(st,ht1); % 方波滤波后输出
ht2=5*sinc(5*(t-5)/Ts);
rt2=conv(st,ht2);
figure(1)
subplot(321)
plot(t,st(1:length(t)));
axis([0 20 -1.5 1.5]);ylabel('输入双极性NRZ数字基带波形 ');
subplot(322)
stem(t,a);
axis([0 20 -1.5 1.5]);ylabel('输入数字序列');
subplot(323)
plot(t,[0 rt1(1:length(t)-1)]/8);
axis([0 20 -1.5 1.5]);ylabel('方波滤波后输出');
subplot(324)
dd=rt1(N_sample:N_sample:end);
ddd=sigexpand(dd,N_sample);
stem(t,ddd(1:length(t))/8);
axis([0 20 -1.5 1.5 ]);ylabel('方波滤波后抽样输出');
subplot(325)
plot(t-5,[0 rt2(1:length(t)-1)]/8);
axis([0 20 -1.5 1.5 ]);
xlabel('t/Ts');ylabel('理想低通滤波器输出');
subplot(326)
dd=rt2(N_sample-1:N_sample:end);
ddd=sigexpand(dd,N_sample);
stem(t-5,ddd(1:length(t))/8);
axis([0 20 -1.5 1.5 ]);
xlabel('t/Ts');ylabel('理想低通滤波器抽样输出 ');
function[out]=sigexpand(d,M);
N=length(d);
out=zeros(M,N);
out(1,:)=d;
out=reshape(out,1,M*N);
end




