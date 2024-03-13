%% Define Parameters for Country

clear
pandemic_duration = 100;

%% Define simulation

N = zeros(1,pandemic_duration) ; % Population size
I = zeros(1,pandemic_duration);% Infected population
S = zeros(1,pandemic_duration);% Susceptible  population
new_cases = zeros(1,pandemic_duration);
current_hospitalized = zeros(1,pandemic_duration);
new_deaths = zeros(1,pandemic_duration);
daily_admissions = zeros(1, pandemic_duration);
admitted = zeros(1, pandemic_duration);
not_admitted = zeros(1, pandemic_duration);
dispatched = zeros(1, pandemic_duration);
recovered = zeros(1, pandemic_duration);

%% Variables

HSD = floor(10 + add_noise(1)); % Hospital stay duration
M = 0.1; % Mortality rate for those with proper care
RO = 1.5; % Transmission rate
HR = 0.15; % Hospitalization Rate
immune_memory = 30 ;

I(1) = 10; % Infections
N(1) = 100000; % Population
B = 13000; % Hospital Beds

%% Initial state

S(1) = N(1); % Susceptible population
new_cases(1) = I(1); % New cases
admitted(1) = new_cases(1) * 0.15; % Hospital admissions
not_admitted(1) = new_cases(1) - admitted(1); 
current_hospitalized(1) = admitted(1); 
daily_admissions(1) = admitted(1);

%% Simulate each day

day = 2;
while day <= pandemic_duration
    [new_cases,S,I, N] = calculate_new_cases(RO,S,I,N,new_cases,new_deaths,recovered, immune_memory, day);
    [admitted, not_admitted] = admit_to_hospital(new_cases, B, current_hospitalized, admitted, not_admitted,HR, day);
    [current_hospitalized , daily_admissions, dispatched , new_deaths] = update_hospitalizations(current_hospitalized, admitted, HSD, daily_admissions,dispatched, new_deaths, M, day);
    
    % Recovery
    if day > HSD
        recovered(day) = dispatched(day) + not_admitted(day - HSD);
        
    end
    
    day = day + 1;
end

%%% Plot results
%
%plot(1:100 , daily_hospitalized);
%
% disp("Infections")
% disp(I)
% disp("new_cases")
% disp(new_cases)
% disp("Susceptible")
% disp(S)
% disp("deaths")
% disp(new_deaths)
% disp("dispatched")
% disp(dispatched)
% disp("recovered")
% disp(recovered)
% disp("N")
% disp(N)
% disp("daily_admissions")
% disp(daily_admissions)

%% Plot

subplot(3,3,1);
plot(1:pandemic_duration,I);
title("infections");

subplot(3,3,2);
bar(new_cases);
title("new cases");

subplot(3,3,3);
plot(1:pandemic_duration, current_hospitalized);
hold on
line([min(xlim) max(xlim)], [B B], 'Color', 'r', 'LineStyle', '--');
title("current hospitalized");

subplot(3,3,4);
plot(1:pandemic_duration, S);
title("S");

subplot(3,3,5);
plot(1:pandemic_duration, N);
title("N");

subplot(3,3,6);
plot(1:pandemic_duration, dispatched);
title("dispatched");

subplot(3,3,7);
plot(1:pandemic_duration, recovered);
title("recovered");

subplot(3,3,8);
plot(1:pandemic_duration, new_deaths);
title("new_deaths");


