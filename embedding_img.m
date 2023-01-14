function[wm_img,wmsz,idx_row,idx_clm]=embedding_img(img_host,img_msg)
img_r=img_host;
msg_r=img_msg;
[r_w,c_w]=size(msg_r);
[r_i,c_i]=size(img_r);
wmsz=r_w*c_w;
msg_rsp=reshape(msg_r,1,wmsz);
img_rsp=reshape(img_r,1,(r_i*c_i));
[img_val,idx]=sort(img_rsp,'descend');
idx_wm=idx(1:wmsz);
idx_row=zeros(1,wmsz);
idx_clm=zeros(1,wmsz);
for id=1:wmsz
    idx_clm(1,id)=floor(idx_wm(1,id)/r_i)+1;
    idx_row(1,id)=mod(idx_wm(1,id),r_i);
    if(idx_row(1,id)==0)
        idx_row(1,id)=r_i;
    end
end
img_r=double(img_r)/2;
msg_rsp=double(msg_rsp)/2;
wm_img=img_r;
for id=1:wmsz
    wm_img(idx_row(1,id),idx_clm(1,id))= img_r(idx_row(1,id),idx_clm(1,id))+(0.001*img_r(idx_row(1,id),idx_clm(1,id))*msg_rsp(1,id));
end