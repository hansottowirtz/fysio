function [ values ] = general_values()
    global Gvalues;
    Gvalues = struct;
    values = Gvalues;
    values.window_function = (@(M) M);
    values.datasets = struct;
    values.handles = struct;
end

