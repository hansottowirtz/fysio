function [ ] = plot_graphs( datasets, window_function, handles )

    datasets_names = fieldnames(datasets);

    datasets_choices = cat(1, 'All', datasets_names);
    dataset_choice_i = menu('Choose a dataset', datasets_choices);

    for i = 1:length(datasets_names)
        dataset_name = datasets_names{i};
        if (dataset_choice_i > 1 && (i + 1) ~= dataset_choice_i)
            continue;
        end
        dataset_values = datasets.(dataset_name);

        plot(handles.axes1, dataset_values.n, dataset_values.x);
        title('X');

        plot(handles.axes2, dataset_values.n,dataset_values.y);
        title('Y');

        plot(handles.axes3, dataset_values.n,dataset_values.z);
        title('Z');

%         if (dataset_choice_i > 1)
%             title(dataset_name);
%         else
%             title('All');
%         end
%         hold on
    end
%     hold off
end
