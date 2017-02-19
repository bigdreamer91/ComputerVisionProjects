image = imread('ScannedPuzzle3.jpg');
image = im2bw(image,0.5);
im1 = ~image;
image = imclearborder(image);


med = medfilt2(image);

se = strel('square',8);
u1 = imclearborder(med);
u1 = imerode(u1,se);
u1 = imclearborder(u1);
u = imfill(u1,'holes');
u = imdilate(u,se);

med = xor(u,med);
se1 = strel('square',3);
c = fspecial('average');
med = imfilter(med,c);
med = imfilter(med,c);
med = imdilate(med,se1);

location=zeros(9,9);

i1 = imread('numbers3/1.jpg');
i1 = im2bw(i1,0.5);
i1 = ~i1;
imshow(i1);

i2 = imread('numbers3/2.jpg');
i2 = im2bw(i2,0.5);
i2 = ~i2;


i3 = imread('numbers3/3.jpg');
i3 = im2bw(i3,0.5);
i3 = ~i3;

i4 = imread('numbers3/4.jpg');
i4 = im2bw(i4,0.5);
i4 = ~i4;

i5 = imread('numbers3/5.jpg');
i5 = im2bw(i5,0.5);
i5 = ~i5;

i6 = imread('numbers3/6.jpg');
i6 = im2bw(i6,0.5);
i6 = ~i6;

i7 = imread('numbers3/7.jpg');
i7 = im2bw(i7,0.5);
i7 = ~i7;

i8 = imread('numbers3/8.jpg');
i8 = im2bw(i8,0.5);
i8 = ~i8;

i9 = imread('numbers3/9.jpg');
i9 = im2bw(i9,0.5);
i9 = ~i9;

b = fspecial('average');

a1 = medfilt2(i1);
a1 = imfilter(a1,b);
a1 = imfilter(a1,b);

a2 = medfilt2(i2);
a2 = imfilter(a2,b);
a2 = imfilter(a2,b);

a3 = medfilt2(i3);
a3 = imfilter(a3,b);
a3 = imfilter(a3,b);

a4 = medfilt2(i4);
a4 = imfilter(a4,b);
a4 = imfilter(a4,b);

a5 = medfilt2(i5);
a5 = imfilter(a5,b);
a5 = imfilter(a5,b);

a6 = medfilt2(i6);
a6 = imfilter(a6,b);
a6 = imfilter(a6,b);

a7 = medfilt2(i7);
a7 = imfilter(a7,b);
a7 = imfilter(a7,b);

a8 = medfilt2(i8);
a8 = imfilter(a8,b);
a8 = imfilter(a8,b);

a9 = medfilt2(i9);
a9 = imfilter(a9,b);
a9 = imfilter(a9,b);

e1 = imerode(med,a1);
e1 = imclearborder(e1);
d1 = imdilate(e1,a1);

e2 = imerode(med,a2);
e2 = imclearborder(e2);
d2 = imdilate(e2,a2);

e3 = imerode(med,a3);
e3 = imclearborder(e3);
d3 = imdilate(e3,a3);

e4 = imerode(med,a4);
e4 = imclearborder(e4);
d4 = imdilate(e4,a4);

e5 = imerode(med,a5);
e5 = imclearborder(e5);
d5 = imdilate(e5,a5);

e6 = imerode(med,a6);
e6 = imclearborder(e6);
d6 = imdilate(e6,a6);

e7 = imerode(med,a7);
e7 = imclearborder(e7);
d7 = imdilate(e7,a7);

e8 = imerode(med,a8);
e8 = imclearborder(e8);
d8 = imdilate(e8,a8);

e9 = imerode(med,a9);
e9 = imclearborder(e9);
d9 = imdilate(e9,a9);


imshow(im1);



A1 = regionprops(e1,'Centroid');
A2 = regionprops(e2,'Centroid');
A3 = regionprops(e3,'Centroid');
A4 = regionprops(e4,'Centroid');
A5 = regionprops(e5,'Centroid');
A6 = regionprops(e6,'Centroid');
A7 = regionprops(e7,'Centroid');
A8 = regionprops(e8,'Centroid');
A9 = regionprops(e9,'Centroid');

radii = 30;

x1 = size(A1);
x2 = size(A2);
x3 = size(A3);
x4 = size(A4);
x5 = size(A5);
x6 = size(A6);
x7 = size(A7);
x8 = size(A8);
x9 = size(A9);


l1 = size(image);
width = floor(l1(1)/9);
height = floor(l1(2)/9);

for i = 1:x9(1)
    centers = A9(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=9;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x8(1)
    centers = A8(i).Centroid;
   v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=8;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x7(1)
    centers = A7(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=7;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x6(1)
    centers = A6(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=6;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x5(1)
    centers = A5(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=5;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x4(1)
    centers = A4(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=4;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x3(1)
    centers = A3(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=3;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x2(1)
    centers = A2(i).Centroid;
    v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=2;
         hold on
         viscircles(centers,radii);
         hold off
      end
end

for i = 1:x1(1)
    centers = A1(i).Centroid;
      v1 = ceil(centers(1,2)/height);
      v2 = ceil(centers(1,1)/width);
      if location(v1,v2) == 0
         location(v1,v2)=1;
         hold on
         viscircles(centers,radii);
         hold off
      end
end


figure, imshow(im1);
location