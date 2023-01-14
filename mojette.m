function[bin0,bin45,bin135]=mojette(a)
bin0=[];
bin135=[];
bin45=[];
[r,c]=size(a);
for ii=0:r-1
    bin0=[bin0 sum(a(r-ii,:))];
end
for ii=1:(r+c-1)
    bin135=[bin135 sum(diag(a,(ii-r)))];
end
a45=[a(:,3),a(:,2),a(:,1)];
for ii=1:(r+c-1)
    bin45=[bin45 sum(diag(a45,(ii-r)))];
end

