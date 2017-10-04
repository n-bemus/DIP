function y=saltpeppergaussian(r,c,std,p,v)
q=rand(r,c);
z=std*randn(r,c);
z(q<=p)=-v;
z(q>=1-p)=v;
y=z;
