function [current_hospitalized_updated , daily_admissions_updated, dispatched , new_deaths] = update_hospitalizations(current_hospitalized, admitted, HSD, daily_admissions, dispatched, new_deaths, M, day)

daily_admissions_updated = daily_admissions;
daily_admissions_updated(day) = admitted(day); % New patients entering hospital

current_hospitalized_updated = current_hospitalized;
current_hospitalized_updated(day) = current_hospitalized_updated(day-1) + daily_admissions_updated(day); % New occupation of hospital beds


if day > HSD 
    dispatched(day) = daily_admissions_updated(day - HSD) * (1 - M); % Patients cured
    new_deaths(day) = daily_admissions_updated(day - HSD) - dispatched(day); % Patients died
    current_hospitalized_updated(day) = current_hospitalized_updated(day) - dispatched(day) - new_deaths(day); % New occupation of hospital beds
end

end

