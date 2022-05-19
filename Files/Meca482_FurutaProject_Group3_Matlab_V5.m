% Meca482 Furuta Pendulum Project

% Anthony Van Boekel
% Will Jochum
% Alexander Lawhorn
% Brendan Ruddy
% Ceara Sobecki

etag=0.85;
etam=0.87;
kg=70;
km=0.76e-2;
kt=0.76e-2;
rm=0.26e1;
vm=0;
jp=0.23e-2;
mp=0.125;
lr=0.215;
mr=0.250;
lp=0.335;
jr=0.23e-2;
bp=0;
tau1=0;
g=9.81e1;
tau2=0;
br=0;

A=[0 0 1 0;
   0 0 0 1;
   0 (lp^2*lr*g*mp^2)/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr) -(lp^2*etag*etam*kg^2*km*kt*mp+4*jp*etag*etam*kg^2*km*kt+br*lp^2*mp*rm+4*br*jp*rm)/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr) -2*bp*lp*lr*mp/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr);
   0 -2/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr)*(-lp*lr^2*g*mp^2*rm-jr*lp*g*mp*rm) -2/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr)*(lp*lr*etag*etam*kg^2*km*kt*mp+br*lp*lr*mp*rm) -2/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr)*(2*bp*lr^2*mp*rm+2*bp*jr*rm);];
B=[0;
   0;
   -(-lp^2*etag*etam*kg*kt*mp-4*jp*etag*etam*kg*kt)/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr);
   2/rm/(4*jp*lr^2*mp+jr*lp^2*mp+4*jp*jr)*lp*lr*etag*etam*kg*kt*mp;];
C=[1 0 0 0];
D=[0];

[num,den]=ss2tf(A,B,C,D);
TF=tf(num, den);
disp("Transfer Function Open Loop");
TF

disp("Zeros");
disp(roots(num));
disp("Poles");
disp(roots(den));
figure(1);
rlocus(TF);
title("Root Locus Open Loop");

os=10;
ts=3;
disp("Desired Overshoot");
disp(os);
disp("Desired Settling Time");
disp(ts);

zeta=(-(log(os/200))/sqrt(pi^2+(log(os/100))^2));
wn=4/(zeta*ts);
sigma=zeta*wn;
wd=wn*(1-zeta^2)^0.5;

p1=-sigma+1i*wd;
p2=conj(p1);
p3=-sigma*10;
p4=-5.9473;

Q=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
R=0.0005;
K=lqr(A,B,Q,R);
disp('K Matrix');
disp(K);

disp('Closed loop eigenvalues');
disp(eig(A-B*K));
[num,den]=ss2tf(A-B*K,B,C,D);
TF=tf(num,den);
DC=dcgain(TF);

N=1/DC;
info=stepinfo(TF);

disp("Transfer Function Closed Loop");
TF
disp("Zeros");
disp(roots(num));
disp("Poles");
disp(roots(den));
figure(2);
rlocus(TF);
title("Root Locus Closed Loop");
disp("Closed Loop Overshoot");
disp(info.Overshoot);
disp("Closed Loop Settling Time");
disp(info.SettlingTime);
