function [ raw, filename ] = load_excel()
    [filename,pathname] = uigetfile('*.xlsx');
    if filename == 0
        raw = 0;
    else
        raw = read_excel(pathname, filename);
    end
end

