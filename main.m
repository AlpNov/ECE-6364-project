clear;clc;

obj = VideoReader('ECE6364_project_data.avi');                                                                
video=read(obj);                                                                                              
video = video(17:512,207:805,:,:); %trim off the black border
video_size = size(video);
video_in= uint8(zeros(video_size([1 2 4])));
num_frm=90;

%gaussian blur mas identified in sample_blur.m
mask = fspecial('gaussian',5,1.5);

v_writer = VideoWriter('ECE6364_project_data_wiener.avi');
open(v_writer);
%apply wiener filter with the blur identified in sample_blur.m
for k = 1:num_frm
	Im = rgb2gray(video(:,:,:,k));
	video_in(:,:,k) = Im;
	Im_r=deconvwnr(Im, mask, 0.15);
	writeVideo(v_writer,Im_r);
end
close(v_writer);
%discard original RGB video
clear video;


v_writer = VideoWriter('ECE6364_project_data_contrast.avi');
open(v_writer);
%apply contrast stretching
for k = 1:num_frm
	Im = video_in(:,:,k);
	Im_c = histstretch(Im);
	writeVideo(v_writer,Im_c);
end
close(v_writer);

v_writer = VideoWriter('ECE6364_project_data_wiener_contrast.avi');
open(v_writer);
%apply wiener filter then contrast stretch
for k = 1:num_frm
	Im = video_in(:,:,k);
	Im_r=deconvwnr(Im, mask, 0.15);
	Im_rc = histstretch(Im_r);
	writeVideo(v_writer,Im_rc);
end
close(v_writer);
