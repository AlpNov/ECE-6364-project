clear;clc;

obj = VideoReader('ECE6364_project_data.avi');                                                                
video=read(obj);                                                                                              
video = video(17:512,207:805,:,:); %trim off the black border
video_out = uint8(zeros(size(video)));
video_out = video_out(:,:,1,:); %eliminate RGB array
num_frm=90;
for k = 1:num_frm
	Im = rgb2gray(video(:,:,:,k));
	mask = fspecial('gaussian',5,1.5);
	Im_r=deconvwnr(Im, mask, 0.15);
	video_out(:,:,:,k) = Im_r;
end

v_writer = VideoWriter('output.avi');
open(v_writer);
writeVideo(v_writer,video_out);
close(v_writer);
