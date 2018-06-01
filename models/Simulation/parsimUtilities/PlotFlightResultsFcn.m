function [] = PlotFlightResultsFcn(simIn, simOut)
% This function is used to plot the results of a flight simulation. 
% Input arguments:
%  simIn - Simulink.SimulationInput containing the input values to the Simulation
%  simOut - simStruct containing the results of the simulaiton
%
%  Copyright 2018 The MathWorks, Inc.

sigs = simOut.get('logsout');

% Position
% ========

% Estimated Position
x = sigs.get('apStatus').Values.Xe.Data(:,1);
y = sigs.get('apStatus').Values.Xe.Data(:,2);

% Estimated Velocities
vn = sigs.get('apStatus').Values.Ve.Data(:,1);
ve = sigs.get('apStatus').Values.Ve.Data(:,2);

simIn_var_names = {simIn.Variables.Name};

uav = simIn.Variables(strcmp('uav', simIn_var_names)).Value;

% Initial Position
IP = uav.ic.Pos_0;

% Waypoints
Xwpt = simIn.Variables(strcmp('Xpoints', simIn_var_names)).Value;
Ywpt = simIn.Variables(strcmp('Ypoints', simIn_var_names)).Value;

% Keep all waypoints that are not [0,0]
both_zero = and(Xwpt==0, Ywpt==0);
Xwpt = Xwpt(not(both_zero));
Ywpt = Ywpt(not(both_zero));

% housekeeping variables
i =  length(vn);

% Produce XY Plot of the mission
figure;
clf;

% Plot the waypoint path 
plot(Ywpt,Xwpt,'k','LineWidth',0.5);
hold on

% Label the Waypoints
for nn = 1:length(Xwpt)
    text(double(Ywpt(nn)+25),double(Xwpt(nn)+25),num2str(nn))
end

% Plot WPs themselves
plot([Ywpt(end) Ywpt(1)],[Xwpt(end) Xwpt(1)],'k','LineWidth',0.5);
plot(Ywpt,Xwpt,'sk');

title('Position');

%plot the initial Point
if (~isempty(IP))
    plot( IP(2), IP(1),'ks','MarkerSize',5,'MarkerFaceColor','g');
end
plot( y(100), x(100),'ks','MarkerSize',15,'MarkerFaceColor','b');
axis equal;

for j=100:100:i-1
    plot(y(j),x(j) ,'-s','MarkerSize',3);
    
    %plot the velocity vector
    plot ([y(j) y(j)+ve(j)], [x(j) x(j)+vn(j)], 'r');
end
plot(y(100:end),x(100:end) ,'-','LineWidth',2.5);
xlabel('Y(m)');
ylabel('X(m)');
grid on;
hold off
end