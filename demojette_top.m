function[img]=demojette_top(img0,img45,img135)
len_img=length(img0);
row=(3)*sqrt(len_img);
clm=row;
img=zeros(row,clm);
img_slice=reshape(img,3,3,len_img);
for ii=1:len_img
    img_slice(:,:,ii)=demojette(img0(ii,:),img45(ii,:),img135(ii,:));
end
img=reshape(img_slice,row,clm);
