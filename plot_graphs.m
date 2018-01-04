function [ plotted_datasets ] = plot_graphs( dataset_values, window_function, frequency, plot_mode, cutoff_ratio, handles )
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
        
    for j = 1:3
        value_name = value_names(j);
        relevant_axes = axes.(value_name);

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
        
        if (mod(length(x), 2) == 1)
            x = [x; x(end)]; % make length of x even by repeating last value;
            t = [t t(end)+1];
        end
                
        x_detrend = detrend(x);
        x_windowed = apply_window_to_vector(window_function, x_detrend);
        
        n_zp = 10;
        % n_zp = 1;
        n_no_zp = length(x);
        Xp_no_zp = fft(x);
        Xp = fft(x_windowed, length(x_windowed)*n_zp);
        n = length(Xp);

        Xp_abs = abs(Xp);
        Xp_shifted = fftshift(Xp);
        Xp_abs_shifted = fftshift(Xp_abs);
        Xp_no_zp_shifted = fftshift(Xp_no_zp);
        PSDp = Xp_abs.^2/n;
        PSDp_shifted = fftshift(PSDp);
        
        half_boxcar = ones(n/2, 1);
        half_boxcar(ceil(((n/2)*(1 - cutoff_ratio)) + 1):end) = 0;
        cutoff_boxcar = [flipud(half_boxcar); half_boxcar];
                
        half_boxcar_no_zp = ones(n_no_zp/2, 1);
        half_boxcar_no_zp(ceil(((n_no_zp/2)*(1 - cutoff_ratio)) + 1):end) = 0;
        cutoff_boxcar_no_zp = [flipud(half_boxcar_no_zp); half_boxcar_no_zp];
        
        Xp_shifted_cutoff = Xp_shifted .* cutoff_boxcar;
        Xp_no_zp_shifted_cutoff = Xp_no_zp_shifted .* cutoff_boxcar_no_zp;
        Xp_abs_shifted_cutoff = Xp_abs_shifted .* cutoff_boxcar;
        PSDp_shifted_cutoff = PSDp_shifted .* cutoff_boxcar;
        
        x_cutoff = real(ifft(ifftshift(Xp_no_zp_shifted_cutoff)));
        
        f = (0:n-1)*(fs/n)*frequency;
        f_shifted = (-n/2:n/2-1)*(fs/n)*frequency;
        
        plot(relevant_axes.time_axes, t, x_cutoff);
        title(relevant_axes.time_axes, upper(value_name));
        xlabel(relevant_axes.time_axes, 't [s]');
        
        if plot_mode == 'power'
            plot(relevant_axes.spectrum_axes, f_shifted, PSDp_shifted_cutoff);
        else
            plot(relevant_axes.spectrum_axes, f_shifted, Xp_abs_shifted_cutoff);
        end
        title(relevant_axes.spectrum_axes, strcat('FFT ', upper(value_name)));
        xlabel(relevant_axes.spectrum_axes, 'f [Hz]');
    end
end
