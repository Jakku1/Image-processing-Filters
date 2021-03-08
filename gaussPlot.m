
filtered_img = ultra_img;

% gauss1 = gauLowPass(1, filtered_img);
% gauss2 = gauLowPass(2, filtered_img);
% gauss3 = gauLowPass(3, filtered_img);
% gauss4 = gauLowPass(4, filtered_img);
% gauss5 = gauLowPass(5, filtered_img);
% gauss6 = gauLowPass(6, filtered_img);
% gauss7 = gauLowPass(7, filtered_img);
% gauss8 = gauLowPass(8, filtered_img);
% gauss9 = gauLowPass(9, filtered_img);
%  
%  imshow(uint8([gauss1 gauss2 gauss3; gauss4 gauss5 gauss6; gauss7 gauss8 gauss9]));

gauss_lines1 = edge(gauss1, 'Canny');
gauss_lines2 = edge(gauss2, 'Canny');
gauss_lines3 = edge(gauss3, 'Canny');
gauss_lines4 = edge(gauss4, 'Canny');
gauss_lines5 = edge(gauss5, 'Canny');
gauss_lines6 = edge(gauss6, 'Canny');
gauss_lines7 = edge(gauss7, 'Canny');
gauss_lines8 = edge(gauss8, 'Canny');
gauss_lines9 = edge(gauss9, 'Canny');
 
imshow([gauss_lines1 gauss_lines2 gauss_lines3; gauss_lines4 gauss_lines5 gauss_lines6; gauss_lines7 gauss_lines8 gauss_lines9])
