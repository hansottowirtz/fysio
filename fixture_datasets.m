function [ dataset_values ] = fixture_datasets()
    two_sines = struct;
    two_sines.n = 0:0.01:100;
    two_sines.x = sin(two_sines.n)+sin(20*two_sines.n);
    two_sines.y = sin(two_sines.n)+sin(20*two_sines.n);
    two_sines.z = sin(two_sines.n)+sin(20*two_sines.n);
    dataset_values = two_sines;
end