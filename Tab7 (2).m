function [lambda7, fringe_spacing7] = Tab7(v7, d7, L7)
    %% Constants
    h = 6.626e-34;       % Planck's constant (J·s)
    m_e7 = 9.109e-31;    % Mass of an electron (kg)
%% Example parameters
v7 = 2e6;           % Electron velocity in m/s
d7 = 1e-4;          % Slit separation in meters
L7 = 1.0;           % Screen distance in meters

    %% Ensure positive values for all inputs
    if v7 <= 0 || d7 <= 0 || L7 <= 0
        error('All input values must be positive.');
    end
    
    %% Calculate de Broglie wavelength
    lambda7 = h / (m_e7 * v7);
    
    %% Calculate fringe spacing
    fringe_spacing7 = (lambda7 * L7) / d7;
end
