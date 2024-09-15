function Tab6(mass, velocity, slitSeparation, screenDistance, noiseLevel)
    %% Constants
    h = 6.626e-34;   % Planck's constant (m²·kg/s)
    %% Example parameters
mass = 1e-30;           % Mass of the particle (in kg)
velocity = 1e6;        % Velocity of the particle (in m/s)
slitSeparation = 1e-4; % Distance between the slits (in meters)
screenDistance = 1.0;  % Distance from the slits to the screen (in meters)
noiseLevel = 0.05;     % Level of Gaussian noise



    %% Convert units and calculate de Broglie wavelength
    mass = mass * 1e-30;  % Convert from slider range (kg)
    wavelength = h / (mass * velocity);  % Calculate de Broglie wavelength
    
    %% Parameters
    L = screenDistance;  % Distance from slits to screen (m)
    d = slitSeparation;  % Distance between slits (m)
    x = linspace(-0.02, 0.02, 1000);  % Screen width (m)
    
    %% Calculate interference pattern
    k = 2 * pi / wavelength;  % Wave number
    theta = atan(x / L);      % Angle of interference
    I = (cos(k * d * sin(theta) / 2)).^2;  % Intensity pattern       
    noise = noiseLevel * randn(size(I));  % Add Gaussian noise
    I_noisy = I + noise;
    
    %% Plotting the noisy interference pattern
    figure;
    plot(x, I_noisy);
    xlabel('Position on screen (m)');
    ylabel('Intensity');
    title('Noisy Interference Pattern');
    grid on;
end
