function Tab4(numElectrons, slitSeparation, screenDistance, electronWavelength)
    % numElectrons: Number of electrons to simulate
    % slitSeparation: Distance between the slits in meters
    % screenDistance: Distance from slits to screen in meters
    % electronWavelength: Electron's de Broglie wavelength in meters

    %% Create a figure for plotting
    figure;
    hold on;
    %% Screen size and parameters for plotting
    screenWidth = 0.02;  % Width of the screen in meters (arbitrary value)
    yVals = linspace(-screenWidth / 2, screenWidth / 2, 1000);  % Screen positions

    %% Plot electron hits over time
    for i = 1:numElectrons
        % Random horizontal position for electron 
        xPos = randn * screenWidth;  % Random Gaussian distribution for position

        % Calculate interference intensity based on double-slit conditions
        intensity = cos(pi * slitSeparation * xPos / electronWavelength / screenDistance)^2;

        % Electron hit occurs based on intensity 
        if rand < intensity
            % Plot electron hit on the screen 
            scatter(xPos, i, 5, 'k', 'filled');
        end

        % Update plot dynamically 
        pause(0.01);
    end
    
    % Finalize plot
    hold off;
    xlabel('Position on screen (m)');
    ylabel('Electron Index');
    title('Electron Hits on Screen');
    grid on;
end
