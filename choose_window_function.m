function [ window_function ] = choose_window_function( )
window_function_names = {'Bartlett',       'Blackman',       'Boxcar',        'Chebyshev',     'Hamming',       'Hann',       'Kaiser',       'Taylor',           'Triang'};
window_functions =      {@(M) bartlett(M), @(M) blackman(M), @(M) rectwin(M), @(M) chebwin(M), @(M) hamming(M), @(M) hann(M), @(M) kaiser(M), @(M) taylorwin(M),  @(M) triang(M)};

window_function_choice_i = menu('Choose a window function', window_function_names);
window_function = window_functions{window_function_choice_i};

disp(window_function);
end

