function krillPopulation = BreedingKrill(krillPopulation,krillReproductionRate,GRID_SIZE)
  % generate random numer of krills between 1-50
  % the same number of krill population is added
  noOfNewKrill = round(size(krillPopulation,1)*krillReproductionRate);
  New = randi([1 GRID_SIZE],noOfNewKrill,2);
  krillPopulation = vertcat(krillPopulation , New);
end