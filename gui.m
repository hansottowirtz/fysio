function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 20-Dec-2017 01:45:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

handles.window_function = 'boxcar';
handles.datasets = struct;
handles.plot_mode = 'power';
handles.cutoff_ratio = 0;
handles.td_plot_mode = 'both';

% Update handles structure
guidata(hObject, handles);

zoom on;

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[raw, filename] = load_excel();
if ~(filename ~= 0)
    return;
end
[~, frequency, ds] = parse_excel(raw);

handles.datasets = ds;
handles.frequency = frequency;

datasets_names = fieldnames(ds);

dataset_choice_i = menu('Choose a dataset', datasets_names);
chosen_dataset_name = datasets_names{dataset_choice_i};

handles.plotted_dataset_values = ds.(chosen_dataset_name);
set(handles.file_text, 'String', filename);
guidata(hObject, handles);

reloadFile(handles);

function reloadFile(handles)
if (~isfield(handles,'plotted_dataset_values'))
    return;
end
window_function = handles.window_function;
plot_mode = handles.plot_mode;
plotted_dataset_values = handles.plotted_dataset_values;
frequency = handles.frequency;
cutoff_ratio = handles.cutoff_ratio;
td_plot_mode = handles.td_plot_mode;
set(handles.cutoff_frequency_text, 'String', strjoin({num2str(frequency * (1 - cutoff_ratio)), 'Hz'}));

plot_graphs(plotted_dataset_values, window_function, frequency, plot_mode, td_plot_mode, cutoff_ratio, handles);


% --- Executes on button press in save_button.
function save_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on slider movement.
function frequency_slider_Callback(hObject, eventdata, handles)
% hObject    handle to frequency_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = get(hObject, 'Value');
log_ratio = tanh(2*num)/tanh(2);
handles.cutoff_ratio = log_ratio;
guidata(hObject, handles);
reloadFile(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function frequency_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequency_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function window_button_Callback(hObject, eventdata, handles)
handles.window_function = choose_window_function();
guidata(hObject, handles);
reloadFile(handles);

function zoom_mode_button_Callback(hObject, eventdata, handles)
zoom on;

function cursor_mode_button_Callback(hObject, eventdata, handles)
datacursormode on;

function power_plot_button_Callback(hObject, eventdata, handles)
handles.plot_mode = 'power';
guidata(hObject, handles);
reloadFile(handles);

function value_plot_button_Callback(hObject, eventdata, handles)
handles.plot_mode = 'value';
guidata(hObject, handles);
reloadFile(handles);

function td_original_button_Callback(hObject, eventdata, handles)
handles.td_plot_mode = 'original';
guidata(hObject, handles);
reloadFile(handles);

function td_cutoff_button_Callback(hObject, eventdata, handles)
handles.td_plot_mode = 'cutoff';
guidata(hObject, handles);
reloadFile(handles);

function td_both_button_Callback(hObject, eventdata, handles)
handles.td_plot_mode = 'both';
guidata(hObject, handles);
reloadFile(handles);
