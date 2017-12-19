function [ datasets ] = fixture_datasets()
    datasets = struct;
    two_sines = struct;
    two_sines.n = 0:0.01:100;
    two_sines.x = sin(two_sines.n);
    two_sines.y = sin(two_sines.n);
    two_sines.z = sin(two_sines.n);
    datasets.two_sines = two_sines;
end