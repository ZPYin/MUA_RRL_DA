function varargout = PRRL_Temperature_Retrieving_GUI_MUA(varargin)
% PRRL_TEMPERATURE_RETRIEVING_GUI_MUA MATLAB code for PRRL_Temperature_Retrieving_GUI_MUA.fig
%      PRRL_TEMPERATURE_RETRIEVING_GUI_MUA, by itself, creates a new PRRL_TEMPERATURE_RETRIEVING_GUI_MUA or raises the existing
%      singleton*.
%
%      H = PRRL_TEMPERATURE_RETRIEVING_GUI_MUA returns the handle to a new PRRL_TEMPERATURE_RETRIEVING_GUI_MUA or the handle to
%      the existing singleton*.
%
%      PRRL_TEMPERATURE_RETRIEVING_GUI_MUA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRRL_TEMPERATURE_RETRIEVING_GUI_MUA.M with the given input arguments.
%
%      PRRL_TEMPERATURE_RETRIEVING_GUI_MUA('Property','Value',...) creates a new PRRL_TEMPERATURE_RETRIEVING_GUI_MUA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PRRL_Temperature_Retrieving_GUI_MUA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PRRL_Temperature_Retrieving_GUI_MUA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PRRL_Temperature_Retrieving_GUI_MUA

% Last Modified by GUIDE v2.5 02-Jul-2018 13:25:54

thisPath = fileparts(which('PRRL_Temperature_Retrieving_GUI_MUA'));
addpath(fullfile(thisPath, 'lib'));

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PRRL_Temperature_Retrieving_GUI_MUA_OpeningFcn, ...
                   'gui_OutputFcn',  @PRRL_Temperature_Retrieving_GUI_MUA_OutputFcn, ...
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


% --- Executes just before PRRL_Temperature_Retrieving_GUI_MUA is made visible.
function PRRL_Temperature_Retrieving_GUI_MUA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PRRL_Temperature_Retrieving_GUI_MUA (see VARARGIN)

clc;

% Choose default command line output for PRRL_Temperature_Retrieving_GUI_MUA
handles.output = hObject;
handles.log = {};
handles.Mie = [];
handles.High_J = [];
handles.Low_J = [];
handles.date = [];

% Update handles structure

% update the RCS_axes
axes(handles.RCS_axes);
xlabel('LT');
ylabel('Height (km)');
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
handles.RCS_axes.FontSize = 8;
handles.RCS_axes.Box = 'on';
handles.RCS_axes.FontName = 'Times New Roman';
load('myjet_colormap.mat');
colormap(myjet);
ax = gca;
ax.TickDir = 'out';
colorbar('Position', [0.777, 304/551, (803-788)/1000, (515-304)/551]);

% update the Raw_Sig_axes
axes(handles.Raw_Sig_axes);
xlabel('Photon Count');
ylabel('Height (km)');
xlim([1e0, 1e8]);
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
grid();
handles.Raw_Sig_axes.FontSize = 8;
handles.Raw_Sig_axes.Box = 'on';
handles.Raw_Sig_axes.FontName = 'Times New Roman';

% update the T_Ratio_axes
axes(handles.T_Ratio_axes);
xlabel('T (K)');
ylabel('$\rm \frac{High_J}{Low_J}$', 'interpreter', 'latex');
xlim([180, 300]);
ax = gca;
ax.XTick = 180:20:300;
handles.T_Ratio_axes.FontSize = 8;
handles.T_Ratio_axes.Box = 'on';
handles.T_Ratio_axes.FontName = 'Times New Roman';
grid();

% update the T_axes
axes(handles.T_axes);
xlabel('T (K)');
ylabel('Height (km)');
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
xlim([180, 310]);
ax = gca;
ax.XTick = 180:20:310;
handles.T_axes.FontSize = 8;
handles.T_axes.Box = 'on';
handles.T_axes.FontName = 'Times New Roman';
grid();

% update the Err_axes
axes(handles.Err_axes);
xlabel('Error (T)');
xlim([-8, 8]);
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
ax = handles.Err_axes;
ax.YTickLabel = '';
ax.XTick = -8:2:8;
handles.Err_axes.FontSize = 8;
handles.Err_axes.Box = 'on';
handles.Err_axes.FontName = 'Times New Roman';
grid();

guidata(hObject, handles);

% UIWAIT makes PRRL_Temperature_Retrieving_GUI_MUA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PRRL_Temperature_Retrieving_GUI_MUA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in MieButton.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to MieButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in High_J_Button.
function High_J_Button_Callback(hObject, eventdata, handles)
% hObject    handle to High_J_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

HighJFolder = uigetdir('C:\', 'Choose the High J folder');
handles.HighJFolder = HighJFolder;

if HighJFolder == 0
    handles.High_J_Edit_Box.String = '';
    handles.log_box.String{end + 1} = sprintf('[%s] Please select a folder for High J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
else
    handles.High_J_Edit_Box.String = sprintf('%s', HighJFolder);
end

guidata(hObject, handles);


% --- Executes on button press in Low_J_Button.
function Low_J_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Low_J_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LowJFolder = uigetdir('C:\', 'Choose the Low J folder');

handles.LowJFolder = LowJFolder;

if LowJFolder == 0
    handles.Low_J_Edit_Box.String = '';
    handles.log_box.String{end + 1} = sprintf('[%s] Please select a folder for Low J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
else    
    handles.Low_J_Edit_Box.String = sprintf('%s', LowJFolder);
end

guidata(hObject, handles);



function Mie_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Mie_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mie_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Mie_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Mie_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mie_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function High_J_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to High_J_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of High_J_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of High_J_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function High_J_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to High_J_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Low_J_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Low_J_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Low_J_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Low_J_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Low_J_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Low_J_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in save_Button.
function save_Button_Callback(hObject, eventdata, handles)
% hObject    handle to save_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~ isfield(handles, 'MieFolder')
    warndlg('No Mie Folder was set!', 'Warning');
    return;
end
if ~ isfield(handles, 'HighJFolder')
    warndlg('No High J Folder was set!', 'Warning');
    return;
end
if ~ isfield(handles, 'LowJFolder')
    warndlg('No Low J Folder was set!', 'Warning');
    return;
end

[file, folder] = uiputfile('*.txt', 'Save the retrieving results', 'untitled.txt');
if ~ ischar(file)
    return;
end

handles.log_box.String{end + 1} = sprintf('Start to save the results to %s', fullfile(folder, file));
scrollDownLogBox(handles.log_box);
fid = fopen(fullfile(folder, file), 'w');

% write headers
fprintf(fid, '# Mie Folder: %s from %s to %s\n', handles.MieFolder, handles.MieFiles{1}(1:6), handles.MieFiles{end}(1:6));
fprintf(fid, '# High J Folder: %s from %s to %s\n', handles.HighJFolder, handles.HighJFiles{1}(1:6), handles.HighJFiles{end}(1:6));
fprintf(fid, '# Low J Folder: %s from %s to %s\n', handles.LowJFolder, handles.LowJFiles{1}(1:6), handles.LowJFiles{end}(1:6));
fprintf(fid, '# Licel Type: %s\n', handles.LicelType_Box.String{handles.LicelType_Box.Value});
fprintf(fid, '# deadtime [Mie, High_J, Low_J] (ns): %4.1f %4.1f %4.1f\n', str2double(handles.Mie_DT_Edit_Box.String), ...
                                                                          str2double(handles.HighJ_DT_Edit_Box.String), ...
                                                                          str2double(handles.LowJ_DT_Edit_Box.String));
fprintf(fid, '# Sonde URL: %s\n', handles.URL);
smoothWin = smoothStr2Array(handles.Smooth_Edit_Box.String);
if isempty(smoothWin)
    handles.log_box.String{end + 1} = sprintf('[%s] Error: wrong settings of smooth window.', datestr(now, 'yyyymmdd HH:MM:SS'));
    fclose(fid);
    handles.log_box.String{end + 1} = sprintf('Finish saving.');
    scrollDownLogBox(handles.log_box);
    return;
end
fprintf(fid, '# smooth window (m): ');
for iWin = 1:size(smoothWin, 1)
    fprintf(fid, '# from %6.1f to % 6.1f win %6.1f\n', smoothWin(iWin, 1), smoothWin(iWin, 2), smoothWin(iWin, 3));
end

% write the fit coefficients
fprintf(fid, '# Fitting type (1 Linear; 2 Quadratic): %1d\n', handles.quadratic_fit.Value * 2 + handles.linear_fit.Value);
fprintf(fid, '# Fitting Range (km): [%4.1f, %4.1f]\n', str2double(handles.fitRange_B_Edit_Box.String), str2double(handles.fitRange_T_Edit_Box.String));
fprintf(fid, '# User Defined Mode?(1 Yes; 0 No): %d\n', logical(handles.UDM_Checkbox.Value));
fprintf(fid, '# High_J / Low_J = exp(a/T^2 + b/T + c)\n');
fprintf(fid, '# [a, b, c]: [%f, %f, %f]\n\n', handles.fitCoef(1), handles.fitCoef(2), handles.fitCoef(3));

% write signal
fprintf(fid, '%12s %12s %12s\n', 'MiePC', 'HighJPC', 'LowJPC');
for iRow = 1:length(handles.LowJSmooth)
    fprintf(fid, '%12.1f %12.1f %12.1f\n', handles.MiePC(iRow), handles.HighJSmooth(iRow), handles.LowJSmooth(iRow));
end
fclose(fid);
handles.log_box.String{end + 1} = sprintf('Finish saving.');
scrollDownLogBox(handles.log_box);



function log_box_Callback(hObject, eventdata, handles)
% hObject    handle to log_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of log_box as text
%        str2double(get(hObject,'String')) returns contents of log_box as a double


% --- Executes during object creation, after setting all properties.
function log_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to log_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fitRange_B_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to fitRange_B_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fitRange_B_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of fitRange_B_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function fitRange_B_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fitRange_B_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fitRange_T_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to fitRange_T_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fitRange_T_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of fitRange_T_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function fitRange_T_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fitRange_T_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function a_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to a_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of a_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function a_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MieButton.
function MieButton_Callback(hObject, eventdata, handles)
% hObject    handle to MieButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MieFolder = uigetdir('C:\', 'Choose the elastic folder');
handles.MieFolder = MieFolder;

if MieFolder == 0
    handles.Mie_Edit_Box.String = '';
    handles.log_box.String{end + 1} = sprintf('[%s] Please select a folder for Mie channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
else
    handles.Mie_Edit_Box.String = sprintf('%s', MieFolder);
end

guidata(hObject, handles);


function [strList] = convert_cell_2_str(files)
strList = '';

if ischar(files)
    strList = files;
    return
elseif iscell(files)
    for iFile = 1:length(files)
        strList = [strList, ' ', files{iFile}];
    end
    return;
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Low_J_Button.
function Low_J_Button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Low_J_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in RCS_Display.
function RCS_Display_Callback(hObject, eventdata, handles)
% hObject    handle to RCS_Display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% gather parameters
LicelType = handles.LicelType_Box.Value;   % integer value
deadtime = str2double(handles.Mie_DT_Edit_Box.String);

%% signal preprocess
if ~ isfield(handles, 'MieFiles')
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: Please set the folder of Elastic channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end
[MieC, hRes, unitConvertorPCR] = sigPreProcess(handles.Mie, deadtime, LicelType);
PCR2PC = 1 ./ unitConvertorPCR .* handles.MieRecords;
[MieCSig, MieCBg] = removeBg(MieC, 12000:16000);
if isempty(handles.Mie)
    nBins = 16384;
else
    nBins = size(MieC, 1);
end

%% data visualization
if ~ isempty(handles.Mie)
    % colorplot
    height = (1:nBins) .* hRes ./ 1000;   % [km]
    MieRCS = MieCSig .* repmat(height', 1, size(MieCSig, 2)).^2;
    time = handles.MieTime;
    MieRCS(MieRCS <= 0) = 1e-5;
    axes(handles.RCS_axes);
    load('myjet_colormap.mat')
    colormap(myjet);
    if size(MieRCS, 1) <= 1
        time = linspace(datenum(2000, 1, 1), datenum(2000, 1, 2), 100);
        p1 = pcolor(time, height, zeros(length(height), length(time)));
    else
        p1 = pcolor(time, height, log10(MieRCS));
    end
    p1.EdgeColor = 'None';
    caxis([0, 4]);
    xlabel('LT');
    ylabel('Height (km)');
    handles.RCS_axes.FontSize = 8;
    handles.RCS_axes.Box = 'on';
    handles.RCS_axes.FontName = 'Times New Roman';
    ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
    title(sprintf('Logarithm of Range Corrected Signal'));
    ax = gca;
    ax.XTick = linspace(time(1), time(end), 13);
    ax.TickDir = 'out';
    xlim([time(1), time(end)]);
    datetick('x', 'HH:MM', 'keepticks');
    colorbar('Position', [0.777, 304/551, (803-788)/1000, (515-304)/551]);
    
    % profile plot
    axes(handles.Raw_Sig_axes);
    MieCSig(MieCSig <= 0) = 1e-5;
    MiePC = squeeze(nansum(MieCSig, 2)) .* PCR2PC;
    p2 = semilogx(MiePC, height, '-g', 'LineWidth', 1, 'DisplayName', 'Elastic');

    xlabel('Photon Count');
    ylabel('Height (km)');
    xlim([1e0, 1e8]);
    ax = gca;
    ax.XTick = [1e0, 1e2, 1e4, 1e6, 1e8];
    ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
    grid();
    legend([p2], 'Location', 'NorthEast');
    handles.Raw_Sig_axes.FontSize = 8;
    handles.Raw_Sig_axes.Box = 'on';
    handles.Raw_Sig_axes.FontName = 'Times New Roman';  

end

%% update the handles
guidata(hObject, handles);



function [sig, bg] = removeBg(tot, hRangeIndx)
bg = repmat(nanmean(tot(hRangeIndx, :), 1), size(tot, 1), 1);
sig = tot - bg;



function [MieC, hRes, unitConvertorPCR] = sigPreProcess(Mie, deadtime, LicelType)
if isempty(Mie)
    MieC = [];
    return;
end

% Unit conversion
switch LicelType
    case 1
        unitConvertorPCR = 20;   % [MHz]
        hRes = 7.5;   % [m]
    case 2
        unitConvertorPCR = 40;
        hRes = 3.75;
    case 3
        unitConvertorPCR = 20;
        hRes = 7.5;
    case 4
        unitConvertorPCR = 40;
        hRes = 7.5;
end

MieC = Mie .* unitConvertorPCR;
MieC = MieC ./ (1 - deadtime * 1e-3 * MieC);


function [Mie, Records, mTime] = readDats(files, folder, handles)
if isempty(files)
    Mie = [];
    mTime = [];
    return;
end

Mie = [];
mTime = [];
flagShowHeaderOnce = false;
Records = 1000;
tic;
for iFile = 1:length(files)
    [MiePC, ~, overflow, headerTmp, flagSuccess] = readDat(fullfile(folder, files{iFile}));
    if ~ flagSuccess
        MiePC = NaN(16384, 1);
        handles.log_box.String{end + 1} = sprintf('[%s] Error in reading %s', datestr(now, 'yyyymmdd HH:MM'), fullfile(folder, files{iFile}));
    elseif nansum(overflow) >= 1
        handles.log_box.String{end + 1} = sprintf('[%s] Warning: signal overflow at %s', datestr(now, 'yyyymmdd HH:MM'), fullfile(folder, files{iFile}));
    elseif ~ flagShowHeaderOnce
        flagShowHeaderOnce = true;
        Records = str2double(headerTmp.Records);
        handles.log_box.String{end + 1} = sprintf('-------------------------------------');
        handles.log_box.String{end + 1} = sprintf('Start to read dat files at %s', folder);
        handles.log_box.String{end + 1} = sprintf('Header info:');
        handles.log_box.String{end + 1} = sprintf('Operator        %s', headerTmp.operator);
        handles.log_box.String{end + 1} = sprintf('Bin Width       %s', headerTmp.BinWidth);
        handles.log_box.String{end + 1} = sprintf('Bins/Record     %s', headerTmp.Bins);
        handles.log_box.String{end + 1} = sprintf('Records/Scan    %s', headerTmp.Records);
        handles.log_box.String{end + 1} = sprintf('Pulse Energy    %s', headerTmp.Energy);
        handles.log_box.String{end + 1} = sprintf('Repetition Rate %s', headerTmp.Rep);
        handles.log_box.String{end + 1} = sprintf('Wave Length     %s', headerTmp.wavelength);   
        scrollDownLogBox(handles.log_box);
    end
    try
        Mie = [Mie, MiePC];
        mTime = [mTime, rem(datenum(files{iFile}(1:8), 'HHMMSS'), 1)];
    catch
        handles.log_box.String{end + 1} = sprintf('[%s] Error: failure in reading %s at line %6d.', datestr(now, 'yyyymmdd HH:MM:SS'), files{iFile}, length(MiePC) + 8);
        scrollDownLogBox(handles.log_box);
        continue;
    end
end
elapseTime = toc;
handles.log_box.String{end + 1} = sprintf('Time usage: %5.1fs', elapseTime);
scrollDownLogBox(handles.log_box);


function scrollDownLogBox(log_box_handle)
jhLogBox = findjobj(log_box_handle);
jEdit = jhLogBox.getComponent(0).getComponent(0);
jEdit.setCaretPosition(jEdit.getDocument.getLength);


function [PC, AD, overflow, header, flag] = readDat(file)

flag = true;
PC = [];
AD = [];
overflow = [];
header = [];
fid = fopen(file, 'r');

try
% read header
    line = fgetl(fid);
    tmp = textscan(line, 'Operator        %s');
    header.operator = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Bin Width       %s');
    header.BinWidth = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Bins/Record     %s');
    header.Bins = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Records/Scan    %s');
    header.Records = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Pulse Energy    %s');
    header.Energy = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Repetition Rate %s');
    header.Rep = tmp{1}{1};
    line = fgetl(fid);
    tmp = textscan(line, 'Wave Length     %s');
    header.wavelength = tmp{1}{1};

    % read data
    textSpec = '%d %f %f %f';
    data = textscan(fid, textSpec, 'delimiter', ' ', 'headerlines', 1);   
    PC = data{2};
    AD = data{3};
    overflow = logical(data{4});
catch ME
    flag = false;
end

fclose(fid);


% --- Executes on selection change in liceltype_box.
function LicelType_Box_Callback(hObject, eventdata, handles)
% hObject    handle to liceltype_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns liceltype_box contents as cell array
%        contents{get(hObject,'Value')} returns selected item from liceltype_box


% --- Executes during object creation, after setting all properties.
function LicelType_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liceltype_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Deadtime_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Deadtime_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Deadtime_Box as text
%        str2double(get(hObject,'String')) returns contents of Deadtime_Box as a double


% --- Executes during object creation, after setting all properties.
function Deadtime_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Deadtime_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Smooth_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Smooth_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Smooth_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Smooth_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Smooth_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Smooth_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Date_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Date_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Date_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Date_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Date_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Date_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Res_Button.
function Res_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Res_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% gather parameters
sondeSite = handles.sondeSite_Edit_Box.String;
if isempty(loadSondeDate(handles))
    return;
else
    sondeTime = loadSondeDate(handles) + rem(datenum(handles.sondeTime_Pop_Menu.String{handles.sondeTime_Pop_Menu.Value}, 'HH:MM UTC'), 1);
end
fitRange = [str2double(handles.fitRange_B_Edit_Box.String), str2double(handles.fitRange_T_Edit_Box.String)];
smoothWin = smoothStr2Array(handles.Smooth_Edit_Box.String);
fitType = handles.quadratic_fit.Value * 2 + handles.linear_fit.Value;
flagSelectUDM = logical(handles.UDM_Checkbox.Value);
MieDT = str2double(handles.Mie_DT_Edit_Box.String);
HighJDT = str2double(handles.HighJ_DT_Edit_Box.String);
LowJDT = str2double(handles.LowJ_DT_Edit_Box.String);
LicelType = handles.LicelType_Box.Value;

%% read High_J and Low_J data

% read Mie
if ~ isfield(handles, 'Mie')
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: Please load the data of Elastic channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end
[MieC, MiehRes, MieunitConvertorPCR] = sigPreProcess(handles.Mie, MieDT, LicelType);
MiePCR2PC = 1 ./ MieunitConvertorPCR .* handles.MieRecords;
[MieSig, MieBg] = removeBg(MieC, 12000:16000);
if isempty(handles.Mie)
    MienBins = 16384;
else
    MienBins = size(MieC, 1);
end

% read High_J
if ~ isfield(handles, 'HighJ')
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: Please load the data of High J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end
[HighJC, HighJhRes, HighJunitConvertorPCR] = sigPreProcess(handles.HighJ, HighJDT, LicelType);
HighJPCR2PC = 1 ./ HighJunitConvertorPCR .* handles.HighJRecords;
[HighJSig, HighJBg] = removeBg(HighJC, 12000:16000);
if isempty(handles.HighJ)
    HighJnBins = 16384;
else
    HighJnBins = size(HighJC, 1);
end

% read Low_J
if ~ isfield(handles, 'LowJ')
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: Please load the data of Low J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end
[LowJC, LowJhRes, LowJunitConvertorPCR] = sigPreProcess(handles.LowJ, LowJDT, LicelType);
LowJPCR2PC = 1 ./ LowJunitConvertorPCR .* handles.LowJRecords;
[LowJSig, LowJBg] = removeBg(LowJC, 12000:16000);
if isempty(handles.LowJ)
    LowJnBins = 16384;
else
    LowJnBins = size(LowJC, 1);
end

%% retrieving radiosonde data
URL = sprintf('http://weather.uwyo.edu/cgi-bin/sounding?region=pac&TYPE=TEXT%%3ALIST&YEAR=%04s&MONTH=%02s&FROM=%04s&TO=%04s&STNM=%05s', datestr(sondeTime, 'yyyy'), datestr(sondeTime, 'mm'), datestr(sondeTime, 'ddHH'), datestr(sondeTime, 'ddHH'), sondeSite);
handles.log_box.String{end + 1} = sprintf('Start to download Radiosonde data...');
handles.log_box.String{end + 1} = sprintf('%s', URL);
scrollDownLogBox(handles.log_box);
[~, altitude, temperature] = get_rs(URL, handles);
if isnan(temperature)
    return;
end
temperature = temperature + 273.16;   % convert to K


%% temperature fitting
if ~ (LowJnBins == HighJnBins)
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Inconsistent number of bins between High J and Low J channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end

if isempty(smoothWin)
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Wrong settings for smooth window.', datestr(now, 'yyyymmdd HH:MM:SS'));
    handles.log_box.String{end + 1} = sprintf('smooth window format: ');
    handles.log_box.String{end + 1} = sprintf('h1Bottom-h1Top, smooth1Win; h2Bottom-h2Top, smooth2Win; ...');
    scrollDownLogBox(handles.log_box);
    return;
end

HighJHeight = (1:HighJnBins) .* HighJhRes / 1000;
HighJInt = squeeze(nansum(HighJSig, 2) .* HighJPCR2PC);
HighJBgInt = squeeze(nansum(HighJBg, 2) .* HighJPCR2PC);
HighJSNR = pieceWiseSNR(HighJInt, HighJBgInt, smoothHeight2Indx(smoothWin, HighJHeight, HighJhRes));
HighJSmooth = pieceWiseSmooth(HighJInt, HighJHeight, HighJhRes, smoothWin, 'moving');
HighJSmooth(HighJSmooth <= 0) = 1e-5;

LowJHeight = (1:LowJnBins) .* LowJhRes / 1000;
LowJInt = squeeze(nansum(LowJSig, 2) .* LowJPCR2PC);
LowJBgInt = squeeze(nansum(LowJBg, 2) .* LowJPCR2PC);
LowJSNR = pieceWiseSNR(LowJInt, LowJBgInt, smoothHeight2Indx(smoothWin, LowJHeight, LowJhRes));
LowJSmooth = pieceWiseSmooth(LowJInt, LowJHeight, LowJhRes, smoothWin, 'moving');
LowJSmooth(LowJSmooth <= 0) = 1e-5;

sigRatio = HighJSmooth ./ LowJSmooth;

[sigRatioInterp] = interp1(transpose(HighJHeight), sigRatio, altitude' / 1000);
fitRangeIndx = find(altitude / 1000 >= fitRange(1) & altitude / 1000 <= fitRange(2));
positiveIndx = find(sigRatioInterp(fitRangeIndx) > 0);
sigRatioValid = sigRatioInterp(fitRangeIndx(positiveIndx));
temperatureValid = temperature(fitRangeIndx(positiveIndx))';

if ~ flagSelectUDM   
    if fitType == 1   % Linear fit
        [fitRes, gof] = fit(1./temperatureValid', log(sigRatioValid)', 'poly1');
        fitCoef = coeffvalues(fitRes);
        fitConf = confint(fitRes);
        a = NaN;
        b = fitCoef(1);
        c = fitCoef(2);
        tempFit = abs(b ./ (log(sigRatio) - c));
        sysTempErr = tempFit - interp1(altitude', temperature', transpose((1:HighJnBins) .* HighJhRes), 'linear', 'extrap');
        randTempErr = randTempErrCal(sigRatio, [b, c], 'linear', HighJSNR, LowJSNR, sigRatio(fix(nanmean((fitRange * 1000 - HighJHeight(1))./HighJhRes)))/1000);
        handles.log_box.String{end + 1} = sprintf('Linear fit results:');
        handles.log_box.String{end + 1} = sprintf('High_J / Low_J = exp(b/T + c)');
        handles.log_box.String{end + 1} = sprintf('b = %f (%f, %f)', b, fitConf(1, 1), fitConf(1, 2));
        handles.log_box.String{end + 1} = sprintf('c = %f (%f, %f)', c, fitConf(2, 1), fitConf(2, 2));
        handles.log_box.String{end + 1} = sprintf('R-square: %f', gof.rsquare);
        scrollDownLogBox(handles.log_box);
    elseif fitType == 2   % Quadratic fit
        [fitRes, gof] = fit(1./temperatureValid', log(sigRatioValid)', 'poly2');
        fitCoef = coeffvalues(fitRes);
        fitConf = confint(fitRes);
        a = fitCoef(1);
        b = fitCoef(2);
        c = fitCoef(3);
        tempFit = abs(2 .* a ./ (-b - sqrt(b.^2 - 4 .* a .* (c - log(sigRatio)))));
        sysTempErr = tempFit - interp1(altitude', temperature', transpose((1:HighJnBins) .* HighJhRes), 'linear', 'extrap');
        randTempErr = randTempErrCal(sigRatio, [a, b, c], 'Quadratic', HighJSNR, LowJSNR, sigRatio(fix(nanmean((fitRange * 1000 - HighJHeight(1))./HighJhRes)))/1000);
        handles.log_box.String{end + 1} = sprintf('Quadratic fit results:');
        handles.log_box.String{end + 1} = sprintf('High_J / Low_J = exp(a/T^2 + b/T + c)');
        handles.log_box.String{end + 1} = sprintf('a = %f (%f, %f)', a, fitConf(1, 1), fitConf(2, 1));
        handles.log_box.String{end + 1} = sprintf('b = %f (%f, %f)', b, fitConf(1, 2), fitConf(2, 2));
        handles.log_box.String{end + 1} = sprintf('c = %f (%f, %f)', c, fitConf(1, 3), fitConf(2, 3));
        handles.log_box.String{end + 1} = sprintf('R-square: %f', gof.rsquare);
        scrollDownLogBox(handles.log_box);
    end
else 
    if fitType == 1   % Linear fit
        a = NaN;
        b = str2double(handles.b_Edit_Box.String);
        c =  str2double(handles.c_Edit_Box.String);
        fitRes = @(x) b .* x + c;
        tempFit = abs(b ./ (log(sigRatio) - c));
        sysTempErr = tempFit - interp1(altitude', temperature', transpose((1:HighJnBins) .* HighJhRes), 'linear', 'extrap');
        randTempErr = randTempErrCal(sigRatio, [b, c], 'linear', HighJSNR, LowJSNR, sigRatio(fix(nanmean((fitRange * 1000 - HighJHeight(1))./HighJhRes)))/1000);
    elseif fitType == 2   % Quadratic fit
        a = str2double(handles.a_Edit_Box.String);
        b = str2double(handles.b_Edit_Box.String);
        c =  str2double(handles.c_Edit_Box.String);
        fitRes = @(x) a .* x .^ 2 + b .* x + c;
        tempFit = abs(2 .* a ./ (-b - sqrt(b.^2 - 4 .* a .* (c - log(sigRatio)))));
        sysTempErr = tempFit - interp1(altitude', temperature', transpose((1:HighJnBins) .* HighJhRes), 'linear', 'extrap');
        randTempErr = randTempErrCal(sigRatio, [a, b, c], 'Quadratic', HighJSNR, LowJSNR, sigRatio(fix(nanmean((fitRange * 1000 - HighJHeight(1))./HighJhRes)))/1000);
    end
end

%% data visualization

% colorplot
zoom on
pan on
height = (1:MienBins) .* MiehRes / 1000;
MieRCS = MieSig .* repmat(height', 1, size(MieSig, 2)).^2;
time = handles.MieTime;
MieRCS(MieRCS <= 0) = 1e-5;
axes(handles.RCS_axes);
h = findobj(gca, 'Type', 'Line');
delete(h);
if ~ isempty(handles.HighJTime)
    timeTmp = handles.HighJTime;
    hold on
    p1 = plot([timeTmp(1), timeTmp(1)], [height(1), height(end)], '--w', 'LineWidth', 1);
    p2 = plot([timeTmp(end), timeTmp(end)], [height(1), height(end)], '--w', 'LineWidth', 1);
    hold off
end
% load('myjet_colormap.mat')
% colormap(myjet);
% if size(MieRCS, 2) <= 1
%     time = linspace(datenum(2000, 1, 1), datenum(2000, 1, 2), 100);
%     p1 = pcolor(time, height, zeros(length(height)));
%     handles.log_box.String{end + 1} = sprintf('[%s] Warning: only 1 data file was selected which is not suitable for colorplot.', datestr(now, 'yyyymmdd HH:MM:SS'));
%     scrollDownLogBox(handles.log_box);
% else
%     p1 = pcolor(time, height, log10(MieRCS));
% end
% p1.EdgeColor = 'None';
% caxis([0, 4]);
% xlabel('LT');
% ylabel('Height (km)');
% handles.RCS_axes.FontSize = 8;
% handles.RCS_axes.FontName = 'Times New Roman';
% ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
% title(sprintf('Logarithm of Range Corrected Signal'));
% ax = gca;
% ax.TickDir = 'out';
% ax.XTick = linspace(time(1), time(end), 13);
% datetick('x', 'HH:MM', 'keepticks');
% xlim([time(1), time(end)]);
% colorbar('Position', [0.777, 304/551, (803-788)/1000, (515-304)/551]);

axes(handles.Raw_Sig_axes);
MieSig(MieSig <= 0) = 1e-5;
MiePC = squeeze(nansum(MieSig, 2)) .* MiePCR2PC;
p1 = semilogx(MiePC, height, '-g', 'LineWidth', 1, 'DisplayName', 'Elastic'); hold on;
p2 = semilogx(HighJSmooth, HighJHeight, '-r', 'LineWidth', 1, 'DisplayName', 'High_J'); hold on;
p3 = semilogx(LowJSmooth, LowJHeight, '-b', 'LineWidth', 1, 'DisplayName', 'Low_J'); hold on;
xlabel('Photon Count');
ylabel('Height (km)');
xlim([1e0, 1e8]);
ax = gca;
ax.XTick = [1e0, 1e2, 1e4, 1e6, 1e8];
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
grid();
l = legend([p1, p2, p3], 'Location', 'NorthEast');
l.FontSize = 4;
handles.Raw_Sig_axes.FontSize = 8;
handles.Raw_Sig_axes.Box = 'on';
handles.Raw_Sig_axes.FontName = 'Times New Roman';
hold off;  

axes(handles.T_Ratio_axes)
s1 = scatter(temperatureValid, sigRatioValid, '*', 'MarkerEdgeColor', 'k', 'SizeData', 8, 'DisplayName', 'Original'); hold on;
tempTmp = 100:320;
p1 = plot(tempTmp, exp(fitRes(1./tempTmp)), 'DisplayName', 'fit');
hold off;
xlabel('T (K)');
ylabel('$\rm \frac{High_J}{Low_J}$', 'interpreter', 'latex');
xlim([180, 300]);
ax = gca;
ax.XTick = 180:20:300;
handles.T_Ratio_axes.FontSize = 8;
handles.T_Ratio_axes.Box = 'on';
handles.T_Ratio_axes.FontName = 'Times New Roman';
grid();
legend([s1, p1], 'Location', 'NorthEast');

axes(handles.T_axes)
p1 = plot(temperature, altitude/1000, '-r', 'LineWidth', 1, 'Marker', '.', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Radiosonde'); hold on;
p2 = plot(tempFit, HighJHeight, '-b', 'LineWidth', 1, 'DisplayName', 'Lidar'); hold off;
xlabel('T (K)');
ylabel('Height (km)');
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
xlim([180, 310]);
ax = gca;
ax.XTick = 180:20:310;
set(ax, 'YMinorTick', 'on', 'XMinorTick', 'on');
handles.T_axes.FontSize = 8;
handles.T_axes.Box = 'on';
handles.T_axes.FontName = 'Times New Roman';
grid();
legend([p1, p2], 'Location', 'NorthEast');

axes(handles.Err_axes)
p1 = plot(sysTempErr, HighJHeight, '-b', 'LineWidth', 1, 'DisplayName', 'Sys Err'); hold on;
p2 = plot(randTempErr, HighJHeight, '--m', 'LineWidth', 1, 'DisplayName', 'Rand Err');
p3 = plot(-randTempErr, HighJHeight, '--m', 'LineWidth', 1);
hold off;
xlabel('Error (T)');
xlim([-8, 8]);
ylim([str2double(handles.h_B_Edit_Box.String), str2double(handles.h_T_Edit_Box.String)]);
ax = handles.Err_axes;
ax.YTickLabel = '';
ax.XTick = -8:2:8;
handles.Err_axes.FontSize = 8;
handles.Err_axes.Box = 'on';
handles.Err_axes.FontName = 'Times New Roman';
grid();
legend([p1, p2], 'Location', 'NorthEast');

%% data update
handles.tempFit = tempFit;
handles.fitCoef = [a, b, c];
handles.URL = URL;
handles.MiePC = MiePC;
handles.HighJSmooth = HighJSmooth;
handles.LowJSmooth = LowJSmooth;
guidata(hObject, handles);
    

% --- Executes on selection change in sondeTime_Pop_Menu.
function sondeTime_Pop_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to sondeTime_Pop_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sondeTime_Pop_Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sondeTime_Pop_Menu


% --- Executes during object creation, after setting all properties.
function sondeTime_Pop_Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sondeTime_Pop_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sondeSite_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to sondeSite_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sondeSite_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of sondeSite_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function sondeSite_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sondeSite_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [ pressure, altitude, temperature ] = get_rs( URL, handles )
%Reads pressure, altitude and temperature arrays from sounding file given
%in specified weblocation
%   This function reads pressure, altitude and temperature arrays from
%   sounding for the specified web location.
%
%   Input arguments:
%   
%   URL         - string containing URL where web content regarding an
%                 appropriate sounding file is stored
%
%   Output arguments:
%
%   pressure    - pressure [hPa]
%
%   altitude    - height [m]
%
%   temperature - temperature [°C]


% get data from internet (example url:
% 'http://weather.uwyo.edu/cgi-bin/sounding?region=europe&TYPE=TEXT%3ALIST&YEAR=2015&MONTH=03&FROM=2312&TO=2312&STNM=10393')

[status, radiosonde] = system(['wget -qO- "' URL '"']);

if status == 0
    handles.log_box.String{end + 1} = sprintf('Could not import radiosonde data from web.');
    scrollDownLogBox(handles.log_box);
end

% Match expression in radiosonde string and find last index
% set while_loop (crosses out incomplete lines in the radiosonde information) on true
while_loop = true;

k = regexp(radiosonde, '-----------------------------------------------------------------------------', 'end');

if numel(k) == 0
    handles.log_box.String{end + 1} = sprintf('Problem with radiosonde from website:');
    handles.log_box.String{end + 1} = sprintf('%s', URL);
    scrollDownLogBox(handles.log_box);
    pressure    = NaN;
    altitude    = NaN;
    temperature = NaN;
    return;
    % while_loop = false;
end

radiosonde(1:max(k)+1) = [];

k = strfind(radiosonde, '</PRE><H3>Station');

if numel(k) == 0
    handles.log_box.String{end + 1} = sprintf('Problem with radiosonde from website:');
    handles.log_box.String{end + 1} = sprintf('%s', URL);
    scrollDownLogBox(handles.log_box);
    pressure    = NaN;
    altitude    = NaN;
    temperature = NaN;
    return;
    % while_loop = false;
end

radiosonde(k:end) = [];

% radiosonde should now be a string, where each line has 11 values and for
% each value there should be 7 spaces. each line then has 7*11 characters
% plus the newline information contained in character 78 at the end of the line

% check if number of entries in radiosonde is insufficient
lines = floor(length(radiosonde)/78);
if lines < 10
    handles.log_box.String{end + 1} = sprintf('Insufficient data in radiosonde from website:');
    handles.log_box.String{end + 1} = sprintf('%s', URL);
    scrollDownLogBox(handles.log_box);
    pressure    = NaN;
    altitude    = NaN;
    temperature = NaN;
    return;
end
    
while while_loop
    % preallocate
    lines = floor(length(radiosonde)/78);
    if lines == 0
        handles.log_box.String{end + 1} = sprintf('Insufficient data in radiosonde from website:');
        handles.log_box.String{end + 1} = sprintf('%s', URL);
        scrollDownLogBox(handles.log_box);
        pressure    = NaN;
        altitude    = NaN;
        temperature = NaN;
        return;
    end
    pressure    = NaN(lines,1);
    altitude    = NaN(lines,1);
    temperature = NaN(lines,1);
    
    for k = 1:lines
        while_loop = false;
        index = (k-1)*78 + 1;

        % check if in the reserved space within the file is a number or if
        % only there are only spaces
        if numel(sscanf(radiosonde(index:index+6), '%g')) == 0  ||  numel(sscanf(radiosonde(index+7:index+13), '%g')) == 0  ||  numel(sscanf(radiosonde(index+14:index+20), '%g')) == 0
            radiosonde(index:index+77)=[]; % cross out the line with empty entries from the string "radiosonde"
            while_loop = true;
            break; % start over at while
        end
        pressure(k)    = sscanf(radiosonde(index:index+6), '%g');   % pressure [hPa]
        altitude(k)    = sscanf(radiosonde(index+7:index+13), '%g');   % altitude [m]
        temperature(k) = sscanf(radiosonde(index+14:index+20), '%g');   % temperature [°C]
    end
end
       



function b_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to b_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of b_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function b_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to c_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of c_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function c_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [err] = randTempErrCal(sigRatio, coef, fitType, HighJSNR, LowJSNR, deltaSigRatio)
if strcmpi(fitType, 'linear')
    temp = abs(coef(1) ./ (log(sigRatio) - coef(2)));
    tempDelta = abs(coef(1) ./ (log(sigRatio + deltaSigRatio) - coef(2)));
    err = (tempDelta - temp) ./ deltaSigRatio .* sigRatio .* sqrt(1./HighJSNR.^2 + 1./LowJSNR.^2);
elseif strcmpi(fitType, 'Quadratic')
    temp = abs(2 .* coef(1) ./ (-coef(2) - sqrt(coef(2).^2 - 4 .* coef(1) .* (coef(3) - log(sigRatio)))));
    tempDelta  = abs(2 .* coef(1) ./ (-coef(2) - sqrt(coef(2).^2 - 4 .* coef(1) .* (coef(3) - log(sigRatio + deltaSigRatio)))));
    err = (tempDelta - temp) ./ deltaSigRatio .* sigRatio .* sqrt(1./HighJSNR.^2 + 1./LowJSNR.^2);
else
    err = [];
end

function [files] = findDatFiles(folder, startTime, endTime)
if ~ ischar(folder)
    files = 0;
    return;
end

fileList =  dir(fullfile(folder, '*.dat'));
if isempty(fileList)
    files = 0;
    return;
end

files = {};
for iFile = 1:length(fileList)
    if ~ isempty(regexp(fileList(iFile).name, '\d{6}.dat', 'once'))
        if datenum(fileList(iFile).name(1:6), 'HHMMSS') <= endTime && ...
           datenum(fileList(iFile).name(1:6), 'HHMMSS') >= startTime
            files{end + 1} = fileList(iFile).name;
        end        
    end
end

if isempty(files)
    files = 0;
end


function [sondeDate] = loadSondeDate(handles)
try
    sondeDate = datenum(handles.Date_Edit_Box.String, 'yyyy/mm/dd');
catch ME
    sondeDate = [];
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Wrong date format of Sonde Time. (eg, 2014/05/05)', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end


function [smoothWin] = smoothStr2Array(smoothStr)
textSpec = '%f-%f, %f;';
try
    data = textscan(smoothStr, textSpec);
catch ME
    smoothWin = [];
    return
end
if length(unique([length(data{1}), length(data{2}), length(data{3})])) ~= 1
    smoothWin = [];
    return;
end

smoothWin = [data{1}, data{2}, data{3}];


function smoothWinIndx = smoothHeight2Indx(smoothWin, height, hRes)
smoothWinIndx = NaN(size(smoothWin));
for iWin = 1:size(smoothWin, 1)
    bottomIndx = round((smoothWin(iWin, 1) - height(1)) ./ hRes) + 1;
    topIndx = round((smoothWin(iWin, 2) - height(1)) ./ hRes) + 1;
    smoothIndx = round(smoothWin(iWin, 3) ./ hRes);
    
    if bottomIndx <= 0 
        bottomIndx = 1;
    end
    if topIndx <= 0
        topIndx = length(signal);
    end
    if smoothIndx <= 0
        smoothIndx = 40;
    end
    if topIndx < bottomIndx
        smoothWinIndx = [];
        return;
    end
    
    smoothWinIndx(iWin, :) = [bottomIndx, topIndx, smoothIndx];
end


function signalS = pieceWiseSmooth(signal, height, hRes, smoothWin, mode)
signalS = signal;
for iWin = 1:size(smoothWin, 1)
    bottomIndx = round((smoothWin(iWin, 1) - height(1)) ./ hRes) + 1;
    topIndx = round((smoothWin(iWin, 2) - height(1)) ./ hRes) + 1;
    smoothIndx = round(smoothWin(iWin, 3) ./ hRes);
    
    if bottomIndx <= 0 
        bottomIndx = 1;
    end
    if topIndx <= 0
        topIndx = length(signal);
    end
    if smoothIndx <= 0
        smoothIndx = 40;
    end
    
    signalS(bottomIndx:topIndx) = smooth(signalS(bottomIndx:topIndx), smoothIndx, mode);
end


function SNR = pieceWiseSNR(signal, bg, smoothWinIndx)
SNR = NaN(size(signal));
for iWin = 1:size(smoothWinIndx, 1)
    indx = smoothWinIndx(iWin, 1):smoothWinIndx(iWin, 2);
    SNR(indx) = signal(indx) ./ sqrt(bg(indx) + signal(indx)) .* sqrt(smoothWinIndx(iWin, 3));
end


function Mie_StartT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Mie_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mie_StartT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Mie_StartT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Mie_StartT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mie_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mie_EndT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Mie_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mie_EndT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Mie_EndT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Mie_EndT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mie_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HighJ_StartT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to HighJ_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HighJ_StartT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of HighJ_StartT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function HighJ_StartT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HighJ_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LowJ_StartT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to LowJ_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LowJ_StartT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of LowJ_StartT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function LowJ_StartT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LowJ_StartT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HighJ_EndT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to HighJ_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HighJ_EndT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of HighJ_EndT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function HighJ_EndT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HighJ_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LowJ_EndT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to LowJ_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LowJ_EndT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of LowJ_EndT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function LowJ_EndT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LowJ_EndT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Load_Mie_Button.
function Load_Mie_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Mie_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MieFolder = handles.Mie_Edit_Box.String;
if MieFolder == 0
    MieFolder = '';
end
if ~ exist(MieFolder, 'dir')
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Invalid folder for Mie channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end

try
    startTime = datenum(handles.Mie_StartT_Edit_Box.String, 'HHMM');
    endTime = datenum(handles.Mie_EndT_Edit_Box.String, 'HHMM');
catch ME
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Wrong period settings for Mie channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    return;
end

[MieFiles] = findDatFiles(MieFolder, startTime, endTime);
if ~ (ischar(MieFiles) || iscell(MieFiles))
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: No data were selected for Mie channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    handles.MieFiles = '';
    handles.MieFolder = '';
else
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('%4d dat files were selected.', length(MieFiles));
    handles.log_box.String{end + 1} = sprintf('Loading......');
    scrollDownLogBox(handles.log_box);
    [Mie, MieRecords, MieTime] = readDats(MieFiles, MieFolder, handles);
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('[%s] Selected Folder for Mie channel: %s', datestr(now, 'yyyymmdd HH:MM:SS'), MieFolder);
    handles.log_box.String{end + 1} = sprintf('%4d dat files were loaded.', length(MieFiles));
    scrollDownLogBox(handles.log_box);
    handles.MieFiles = MieFiles;
    handles.Mie = Mie;
    handles.MieRecords = MieRecords;
    handles.MieTime = MieTime;
end
guidata(hObject, handles);

% --- Executes on button press in Load_HighJ_Button.
function Load_HighJ_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Load_HighJ_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HighJFolder = handles.High_J_Edit_Box.String;
if HighJFolder == 0
    HighJFolder = '';
end
if ~ exist(HighJFolder, 'dir')
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Invalid folder for High J channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end

try
    startTime = datenum(handles.HighJ_StartT_Edit_Box.String, 'HHMM');
    endTime = datenum(handles.HighJ_EndT_Edit_Box.String, 'HHMM');
catch ME
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Wrong period settings for High J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    return;
end

[HighJFiles] = findDatFiles(HighJFolder, startTime, endTime);
if ~ (ischar(HighJFiles) || iscell(HighJFiles))
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: No data were selected for High J channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    handles.HighJFiles = '';
    handles.HighJFolder = '';
else
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('%4d dat files were selected.', length(HighJFiles));
    handles.log_box.String{end + 1} = sprintf('Loading......');
    scrollDownLogBox(handles.log_box);
    [HighJ, HighJRecords, HighJTime] = readDats(HighJFiles, HighJFolder, handles);
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('[%s] Selected Folder for High J channel: %s', datestr(now, 'yyyymmdd HH:MM:SS'), HighJFolder);
    handles.log_box.String{end + 1} = sprintf('--->%4d dat files were loaded.', length(HighJFiles));
    scrollDownLogBox(handles.log_box);
    handles.HighJFiles = HighJFiles;
    handles.HighJ = HighJ;
    handles.HighJRecords = HighJRecords;
    handles.HighJTime = HighJTime;
end
guidata(hObject, handles);


% --- Executes on button press in Load_LowJ_Button.
function Load_LowJ_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Load_LowJ_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LowJFolder = handles.Low_J_Edit_Box.String;
if LowJFolder == 0
    LowJFolder = '';
end
if ~ exist(LowJFolder, 'dir')
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Invalid folder for Low J channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    return;
end

try
    startTime = datenum(handles.LowJ_StartT_Edit_Box.String, 'HHMM');
    endTime = datenum(handles.LowJ_EndT_Edit_Box.String, 'HHMM');
catch ME
    handles.log_box.String{end + 1} = sprintf('[%s] Error: Wrong period settings for Low J channel', datestr(now, 'yyyymmdd HH:MM:SS'));
    return;
end

[LowJFiles] = findDatFiles(LowJFolder, startTime, endTime);
if ~ (ischar(LowJFiles) || iscell(LowJFiles))
    handles.log_box.String{end + 1} = sprintf('[%s] Warning: No data were selected for Low J channel.', datestr(now, 'yyyymmdd HH:MM:SS'));
    scrollDownLogBox(handles.log_box);
    handles.LowJFiles = '';
    handles.LowJFolder = '';
    return;
else
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('%4d dat files were selected.', length(LowJFiles));
    handles.log_box.String{end + 1} = sprintf('Loading......');
    scrollDownLogBox(handles.log_box);
    [LowJ, LowJRecords, LowJTime] = readDats(LowJFiles, LowJFolder, handles);
    handles.log_box.String{end + 1} = sprintf('-------------------------------------');
    handles.log_box.String{end + 1} = sprintf('[%s] Selected Folder Low J channel: %s', datestr(now, 'yyyymmdd HH:MM:SS'), LowJFolder);
    handles.log_box.String{end + 1} = sprintf('--->%4d dat files were loaded.', length(LowJFiles));
    scrollDownLogBox(handles.log_box);
    handles.LowJFiles = LowJFiles;
    handles.LowJ = LowJ;
    handles.LowJRecords = LowJRecords;
    handles.LowJTime = LowJTime;
end

guidata(hObject, handles);


function Mie_DT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Mie_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mie_DT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of Mie_DT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function Mie_DT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mie_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_B_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to h_B_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h_B_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of h_B_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function h_B_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h_B_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_T_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to h_T_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h_T_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of h_T_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function h_T_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h_T_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HighJ_DT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to HighJ_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HighJ_DT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of HighJ_DT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function HighJ_DT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HighJ_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LowJ_DT_Edit_Box_Callback(hObject, eventdata, handles)
% hObject    handle to LowJ_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LowJ_DT_Edit_Box as text
%        str2double(get(hObject,'String')) returns contents of LowJ_DT_Edit_Box as a double


% --- Executes during object creation, after setting all properties.
function LowJ_DT_Edit_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LowJ_DT_Edit_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UDM_Checkbox.
function UDM_Checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to UDM_Checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UDM_Checkbox
