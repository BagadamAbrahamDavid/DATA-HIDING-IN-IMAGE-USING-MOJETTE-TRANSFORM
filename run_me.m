% this code is developed based on the reference paper
% A New Information Hiding Method for Image Watermarking Based
% on Mojette Transform by Cui zhang and others

clc;
clear all;
close all;
img_host=imread('clg.jpg');
img_msg=imread('logo_hp.png');
img_host_r=imresize(img_host(:,:,1),[240 240]);
img_msg_r=imresize(img_msg(:,:,1),[120 120]);
figure(1)
imshow(img_host_r);title('Host Image');
figure(2)
imshow(img_msg_r);title('Secret message image');
% =====Embedding==========
[wm_img,wmsz,idx_row,idx_clm]=embedding_img(img_host_r,img_msg_r);
figure(3)
imshow(wm_img,[]);

% ====Mojette Transform====
%---original image-------
[img0,img45,img135]=mojette_top(img_host_r);
% figure(4)
% imshow(img0,[])
% figure(5)
% imshow(img45,[])
% figure(6)
% imshow(img135,[])
%---water marked image----
[wm0,wm45,wm135]=mojette_top(wm_img);
% figure(7)
% imshow(wm0,[])
% figure(8)
% imshow(wm45,[])
% figure(9)
% imshow(wm135,[])

% ====DeMojette====
%----original image---
[dec_original_img]=demojette_top(img0,img45,img135);
figure(10)
imshow(dec_original_img,[]);
%----water marked image---
[dec_water_mark]=demojette_top(wm0,wm45,wm135);
figure(11)
imshow(dec_water_mark,[]);title('Decoded Image');

%====deembedding_img=====
[dec_msg]=deembedding_img(dec_water_mark,dec_original_img,wmsz,idx_row,idx_clm);
figure(12)
imshow(dec_msg,[]);title('Extracted message image');
