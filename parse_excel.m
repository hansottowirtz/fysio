function [ description, frequency, datasets ] = parse_excel( raw )
    for i = 1:16
        switch raw{i, 1}
            case 'Description:'
                description = raw{i, 2};
            case 'TRAJECTORIES'
                frequency = raw{i+1, 1};
                datasets_row = raw(i+2, :);
                datasets = struct;
                values_starting_index = i+4;
                for j = 1:length(datasets_row)
                    dataset_name = datasets_row{j};
                    if ~isnan(dataset_name)
                        dataset_values = struct;
                        dataset_values.n = cell2mat(raw(values_starting_index:end, 1));
                        value_names = ['x', 'y', 'z'];
                        for k = 0:2
                            dataset_values.(value_names(k+1)) = cell2mat(raw(values_starting_index:end, j+k));
                        end
                        datasets.(dataset_name) = dataset_values;
                    end
                end
        end
    end
end

