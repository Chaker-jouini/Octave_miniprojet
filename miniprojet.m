img = imread("/home/chaker/Pictures/try3.jpg");
[rows, columns, ~] = size(img);
%figure;imshow(img);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fonction pour comparer les valeurs RGB
function result= similaire(pixel1, pixel2)
  %variable de configuration du similarite acceptee dans le groupement
    limite = 100;
    %on calcule la differnce des valeurs 
    diff = abs(pixel1 - pixel2);
    %et on les compare avec le variable de configuration
    result = all(diff <= limite);
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%groupement des indices des pixels a couleurs similaires
%pour le moment la comparaison et seulement faite horizentalement
cluster = [];

%iteration des pixels de l'image
for i = 1:rows
  for j = 1:(columns-1)
    %comparaison des pixels adjacents(meme ligne) 
    if similaire(img(i,j,:), img(i,j+1,:))
      %on utilise if pour que le j+1 ne soit pas "out of range"
      if j+1 <= columns
        if similaire(img(i, j, :), img(i, j+1, :))
          %on ajoute les indices des pixels similaires
          cluster = [cluster; i, j; i, j+1];
        endif
      endif
    endif
  endfor
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%identifier les groupements par les donner des valeurs RGB nuls
for k = 1:2:size(cluster, 1)
  if img(cluster(k, 1), cluster(k, 2), :) ~= 255 && img(cluster(k+1, 1), cluster(k+1, 2), :) ~= 255
    img(cluster(k, 1), cluster(k, 2), :) = 0;
    img(cluster(k+1, 1), cluster(k+1, 2), :) = 0;
  endif
endfor
figure;
imshow(img);
  
  
  
  
  
  
