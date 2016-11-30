function [ output_args ] = DrawPopulations( whalePopulation, krillPopulation, AREA_SIZE )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  clf;
  plot(whalePopulation(:,1),whalePopulation(:,2),'.k')
  hold on
  plot(krillPopulation(:,1),krillPopulation(:,2),'.g')
  axis([0 AREA_SIZE 0 AREA_SIZE]);
  pause(0.01);

end

