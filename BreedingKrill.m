function krillPopulation = BreedingKrill(krillPopulation,krillReproductionRate)
  emptySpaces = find(krillPopulation == 0);
  currentNoKrill = sum(krillPopulation(:) > 0);
  noNewKrill = min(floor(currentNoKrill*krillReproductionRate), size(emptySpaces,1));
  newKrill = randperm(size(emptySpaces,1), noNewKrill);
  for i = 1:noNewKrill
    krillPopulation(newKrill(i)) = 1;
  end
  
end