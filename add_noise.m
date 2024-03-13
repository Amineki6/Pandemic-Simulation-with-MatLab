function noise = add_noise(std)
% Define the parameters
meanValue = 0; % Mean of the noise
stdDev = std;    % Standard deviation of the noise
sizeOfVariable = [1, 1]; % Size of the variable (you can adjust this as needed)

% Generate random noise
noise = meanValue + stdDev * randn(sizeOfVariable);
end