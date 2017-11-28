function [ output_args ] = load_excel( input_args )
%LOAD_EXCEL Summary of this function goes here
%   Detailed explanation goes here
[filename,pathname] = uigetfile('*.xlsx');
disp(filename);
disp(pathname);

[num,txt,raw] = xlsread([pathname,filename]);

disp(raw);
end

