image = imread("/***/objects.jpg");
[originalRows, originalColumns, ~] = size(image);
img = imresize(image, [floor(originalRows/5), floor(originalColumns/5)]);
gray = rgb2gray(img);
gray8 = im2uint8(gray);
limite = 160;
imagebinaire = gray8 > limite;
[L, num] = bwlabel(imagebinaire);
[rows, columns] = size(L);
highlight = uint8(repmat(img, [1, 1, 1]));
for i = 1:rows
    for j = 1:columns
        if L(i, j) == 0
            highlight(i, j, :) = [255, 255, 255];
        endif
    endfor
endfor
figure;
imshow(highlight);
