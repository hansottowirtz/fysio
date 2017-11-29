function [ raw ] = load_excel( input_args )
    [filename,pathname] = uigetfile('*.xlsx');
    raw = read_excel(filename, pathname);
    parse_excel(raw);
end

