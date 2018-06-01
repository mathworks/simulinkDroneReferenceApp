function [] = PlotFlightResults(simOut)
%  Copyright 2018 The MathWorks, Inc.

sigs = simOut.get('logsout');

% Position
% ========

% Real Position from 6DOF model
x_real = sigs.get('uavState').Values.X_e.Data(:,1);
y_real = sigs.get('uavState').Values.X_e.Data(:,2);
z_real = sigs.get('uavState').Values.X_e.Data(:,3);

% Estimated Position
x = sigs.get('apStatus').Values.Xe.Data(:,1);
y = sigs.get('apStatus').Values.Xe.Data(:,2);
z = sigs.get('apStatus').Values.Xe.Data(:,3);

% Real Velocities from 6DOF model
vn_real = sigs.get('uavState').Values.V_e.Data(:,1);
ve_real = sigs.get('uavState').Values.V_e.Data(:,2);
vd_real = sigs.get('uavState').Values.V_e.Data(:,3);

% Estimated Velocities
vn = sigs.get('apStatus').Values.Ve.Data(:,1);
ve = sigs.get('apStatus').Values.Ve.Data(:,2);
vd = sigs.get('apStatus').Values.Ve.Data(:,3);


uav = evalin('base', 'uav');

% Initial Position
IP = uav.ic.Pos_0;

% L1 Guidance Vector
L2 = sigs.get('L2').Values.Data;

% Waypoints
Xwpt = evalin('base', 'Xpoints');
Ywpt = evalin('base', 'Ypoints');
Zwpt = evalin('base', 'Zpoints');


%  Get time vector
timeAp = sigs.get('apStatus').Values.Euler.Time;
timePl = sigs.get('uavState').Values.X_e.Time;


% Estimated Euler_hat Angles
phi = sigs.get('apStatus').Values.Euler.Data(:,1);
theta = sigs.get('apStatus').Values.Euler.Data(:,2);
psi = sigs.get('apStatus').Values.Euler.Data(:,3);

% Real Euler Angles
phi_real = sigs.get('uavState').Values.Euler.Data(:,1);
theta_real = sigs.get('uavState').Values.Euler.Data(:,2);
psi_real = sigs.get('uavState').Values.Euler.Data(:,3);


phi_cPl = sigs.get('midLevelCmds').Values.phi_c.Data;
theta_cPl = sigs.get('theta_c').Values.Data;

% Collect Airspeed
umPl = sigs.get('apStatus').Values.ias.Data(:,1);
um_cPl = sigs.get('midLevelCmds').Values.U_c.Data(:);

% Altitude
h_cPl = sigs.get('midLevelCmds').Values.h_c.Data(:);


% housekeeping variables
i =  length(vn);
figct = 1;

% Turn the Pause On
pauseOn = 1;

%% Produce XY Plot of the mission
figure(figct);
clf;

% Plot the waypoint path 
plot(Ywpt,Xwpt,'k','LineWidth',0.5);
hold on

% Label the Waypoints
for nn = 1:length(Xwpt)
    text(Ywpt(nn)+25,Xwpt(nn)+25,num2str(nn))
end

% Plot WPs themselves
plot([Ywpt(end) Ywpt(1)],[Xwpt(end) Xwpt(1)],'k','LineWidth',0.5);
plot(Ywpt,Xwpt,'sk');


title('Position and L2 Vector');

%plot the initial Point
if (~isempty(IP))
    plot( IP(2), IP(1),'ks','MarkerSize',15,'MarkerFaceColor','g');
end

axis equal;
idx = 1:25:i;

for j=100:100:i-1
    plot(y(j),x(j) ,'-s','MarkerSize',3);
    
    %plot the velocity vector
    plot ([y(j) y(j)+ve(j)], [x(j) x(j)+vn(j)], 'r');
    
    %plot the L2 vector
    if j > 10 % REN 05/24/10 && L2Enabled(j) == 1
    %    plot ([y(j) y(j)+L2(j,2)], [x(j) x(j)+L2(j,1)], 'm-');
    end
    
    %pause the animation
    if pauseOn == 1
        if (mod(j,200)==0)
            pause(0.1);
        end
    end
end
plot(y(100:end),x(100:end) ,'-','LineWidth',2.5);
xlabel('Y(m)');
ylabel('X(m)');
grid on;
hold off

eval(['print -dpng  '  num2str(figct) '_'  datestr(now,1) '_' ...
    datestr(now,'HH') '_' datestr(now,'MM') '_' datestr(now,'SS')]);

figct = figct + 1;

%% Plot the Inner Loop Commands
figure(figct)
clf
subplot(4,1,1)
    plot(timeAp(50:end),umPl(50:end),'b', timeAp(50:end), um_cPl(50:end), 'r');
    xlabel('Time(s)');
    ylabel('Airspeed (m/s)');
    legend('Measured','Commanded');
    axis tight
    grid on;
    
subplot(4,1,2)
    plot(timeAp(50:end),phi(50:end)*180/pi,'b',timeAp(50:end),phi_cPl(50:end)*180/pi,'r');
    xlabel('Time(s)');
    ylabel('\phi (deg)');
    legend('Measured','Commanded');
    axis tight
    grid on;
    
subplot(4,1,3)
    plot(timeAp(50:end),theta(50:end)*180/pi,'b',timeAp(50:end),theta_cPl(50:end)*180/pi,'r');
    xlabel('Time(s)');
    ylabel('\theta (deg)');
    legend('Measured','Commanded');
    axis tight
    grid on;

subplot(4,1,4)
    plot(timeAp(50:end), z(50:end), 'b', timeAp(50:end), h_cPl(50:end), 'r');
    xlabel('Time(s)');
    ylabel('Altitude (m)');
    legend('Measured', 'Commanded');
    axis tight
    grid on;

eval(['print -dpng  '  num2str(figct) '_'  datestr(now,1) '_' ...
    datestr(now,'HH') '_' datestr(now,'MM') '_' datestr(now,'SS')]);

figct = figct + 1;

%% Plot the Estimated vs Real Position
% Remove first second to account for filter convergence
figure(figct)
clf
subplot(3,1,1)
    plot(timeAp(100:end), x(100:end), 'b', timePl(200:end), x_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('X (m)');
    legend('Estimated', 'Real');
    axis tight
    grid on;

subplot(3,1,2)
    plot(timeAp(100:end), y(100:end), 'b', timePl(200:end), y_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('Y (m)');
    legend('Estimated', 'Real');
    axis tight
    grid on;
    
subplot(3,1,3)
    plot(timeAp(100:end), -z(100:end), 'b', timePl(200:end), z_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('Z (m)');
    legend('Estimated', 'Real');
    axis tight
    grid on; 
    
eval(['print -dpng  '  num2str(figct) '_'  datestr(now,1) '_' ...
    datestr(now,'HH') '_' datestr(now,'MM') '_' datestr(now,'SS')]);

figct = figct + 1;

%% Plot the Estimated vs. Real Velocities
% Remove first second to account for filter convergence
figure(figct)
clf
subplot(3,1,1)
    plot(timeAp(120:end), vn(120:end), 'b', timePl(240:end), vn_real(240:end), 'r');
    xlabel('Time(s)');
    ylabel('V_n(m/s)');
    legend('Estimated', 'Real');
    axis tight
    grid on;

subplot(3,1,2)
    plot(timeAp(120:end), ve(120:end), 'b', timePl(240:end), ve_real(240:end), 'r');
    xlabel('Time(s)');
    ylabel('V_e(m/s)');
    legend('Estimated', 'Real');
    axis tight
    grid on;
    
subplot(3,1,3)
    plot(timeAp(120:end), -vd(120:end), 'b', timePl(240:end), vd_real(240:end), 'r');
    xlabel('Time(s)');
    ylabel('V_d(m/s)');
    legend('Estimated', 'Real');
    axis tight
    grid on; 
    
eval(['print -dpng  '  num2str(figct) '_'  datestr(now,1) '_' ...
    datestr(now,'HH') '_' datestr(now,'MM') '_' datestr(now,'SS')]);

figct = figct + 1;

%% Plot the Estimated vs. Real Velocities
% Remove first second to account for filter convergence
figure(figct)
clf
subplot(3,1,1)
    plot(timeAp(100:end), phi(100:end), 'b', timePl(200:end), phi_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('\phi(rad)');
    legend('Estimated', 'Real');
    axis tight
    grid on;

subplot(3,1,2)
    plot(timeAp(100:end), theta(100:end), 'b', timePl(200:end), theta_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('\theta(rad)');
    legend('Estimated', 'Real');
    axis tight
    grid on;
    
subplot(3,1,3)
    plot(timeAp(100:end), psi(100:end), 'b', timePl(200:end), psi_real(200:end), 'r');
    xlabel('Time(s)');
    ylabel('\psi(rad)');
    legend('Estimated', 'Real');
    axis tight
    grid on; 
    
eval(['print -dpng  '  num2str(figct) '_'  datestr(now,1) '_' ...
    datestr(now,'HH') '_' datestr(now,'MM') '_' datestr(now,'SS')]);

figct = figct + 1;
