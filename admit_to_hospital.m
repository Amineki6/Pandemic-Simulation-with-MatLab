function [admitted, not_admitted] = admit_to_hospital(new_cases, B, current_hospitalized, admitted, not_admitted,HR, day)

HR = abs(HR + add_noise(0.05));


free_beds = B - current_hospitalized(day - 1);

if free_beds == 0
    admitted(day) = 0;
    not_admitted(day) = new_cases(day);
    disp("Hospitals out of capacity.")
end
if free_beds > 0
    if free_beds - new_cases(day) * HR >= 0
        admitted(day) = new_cases(day) * HR;
        not_admitted(day) = new_cases(day) - admitted(day);
    else
        admitted(day) = free_beds;
        not_admitted(day) = new_cases(day) - admitted(day);
        disp("Hospitals out of capacity.")
    end
end
end