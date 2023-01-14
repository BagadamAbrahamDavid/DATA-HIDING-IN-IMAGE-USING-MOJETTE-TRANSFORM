function[img0,img45,img135]=mojette_top(img)
[r,c]=size(img);
num_slices=(r*c)/9;
img_slice=reshape(img,3,3,num_slices);
img0=zeros(num_slices,3);
img45=zeros(num_slices,5);
img135=zeros(num_slices,5);
for ii=1:num_slices
    [img0(ii,:),img45(ii,:),img135(ii,:)]=mojette(img_slice(:,:,ii));
end
