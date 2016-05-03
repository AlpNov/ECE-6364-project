clear;clc;
filename = 'scene00061.png';
Im = imread(filename);
Im = rgb2gray(Im);
Im = Im(17:512,207:805); %trim off the black border
s_blurr = Im(276:280,101:105); %there is a white spot here that would work for sampling the blurr
s_blurr = double(s_blurr - min(s_blurr(:)));
mask_s = s_blurr/max(s_blurr(:));
mask_s = mask_s/sum(mask_s(:));
mask = fspecial('gaussian',5,1.5);
figure(1);
imshow(Im);
%imshow(Im(250:300,75:125));
figure(2);
Im_r=deconvwnr(Im, mask_s, 0.15);
imshow(Im_r);
%imshow(Im_r(250:300,75:125));

