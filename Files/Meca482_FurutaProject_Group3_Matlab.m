% Meca482 Furuta Pendulum Project

% Anthony Van Boekel
% Will Jochum
% Alexander Lawhorn
% Brendan Ruddy
% Ceara Sobecki

% parameters
m1=0.5; % kg
m2=0.5; % kg
L1=1.0; % m
L2=1.0; % m
g=9.81; % m/sec^2
% u=@(x,t) 10.00*(t<10.01); 
u_base=@(x,t) 5*sin(2*pi*t)+10; % N*m
Mod2pi=@(a) atan2(sin(a),cos(a));
if ~isempty(whos('simout')) % Simulink output
t_sim=simout(:,1);
Theta1_sim   =simout(:,2); % base
Theta1d_sim  =simout(:,3);
Theta1dd_sim =simout(:,4);
Theta2_sim   =simout(:,5); % pendulum
Theta2d_sim  =simout(:,6);
Theta2dd_sim =simout(:,7);
U_sim        =simout(:,8); 
Flag_Pen.SimResults=true;
x_o=simout(1,[2,5,3,6]);
else
    fprintf('Run Meca482_FurutaProject_Group3_Simulink.slx to get Simulink results\n');
    Flag_Pen.SimResults=false;
    t_sim=linspace(0,1,100);
    x_o=[0,0,0,1].';
end
MassMatrixInv=@(a2) [(m1*L1^2/3+m2*L1^2+4/3*m2*L2^2*sin(a2)^2), ...
    (-m2*L1*L2*cos(a2)); (-m2*L1*L2*cos(a2)), 4/3*m2*L2^2]^-1;
Dynamics=@(t,x) [x(3);x(4);(...
    MassMatrixInv(x(2))*([u_base(x,t)+...
    -x(3)*x(4)*4/3*m2*L2^2*(2*sin(x(2))*cos(x(2)))-x(4)^2*m2*L1*L2*sin(x(2));...
    +x(3)^2*4/3*m2*L2^2*sin(x(2))*cos(x(2))+m2*g*L2*sin(x(2))]))];
[t,Theta]=ode45(Dynamics,t_sim,x_o);
Theta_dot=zeros(size(Theta));
U=zeros(size(t));
for angie=1:length(t)
    Theta_dot(angie,:)=Dynamics(t(angie),Theta(angie,:)).';
    U(angie)=u_base(Theta(angie,:),t(angie));
end
figure(50);clf;
subplot(2,1,1);
plot(t,atan2(sin(Theta(:,1:2)),cos(Theta(:,1:2)))*180/pi);
xlabel('t (sec)');ylabel('Angle (deg)');title('Set Parameter Furuta Pendulum Results');
legend('\theta_b_a_s_e','\theta_p_e_n_d_u_l_u_m');
subplot(2,1,2);
plot(t,Theta(:,3:4)*180/pi)
xlabel('t (sec)');ylabel('Angular Velocity (deg/sec)'); 
if Flag_Pen.SimResults
figure(51);clf;
plot(t,U,'b-',t_sim,U_sim,'g--');
xlabel('t (sec)');ylabel('Input (Nm)');title('Control Comparison');
legend('ode','SimMech')
figure(52);clf;
subplot(3,1,1);
plot(t,Mod2pi(Theta(:,1))*180/pi,'b-', ...
    t_sim,Theta1_sim(:)*180/pi,'g--')
ylabel('Angle (deg)');title('\theta_b_a_s_e')
legend('ode','SimMech')
subplot(3,1,2);
plot(t,Theta(:,3)*180/pi,'b-',...% t,Theta_dot(:,1)*180/pi,'c-x', ...
    t_sim,Theta1d_sim(:)*180/pi,'g-')
ylabel('Velocity (deg/sec)');
subplot(3,1,3);
plot(t,Theta_dot(:,3)*180/pi,'b-', ...
    t_sim,Theta1dd_sim(:)*180/pi,'g-')
xlabel('t (sec)');ylabel('Accel (deg/sec^2)');
figure(53);clf;
subplot(3,1,1);
plot(t,Mod2pi(Theta(:,2))*180/pi,'b-', ...
    t_sim,Theta2_sim(:)*180/pi,'g--')
ylabel('Angle (deg)');title('\theta_p_e_n')
legend('ode','SimMech')
subplot(3,1,2);
plot(t,Theta(:,4)*180/pi,'b-',...% t,Theta_dot(:,2)*180/pi,'c-x', ...
    t_sim,Theta2d_sim(:)*180/pi,'g-')
ylabel('Velocity (deg/sec)');
subplot(3,1,3);
plot(t,Theta_dot(:,4)*180/pi,'b-', ...
    t_sim,Theta2dd_sim(:)*180/pi,'g-')
xlabel('t (sec)');ylabel('Accel (deg/sec^2)');
end