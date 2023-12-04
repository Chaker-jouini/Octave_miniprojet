image = imread("/****/objects.jpg");
[originalRows, originalColumns, ~] = size(image);
img=imresize(image,[floor(originalRows/5),floor(originalColumns/5)]);
[rows, columns, ~] = size(img);
function result= similaire(pixel1, pixel2)
    limite = 30;
    diff = abs(pixel1 - pixel2);
    result = all(diff <= limite);
endfunction
cluster = [];
for i = 1:rows
  for j = 1:(columns-1)
      if j+1 <= columns
        if similaire(img(i, j, :), img(i, j+1, :))
          cluster = [cluster; i, j; i, j+1];
        endif
      endif
   
  endfor
endfor
for k = 1:2:size(cluster, 1)
    img(cluster(k, 1), cluster(k, 2), :) = 0;
    img(cluster(k+1, 1), cluster(k+1, 2), :) = 0;
endfor
figure;
imshow(img);
  
  
  
  
  
  
