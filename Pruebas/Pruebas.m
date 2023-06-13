% Definir los valores de theta y pi para la esfera princpal
theta = linspace(0,2*pi,200);
phi = linspace(0,pi,200);

% Generate meshgrid from theta and phi values
[theta,phi] = meshgrid(theta,phi);

% Calculate x, y, and z coordinates for the sphere
x = cos(theta).*sin(phi);
y = sin(theta).*sin(phi);
z = cos(phi);

% Plot the main sphere
h = surf(x,y,z);

% Change the color of the sphere to black with light
colormap gray;
shading interp;

% Add lighting to the plot
light;

% Add coordinates to the sphere
hold on;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title("Galletero")

% Scale the sphere to create the appearance of ears
x_ear1 = x.*0.6;
y_ear1 = y.*0.6 + 1.4;
z_ear1 = z.*0.6 + 1.2;

x_ear2 = x.*0.6;
y_ear2 = y.*0.6 - 1.4;
z_ear2 = z.*0.6 + 1.2;

% Plot the first ear
surf(x_ear1, y_ear1, z_ear1);

% Plot the second ear
surf(x_ear2, y_ear2, z_ear2);

% Adjust the camera viewpoint
view(3);

% Adjust the axis limits
axis square;
axis vis3d;
axis tight;