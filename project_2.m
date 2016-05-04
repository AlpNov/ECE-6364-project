clear;clc;

obj = VideoReader('ECE6364_project_data.avi');                                                                
video=read(obj);                                                                                              
video = video(17:512,207:805,:,:); %trim off the black border
video_out = uint8(zeros(size(video)));
video_out = video_out(:,:,1,:); %eliminate RGB array
num_frm=90;
for k = 1:num_frm
	Im = rgb2gray(video(:,:,:,k));
	% this spot can be found in the scene00061.png file
%	s_blurr = Im(276:280,101:105); %there is a white spot here that would work for sampling the blurr
%	s_blurr = double(s_blurr - min(s_blurr(:)));
%	mask_s = s_blurr/max(s_blurr(:));
%	mask_s = mask_s/sum(mask_s(:));
	mask = fspecial('gaussian',5,1.5);
	%imshow(Im(250:300,75:125));
	Im_r=deconvwnr(Im, mask, 0.15);
	video_out(:,:,:,k) = Im_r;
	%imshow(Im_r(250:300,75:125));
end

v_writer = VideoWriter('output.avi');
open(v_writer);
writeVideo(v_writer,video_out);
close(v);
