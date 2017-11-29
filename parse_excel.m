function [ description, frequency, datasets ] = parse_excel( raw )
    for i = 1:16
        switch raw{i, 1}
            case 'Description:'
                description = raw(i, 2);
            case 'TRAJECTORIES'
                frequency = raw(i+1, 1);
                datasets_row = raw(i+2, :);
                datasets = struct;
                for j = 1:length(datasets_row)
                    dataset_name = datasets_row{j};
                    if ~isnan(dataset_name)
                        datasets = setfield(datasets, dataset_name, []);
                    end
                end
        end
    end
end

