function Tab2()
    %% Parameters
    wavelength2 = 500e-9;      % Wavelength of light in meters 
    d2 = 1e-4;                % Distance between the slits in meters 
    a2 = 1e-5;                % Width of each slit in meters 
    screen2 = 1.0;            % Distance from slits to screen in meters
    num_points2 = 1000;       % Number of points on the screen
    num_frames2 = 200;        % Number of frames in the video
    time_steps2 = linspace(0, 2*pi, num_frames2);  % Time steps for the simulation
    screen_x2 = linspace(-0.01, 0.01, num_points2); % Screen coordinates in meters
    k2 = 2 * pi / wavelength2; % Wave number

    %% Loop over time steps to create the simulation
    figure;
    for t = time_steps2 
        path_diff2 = d2 * screen_x2 / screen2;        % Calculate the path difference for each point on the screen
        phase_diff2 = k2 * path_diff2 + t;            % Calculate the phase difference 

        intensity = (cos(phase_diff2 / 2)).^2;        % Calculate the resultant intensity (for each slit as a source)
        
        % Include the effect of slit width (diffraction pattern)
        beta2 = k2 * a2 * screen_x2 / (2 * screen2);
        diff_pattern2 = (sin(beta2) ./ beta2).^2;
        
        % Handle the case where beta2 is zero
        diff_pattern2(beta2 == 0) = 1;
        
        total_intensity2 = intensity .* diff_pattern2;  % Total intensity is the product of interference and diffraction pattern
        total_intensity2 = total_intensity2 / max(total_intensity2); 

        %% Plot the current frame
        plot(screen_x2, total_intensity2, 'LineWidth', 1.5);
        title('Double-Slit Experiment Simulation');
        xlabel('Position on screen (m)');
        ylabel('Intensity');
        ylim([0 1]);
        grid on;
        drawnow;
    end
end
