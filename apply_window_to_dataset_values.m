function [ windowed_dataset_values ] = apply_window_to_dataset_values( dataset_values, window_function )
    windowed_dataset_values = struct;
    for value_name = ['x', 'y', 'z']
        dataset_value = dataset_values.(value_name);
        L = length(dataset_value);
        windowed_dataset_values.(value_name) = window_function(L) .* dataset_value;
    end
end

