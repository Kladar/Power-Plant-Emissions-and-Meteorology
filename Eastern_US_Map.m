%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To make a map of the Eastern US and fill in the various states and EPA
% Regions with a color representing their emissions sensitivity to
% temperature change
%
% Ryan Kladar July 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
close;
clc;
colormap hot;
%colormap autumn;
colormap(flipud(colormap));
%% Create Grid of States and their sensitivities
%Rows in order are Region 1, 2, 3, Indiana, Kentucky, Ohio
load state_sens.mat;


%SET COLUMN
%First column is Absolute change in tons at 25-26 change
%Second column is percent change at 25-26 change

%Third column is absolute change in tons at 15-14 change
%Fourth column is percent change at 15-14 change

sens_index_column = 1;


%CHOOSE SPECIES

species = state_sens_nox;
%species = state_sens_so2
%species = state_sens_co2

%% Plotting Code

%Setup of the map 

region = usamap({'KY', 'ME'});
set(region, 'Visible', 'off');

latlim = getm(region, 'MapLatLimit');
lonlim = getm(region, 'MapLonLimit');
states = shaperead('usastatehi',...
        'UseGeoCoords', true, 'BoundingBox', [lonlim', latlim']);
names = {states.Name};

%% Color the states based on their Percent sensitivity

%Region 1
Region1index = [3 10 12 16 22 25];
colorRegion1 = getcolor(species(2,sens_index_column));

%Region 2
Region2index = [17 18];
colorRegion2 = getcolor(species(2,sens_index_column));

%Region 3
Region3index = [4 11 21 26 27];
colorRegion3 = getcolor(species(3,sens_index_column));

%Indiana
indexIndiana = strcmp('Indiana',names);
colorIndiana = getcolor(species(4,sens_index_column));

%Kentucky
indexKentucky = strcmp('Kentucky',names);
colorKentucky = getcolor(species(5,sens_index_column));

%Ohio
indexOhio = strcmp('Ohio',names);
colorOhio = getcolor(species(6,sens_index_column));

%Out of Study
OutofStudyindex = [1 2 6 8 13 14 15 19 23 24 28];

geoshow(region, states(Region1index),  'FaceColor', colorRegion1)
geoshow(region, states(Region2index), 'FaceColor', colorRegion2)
geoshow(region, states(Region3index), 'FaceColor', colorRegion3)
geoshow(region, states(indexIndiana),  'FaceColor', colorIndiana)
geoshow(region, states(indexOhio), 'FaceColor', colorOhio)
geoshow(region, states(indexKentucky), 'FaceColor', colorKentucky)
geoshow(region, states(OutofStudyindex), 'FaceColor', [.9 .9 .9])

set(gca, 'CLim', [0 50]);
c = colorbar;
c.Label.String = 'Increase NOx emissions (tons)'

%% Color the states based on their sensitivity

% %Region 1
% Region1index = [3 10 12 16 22 25];
% colorRegion1 = [.5 .5 .5];
% 
% %Region 2
% Region2index = [17 18];
% colorRegion2 = [.5 1 .5];
% 
% %Region 3
% Region3index = [4 11 21 26 27];
% colorRegion3 = [.5 .5 1];
% 
% %Indiana
% indexIndiana = strcmp('Indiana',names);
% colorIndiana = [1 .5 .5];
% 
% %Kentucky
% indexKentucky = strcmp('Kentucky',names);
% colorKentucky = [.3 .3 .3];
% 
% %Ohio
% indexOhio = strcmp('Ohio',names);
% colorOhio = [0 0 0];
% 
% %Out of Study
% OutofStudyindex = [1 2 6 8 13 14 15 19 23 24 28];
% 
% geoshow(region, states(Region1index),  'FaceColor', colorRegion1)
% geoshow(region, states(Region2index), 'FaceColor', colorRegion2)
% geoshow(region, states(Region3index), 'FaceColor', colorRegion3)
% geoshow(region, states(indexIndiana),  'FaceColor', colorIndiana)
% geoshow(region, states(indexOhio), 'FaceColor', colorOhio)
% geoshow(region, states(indexKentucky), 'FaceColor', colorKentucky)
% geoshow(region, states(OutofStudyindex), 'FaceColor', [.9 .9 .9])
% 
% lat = [states.LabelLat];
% lon = [states.LabelLon];
% tf = ingeoquad(lat, lon, latlim, lonlim);
% 
% colorbar
