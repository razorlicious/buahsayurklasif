function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 04-Jun-2022 04:35:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image
global lokasi

%import gambar
[filename pathname] = uigetfile({'*.jpg'},'File Selector');
lokasi = strcat(pathname,filename);
image = imread(lokasi);
set(handles.edit2,'String',filename)
axes(handles.axes1)
imshow(image)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image
global lokasi

%mencari nilai keabuan masing-masing derajat
hasil1 = GLCMprocess0(rgb2gray(image))
hasil2 = GLCMprocess45(rgb2gray(image))
hasil3 = GLCMprocess90(rgb2gray(image))
hasil4 = GLCMprocess135(rgb2gray(image))

img_gray = rgb2gray(image);
axes(handles.axes2)
imshow(img_gray)

axes(handles.axes3)
imshow(hasil1)

axes(handles.axes4)
imshow(hasil2)

axes(handles.axes5)
imshow(hasil3)

axes(handles.axes6)
imshow(hasil4)

entropy0 = entropysearch(hasil1)
entropy45 = entropysearch(hasil2)
entropy90 = entropysearch(hasil3)
entropy135 = entropysearch(hasil4)

energy0 = energysearch(hasil1)
energy45 = energysearch(hasil2)
energy90 = energysearch(hasil3)
energy135 = energysearch(hasil4)

homogen0 = homogenitassearch(hasil1)
homogen45 = homogenitassearch(hasil2)
homogen90 = homogenitassearch(hasil3)
homogen135 = homogenitassearch(hasil4)

contrast0 = contrastsearch(hasil1)
contrast45 = contrastsearch(hasil2)
contrast90 = contrastsearch(hasil3)
contrast135 = contrastsearch(hasil4)

data = get(handles.uitable1,'Data')
data{1,1} = num2str(entropy0)
data{1,2} = num2str(entropy45)
data{1,3} = num2str(entropy90)
data{1,4} = num2str(entropy135)

data{2,1} = num2str(energy0)
data{2,2} = num2str(energy45)
data{2,3} = num2str(energy90)
data{2,4} = num2str(energy135)

data{3,1} = num2str(homogen0)
data{3,2} = num2str(homogen45)
data{3,3} = num2str(homogen90)
data{3,4} = num2str(homogen135)

data{4,1} = num2str(contrast0)
data{4,2} = num2str(contrast45)
data{4,3} = num2str(contrast90)
data{4,4} = num2str(contrast135)

set(handles.uitable1,'Data',data,'ForegroundColor',[0 0 0])


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image_folder = 'C:\Users\Muhammad Rizky\Documents\MATLAB\Rizky 5\Data Latih';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
Z1=[];
for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);
    image = imread(full_name);
    img=rgb2gray(image);
    
hasil1=GLCMprocess0(img);
hasil2=GLCMprocess45(img);
hasil3=GLCMprocess90(img);
hasil4=GLCMprocess135(img);

entropy0 = entropysearch(hasil1)
entropy45 = entropysearch(hasil2)
entropy90 = entropysearch(hasil3)
entropy135 = entropysearch(hasil4)

energy0 = energysearch(hasil1)
energy45 = energysearch(hasil2)
energy90 = energysearch(hasil3)
energy135 = energysearch(hasil4)

homogen0 = homogenitassearch(hasil1)
homogen45 = homogenitassearch(hasil2)
homogen90 = homogenitassearch(hasil3)
homogen135 = homogenitassearch(hasil4)

contrast0 = contrastsearch(hasil1)
contrast45 = contrastsearch(hasil2)
contrast90 = contrastsearch(hasil3)
contrast135 = contrastsearch(hasil4)

Z=[entropy0 entropy45 entropy90 entropy135 energy0 energy45 energy90 energy135 homogen0 homogen45 homogen90 homogen135 contrast0 contrast45 contrast90 contrast135];
Z1 = [Z1;Z];
end
xlswrite('training',Z1);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%reset
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes4)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes5)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes6)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

set(handles.edit1,'String',[])
set(handles.edit2,'String',[])
set(handles.edit3,'String',[])
set(handles.uitable1,'Data',[])



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image
global lokasi

%mencari nilai keabuan masing-masing derajat
hasil1 = GLCMprocess0(rgb2gray(image))
hasil2 = GLCMprocess45(rgb2gray(image))
hasil3 = GLCMprocess90(rgb2gray(image))
hasil4 = GLCMprocess135(rgb2gray(image))

entropy0 = entropysearch(hasil1)
entropy45 = entropysearch(hasil2)
entropy90 = entropysearch(hasil3)
entropy135 = entropysearch(hasil4)

energy0 = energysearch(hasil1)
energy45 = energysearch(hasil2)
energy90 = energysearch(hasil3)
energy135 = energysearch(hasil4)

homogen0 = homogenitassearch(hasil1)
homogen45 = homogenitassearch(hasil2)
homogen90 = homogenitassearch(hasil3)
homogen135 = homogenitassearch(hasil4)

contrast0 = contrastsearch(hasil1)
contrast45 = contrastsearch(hasil2)
contrast90 = contrastsearch(hasil3)
contrast135 = contrastsearch(hasil4)

%klasifikasi

training1 = xlsread('training');
group = training1(:,17);
training = [training1(:,1) training1(:,2) training1(:,3) training1(:,4) training1(:,5) training1(:,6) training1(:,7) training1(:,8) training1(:,9) training1(:,10) training1(:,11) training1(:,12) training1(:,13) training1(:,14) training1(:,15) training1(:,16)];
Z=[entropy0 entropy45 entropy90 entropy135 energy0 energy45 energy90 energy135 homogen0 homogen45 homogen90 homogen135 contrast0 contrast45 contrast90 contrast135 ];

nilai_k = str2num(get(handles.edit3,'string'));

Mdl = fitcknn(training,group,'NumNeighbors',nilai_k);
hasil1 = predict(Mdl,Z);

if hasil1==1
    klasifikasi='Apple';
elseif hasil1==2
    klasifikasi='Avocado';
elseif hasil1==3
    klasifikasi='Banana';
elseif hasil1==4
    klasifikasi='Bean';
elseif hasil1==5
    klasifikasi='Bitter Gourd';
elseif hasil1==6
    klasifikasi='Broccoli';
elseif hasil1==7
    klasifikasi='Cabbage';
elseif hasil1==8
    klasifikasi='Capsicum';
elseif hasil1==9
    klasifikasi='Carrot';
elseif hasil1==10
    klasifikasi='Cauliflower';
elseif hasil1==11
    klasifikasi='Coconut';
elseif hasil1==12
    klasifikasi='Cucumber';
elseif hasil1==13
    klasifikasi='Grape';
elseif hasil1==14
    klasifikasi='Guava';
elseif hasil1==15
    klasifikasi='Kiwi';
elseif hasil1==16
    klasifikasi='Lychee';
elseif hasil1==17
    klasifikasi='Mango';
elseif hasil1==18
    klasifikasi='Orange';
elseif hasil1==19
    klasifikasi='Pear';
elseif hasil1==20
    klasifikasi='Pineapple';
elseif hasil1==21
    klasifikasi='Potato';
elseif hasil1==22
    klasifikasi='Pumpkin';
elseif hasil1==23
    klasifikasi='Salak';
elseif hasil1==24
    klasifikasi='Starfruit';
elseif hasil1==25
    klasifikasi='Tomato';
end

set(handles.edit1,'string',klasifikasi);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
