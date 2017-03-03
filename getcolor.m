function [mycolor] = getcolor(sensitivity)

cm = colormap ;% returns the current color map

%c=cm.*100;

colorID = max(1, sum(sensitivity./50 > [0:1/length(cm(:,1)):1])); 

mycolor = cm(colorID, :); % returns your color