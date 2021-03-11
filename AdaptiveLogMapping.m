clear all;close all; clc

% Load and display image
Original = imread('images/sample3.jpg');

% Convert image to floating point values
I = double(Original);

bias = 0.35;

% Convert from RGB to XYZ, with white point at d65
I = I./255;
XYZ = rgb2xyz(I, 'WhitePoint', 'd65');

% max value of Y
Lwmax = max(max(XYZ(:,:,2)));

% Choosen as max luminance of current display
Ldmax = 100;

[Rows, Columns, Depth] = size(I);

for col=1:1:Rows
    for row=1:1:Columns
        
        %World luminance Lw
        Lw = XYZ(col,row,2);
        
        % Referenced 'https://en.wikipedia.org/wiki/CIE_1931_color_space'
        % section 'CIE xy chromaticity diagram and the CIE xyY color space'
        % We will need these variables to convert the X and Z values
        x = XYZ(col,row,1) / (XYZ(col,row,1) + XYZ(col,row,2) + XYZ(col,row,3));
        y = XYZ(col,row,2) / (XYZ(col,row,1) + XYZ(col,row,2) + XYZ(col,row,3));
        z = 1 - x - y;
        
        % Equation 4 of the paper
        XYZ(col,row,2) = ((Ldmax * 0.01)/ log10(Lwmax + 1)) * log(Lw + 1) / log(2 + ((Lw / Lwmax)^(log(bias) / log(0.5)) * 8));
        
        % Referenced 'https://en.wikipedia.org/wiki/CIE_1931_color_space'
        % section 'CIE xy chromaticity diagram and the CIE xyY color space'
        XYZ(col,row,1) = XYZ(col,row,2) * x / y;
        XYZ(col,row,3) = XYZ(col,row,2) * z / y;
    end
end

% Convert back to RGB
output = uint8(xyz2rgb(XYZ, 'WhitePoint', 'd65')*255);
figure,imshow(Original),title("Orignal");
figure,imshow(output),title("New");