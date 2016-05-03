
obj = VideoReader('ECE6364_project_data.avi');
video=read(obj);
num_frm=90;
frm1=1;
video_gray=zeros(size(video,1),size(video,2),90,'uint8');
for k=frm1:num_frm
    video_gray(:,:,k)=rgb2gray(video(:,:,:,k));
end

clear video;
im=video_gray(:,:,10); % convert the 10th frame to an image im
figure (1)
imshow(im)


