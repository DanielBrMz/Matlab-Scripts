% Define valve dimensions
d = 1; % diameter of the valve
h = 2; % height of the valve

% Define coordinates for the valve
theta = linspace(0,2*pi);
x = d/2*cos(theta);
y = d/2*sin(theta) + h/2;

% Create plot
hold on
fill(x,y,'r') % fill valve with red color
plot([-d/2,d/2],[h/2,h/2],'k') % draw top of valve
plot([-d/2,d/2],[-h/2,-h/2],'k') % draw bottom of valve
plot([-d/2,-d/2],[-h/2,h/2],'k') % draw left side of valve
plot([d/2,d/2],[-h/2,h/2],'k') % draw right side of valve
axis equal