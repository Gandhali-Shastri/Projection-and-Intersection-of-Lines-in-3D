%--------------------------------------------------------------------------
% (b)Convert the image from RGB to grayscale.  For each pixel, take the average of the R, G, and B values

% 1. using nested for loops
profile on;
img2=imread('board.tif');
R=img2(:, :, 1);
G=img2(:, :, 2);
B=img2(:, :, 3);

[M, N, ~]=size(img2);
gray_img=zeros(M, N, 'uint8');


for i=1:M
    for j=1:N
        gray_img(i, j)=(R(i, j)*0.2989)+(G(i, j)*0.5870)+(B(i, j)*0.114);
    end
end
subplot(2,3,1);
imshow(gray_img);

profile off
% title('Grayscale Image');
%--------------------------------------------------------------------------
% 2. using MATLAB matrix operations
profile on
img3 = imread('board.tif');

r = img3(:,:,1);
g = img3(:,:,2);
b = img3(:,:,3);

average = (r*0.2989)+(g*0.5870)+(b*0.114);
subplot(2,3,2);
imshow(average);
% title('Grayscale Image');
profile off

%--------------------------------------------------------------------------
% 3. using built-in image processing functions rgb2gray and im2bw.
profile on
img4 = imread('board.tif');
I1 = rgb2gray(img4);
subplot(2,3,3);
imshow(I1);
% title('Grayscale Image');
profile off


%--------------------------------------------------------------------------
%(c)Convert the grayscale image to a binary image using the mean grayscale value as the threshold
% 1. using nested for loops
profile on
img5 = imread('board.tif');
%if colour conv to grayscale
[x, y, z]=size(img5); 
if z==3 
     img=rgb2gray(img5); 
end
img=double(img); 
threshold = (0+255)/2;
%disp(threshold);


binary=zeros(x, y); 
for i=1:x 
 for j=1:y 
    if img(i, j) >= threshold
            binary(i, j) = 1; 
    else
        binary(i, j)=0; 
    end
 end
end
profile off
subplot(2,3,4),
imshow(binary);

% title('Binary Image');
%--------------------------------------------------------------------------
% 2. using MATLAB matrix operations

profile on
img6 = rgb2gray(im2double(imread('board.tif')));

S = img6;
S(img6 > 0.5) = 1;
S(img6 <= 0.5) = 0;
subplot(2,3,5),
imshow(S);
% title('Binary Image');
profile off


%--------------------------------------------------------------------------
% 3. using built-in image processing functions rgb2gray and im2bw.
%--------------------------------------------------------------------------
profile on
img7 = rgb2gray(im2double(imread('board.tif')));
B1 = im2bw(img7,0.5);
subplot(2,3,6),
imshow(B1);
%title('Binary Image');
profile off

%--------------------------------------------------------------------------
%Smooth the grayscale image created above using a 7×7 averaging filter. 
% 1.  using for loops
profile on
img8 = imread('board.tif');
gray_img = rgb2gray(img8); 
[m,n] = size(gray_img);

    new_img = zeros(m,n);
    for i = 1:m-6
        for j = 1:n-6
            new_img(i+3,j+3) = mean2(gray_img(i:i+6,j:j+6));
        end
    end
new_img = uint8(new_img);
figure, imshow(new_img);
title('Smooth Image');

profile off

%--------------------------------------------------------------------------
% 2. using the Matlab function conv2. 
profile on
img9 = conv2(single(gray_img), ones(7)/49, 'same');
figure,imshow(img9, []); 
% or imshow(uint8(img9), [0 255]);
title('Smooth Image');
print('img9','-dpng');
profile off

%--------------------------------------------------------------------------
% a)Extract the rectangular block of the image between (200,90) and (300,180) corresponding to the crystalin the image. 

img1=imread('board.tif');
cropImg = imcrop(img1,[200 90 300-200 180-90]);
%imcrop(im,[x1 y1 x2-x1 y2-y1]);
figure,imshow(cropImg);
title('Cropped Image');
%p = profile('viewer');
%disp(p);
