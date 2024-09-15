function Tab1()
    %% Set parameters
    d1 = 2e-4;       % Slit separation in meters 
    a1 = 5e-5;       % Slit width in meters 
    lambda1 = 500e-9; % Wavelength in meters 
    L1 = 1.0;         % Screen distance in meters 

    %% Parameters and constants
    num_points1 = 1000;                              % Number of points on the screen
    screen1 = linspace(-0.01, 0.01, num_points1);     % Screen positions (in meters)
    k1 = 2 * pi / lambda1;                            % Wave number
    path_diff1 = d1 * screen1 / L1;                     % Path difference for each point on the screen
    phase_diff1 = k1 * path_diff1;                     % Phase difference 
    intensity1 = (cos(phase_diff1 / 2)).^2;           % Intensity (for each slit as a point source)
    
    %% Diffraction pattern calculation
    beta1 = k1 * a1 * screen1 / (2 * L1);             % Include slit width effect
    diffraction_pattern1 = (sin(beta1) ./ beta1).^2;   % Diffraction pattern
    
    diffraction_pattern1(beta1 == 0) = 1;
    
    %% Total intensity 
    total_intensity1 = intensity1 .* diffraction_pattern1;
    total_intensity1 = total_intensity1 / max(total_intensity1); 
    
    %% 2D Plot: Interference pattern
    figure;
    plot(screen1, total_intensity1, 'LineWidth', 1.5);
    title('Double-Slit Interference Pattern');
    xlabel('Position on screen (m)');
    ylabel('Intensity');
    ylim([0 1]);
    grid on;
    
    %% 3D Plot: Surface plot of intensity
    [X, Y] = meshgrid(screen1, linspace(0, 1, 100)); % Generate mesh for 3D plot
    Z = repmat(total_intensity1, [100, 1]);          
    
    figure;
    surf(X, Y, Z, 'EdgeColor', 'none');             % Create surface plot
    title('3D Visualization of Interference Pattern');
    xlabel('Position on screen (m)');
    ylabel('Distance');
    zlabel('Intensity');
                                      
end
