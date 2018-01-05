function [ window_function ] = choose_window_function( )
window_function_names = {'Bartlett', 'Blackman', 'Boxcar', 'Chebyshev', 'Hamming', 'Hann', 'Taylor', 'Triang'};

window_function_choice_i = menu('Choose a window function', window_function_names);
window_function = lower(window_function_names{window_function_choice_i});
end

