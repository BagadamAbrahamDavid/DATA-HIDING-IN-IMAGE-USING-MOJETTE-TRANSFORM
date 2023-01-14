function[dec_msg]=deembedding_img(embedded_img,original_img,wmsz,idx_row,idx_clm) 
r_w=sqrt(wmsz);
c_w=r_w;
wm_img=double(embedded_img);
img_r=double(original_img/2);
 dec_msg=zeros(1,wmsz);
 for id=1:wmsz
     dec_msg(1,id)=(((wm_img(idx_row(1,id),idx_clm(1,id)))/img_r(idx_row(1,id),idx_clm(1,id)))-1)*100;
 end
 dec_msg=reshape(uint8(dec_msg),r_w,c_w)*16;
 
