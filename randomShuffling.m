a = imread('baboon.bmp');
b = imresize(a, [256, 256]);
gb = rgb2gray(b);
[bx,by] = imgradientxy(gb, 'intermediate');
TVb = sum(abs(bx(:))) + sum(abs(by(:)));
imshow(gb)

d = zeros(0, 100000);
for j = 1:100000
disp(j);
c = b ;
for  i = 1:256
idx = randperm(256);
c(i,idx, :) = b(i,:, :);
end

for  i = 1:256
idx = randperm(256);
c(idx,i, :) = c(:,i, :);
end
gc = rgb2gray(c);
[cx,cy] = imgradientxy(gc, 'intermediate');
TVc = sum(abs(cx(:))) + sum(abs(cy(:)));
d(j) = TVc;
end

histogram(d, 30)
xlabel('TV of permuted Baboon Image')

figure 
subplot(1, 3, 1), imshow(gb)
subplot(1, 3, 2), imshow(abx)
subplot(1, 3, 3), imshow(by)


figure 
subplot(1, 2, 1), imshow(b)
subplot(1, 2, 2), imshow(c)
