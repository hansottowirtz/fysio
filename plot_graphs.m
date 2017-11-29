function [ output_args ] = plot_graphs( datasets )

datasets_names = fieldnames(datasets);

datasets_choices = cat(1, ['All'], datasets_names);
dataset_choice_i = menu('Choose a dataset', datasets_choices);

for i = 1:length(datasets_names)
    dataset_name = datasets_names{i};
    if (dataset_choice_i > 1 && i ~= dataset_choice_i)
        continue;
    end
    dataset_values = datasets.(dataset_name);
    plot3(dataset_values.x, dataset_values.y, dataset_values.z);
    if (dataset_choice_i > 1)
        title(dataset_name);
    else
        title('All');
    end
    rotate3d on
    hold on
end
hold off

return;

choice = menu('Choose a window function','Bartlett','Blackman','Boxcar','Chebyshev','Hamming','Hann','Kaiser','Taylor','Triang');
switch choice
    case 'Bartlett'
    case 'Blackman'
    case 'Boxcar'
    case 'Chebyshev'
    case 'Hamming'
    case 'Hann'
    case 'Kaiser'
    case 'Taylor'
    case 'Triang'
end

