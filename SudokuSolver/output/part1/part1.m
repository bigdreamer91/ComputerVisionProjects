a=imread('SudokuGrid3.jpg');
b=im2bw(a,0.5);
bi=~b;
whitebg([1 1 1]);
bi = medfilt2(bi);
bi = medfilt2(bi);
c = fspecial('average');
bi = imfilter(bi,c);
bi = imfilter(bi,c);

se=strel('square',30);
d1=imdilate(bi,se);
d2=~d1;
[L,num]= bwlabel(d2);
a1=label2rgb(L);
imshow(a1);
figure, imshow(a);