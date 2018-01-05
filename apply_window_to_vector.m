function [x_windowed] = apply_window_to_vector(window_function, x)
    n = length(x);
    switch window_function
        case 'bartlett'
            x_windowed = bartlett(n) .* x;
        case 'blackman'
            x_windowed = blackman(n) .* x;
        case 'boxcar'
            x_windowed = x;
        case 'chebyshev'
            x_windowed = chebwin(n) .* x;
        case 'hann'
            x_windowed = hann(n) .* x;
        case 'hamming'
            x_windowed = hamming(n) .* x;
        case 'taylor'
            x_windowed = taylorwin(n) .* x;
        case 'triang'
            x_windowed = triang(n) .* x;
        otherwise
            disp('fokof');
    end
end

