function [ raw ] = load_excel()
    [filename,pathname] = uigetfile('*.xlsx');
    raw = read_excel(pathname, filename);
end

