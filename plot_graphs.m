function [ output_args ] = plot_graphs( datasets )

    datasets_names = fieldnames(datasets);

    datasets_choices = cat(1, 'All', datasets_names);
    dataset_choice_i = menu('Choose a dataset', datasets_choices);

    window_function_names = {'Bartlett',       'Blackman',       'Boxcar',        'Chebyshev',     'Hamming',       'Hann',       'Kaiser',       'Taylor',           'Triang'};
    window_functions =      {@(M) bartlett(M), @(M) blackman(M), @(M) rectwin(M), @(M) chebwin(M), @(M) hamming(M), @(M) hann(M), @(M) kaiser(M), @(M) taylorwin(M),  @(M) triang(M)};

    window_function_choice_i = menu('Choose a window function', window_function_names);
    window_function = window_functions{window_function_choice_i};

    disp(window_function);

    for i = 1:length(datasets_names)
        dataset_name = datasets_names{i};
        if (dataset_choice_i > 1 && i ~= dataset_choice_i)
            continue;
        end
        dataset_values = datasets.(dataset_name);
        
        subplot(1,3,1);
        plot(dataset_values.n,dataset_values.x);
        title('x coördinaten');
        
        subplot(1,3,2);
        plot(dataset_values.n,dataset_values.y);
        title('y coördinaten');
        
        subplot(1,3,3);
        plot(dataset_values.n,dataset_values.z);
        title('z coördinaten');
        
%         if (dataset_choice_i > 1)
%             title(dataset_name); 
%         else
%             title('All');
%         end
%         hold on
    end
%     hold off
end