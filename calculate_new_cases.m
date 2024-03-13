function [new_cases, S_updated, I_updated, N_updated] = calculate_new_cases(RO, S, I , N, new_cases, new_deaths,recovered, immune_memory, day)
S_updated = S;
I_updated = I;
N_updated = N;

N_updated(day) = N_updated(day-1) - new_deaths(day-1); % Population - yesterday's deaths
I_updated(day) = I_updated(day-1) - new_deaths(day-1) - recovered(day-1);
S_updated(day) = S_updated(day-1) - new_cases(day-1);

if day > immune_memory
    S_updated(day) = S_updated(day) + recovered(day - immune_memory);
end


new_cases(day) = abs(floor((RO * S_updated(day) * I_updated(day) / N_updated(day))+ add_noise(10)));
new_cases(day) = min(new_cases(day),S_updated(day)); % Neccessary conditon to avoid new_cases > S

I_updated(day) = I_updated(day) + new_cases(day);

end