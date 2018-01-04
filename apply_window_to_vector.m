function [x_windowed] = apply_window_to_vector(window_function, x)
    switch window_function
        case 'bartlett'
            x_windowed = bartlett(length(x)) .* x;
        case 'blackman'
            x_windowed = blackman(length(x)) .* x;
        case 'boxcar'
            x_windowed = x;
        otherwise
            disp('fokof');
    end
end

