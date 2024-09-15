function Tab5(~, ~, ~, ~)
    %% Constants
    h = 6.626e-34;  % Planck's constant (m²·kg/s)
        %% Example parameters
mass5 = 9.109e-31;  
velocity5 = 2e6;    
d5 = 1e-4;          
L5 = 1.0; 
    %% Calculate de Broglie wavelength
    wavelength = h / (mass5 * velocity5);
          
    
    %% Parameters for the double slit experiment
    L = L5;  % Distance from slits to screen (m)
    d = d5;  % Distance between slits (m)
    x = linspace(-0.02, 0.02, 1000);  % Screen width (meters)
    
    %% Calculate interference pattern
    k5 = 2 * pi / wavelength;  % Wave number
    theta5 = atan(x / L);  % Angle of interference
    I = (cos(k5 * d * sin(theta5) / 2)).^2;  % Intensity pattern 
    
    %% Plot the interference pattern
    figure;
    plot(x, I, 'LineWidth', 1.5);
    title('Double-Slit Experiment Simulation');
    xlabel('Position on Screen (m)');
    ylabel('Intensity');
    grid on;
end
