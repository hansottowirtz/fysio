function [ plotted_datasets ] = plot_graphs( dataset_values, window_function, plot_mode, handles )
    plotted_datasets = {};
    
    value_names = ['x' 'y' 'z'];
    
    axes = struct;
    axes.x = struct;
    axes.x.time_axes = handles.axes1;
    axes.x.spectrum_axes = handles.axes4;
    axes.y = struct;
    axes.y.time_axes = handles.axes2;
    axes.y.spectrum_axes = handles.axes5;
    axes.z = struct;
    axes.z.time_axes = handles.axes3;
    axes.z.spectrum_axes = handles.axes6;

    hold off;
    
    disp(plot_mode);
    
    for j = 1:3
        value_name = value_names(j);

        % sampling values
        % Ts = 0.001; % sampling period (for testing)
        Ts = 1; % sampling period (one, as a new row is added every second)
        fs = 1/Ts; % sampling frequency
        ws = 2*pi*fs; % sampling angular frequency

        % testing purposes: Peak at 1 and at 50
        % t = 0:Ts:(5-Ts);
        % x = sin(w*t)+sin(50*w*t);

        t = 1:length(dataset_values.n); % every row
        x = dataset_values.(value_name); % x, y or z

        Xp = fft(x);
        n = length(Xp);
        Xp_abs = abs(Xp);
        Xp_shifted = fftshift(Xp);
        Xp_abs_shifted = fftshift(Xp_abs);
        PSDp = Xp_abs.^2/n;
        PSDp_shifted = fftshift(PSDp);

        f = (0:n-1)*(fs/n);
        f_shifted = (-n/2:n/2-1)*(fs/n);

        plot(axes.(value_name).time_axes, t, x);
        title(axes.(value_name).time_axes, upper(value_name));
        xlabel(axes.(value_name).time_axes, 't [s]');

        if plot_mode == "power"
            plot(axes.(value_name).spectrum_axes, f_shifted, PSDp_shifted);
        else
            plot(axes.(value_name).spectrum_axes, f_shifted, Xp_abs_shifted);
        end
        title(axes.(value_name).spectrum_axes, strcat("FFT ", upper(value_name)));
        xlabel(axes.(value_name).spectrum_axes, 'f [Hz]');
    end
end
