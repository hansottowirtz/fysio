function [ output_args ] = plot_graphs( x1,y1,z1,x2,y2,z2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
plot(x1,y1,z1)
hold on
plot(x2,y2,z2)
hold off

choice = menu('Choose a window function','Bartlett','Blackman','Boxcar','Chebyshev','Hamming','Hann','Kaiser','Taylor','Triang');
switch choice
    case 'Bartlett'
    case 'Blackman'
    case 'Boxcar'
    case 'Chebyshev'
    case 'Hamming'
    case 'Hann'
    case 'Kaiser'
    case 'Taylor'
    case 'Triang'
    
end

