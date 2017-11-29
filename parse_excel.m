function [ description, frequency, datasets ] = parse_excel( raw )
    for i = 1:16
        switch raw(i, 1)
            case 'Description:'
                description = raw(i, 2);
            case 'TRAJECTORIES'
                frequency = raw(i+1, 1);
                datasets_row = raw(i+2, :);
                for j = 1:length(datasets_row)
                    value = datasets_row{i};
                    if ~isnan(value)
                        value
                    end
                end
        end
    end
end

