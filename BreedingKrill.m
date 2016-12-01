function krillPopulation = BreedingKrill(krillPopulation,krillReproductionRate)
  emptySpaces = find(krillPopulation == 0);
  numEmptySpaces = length(emptySpaces);
  currentNumKrill = sum(krillPopulation(:) > 0);
  numOffspring = round(currentNumKrill*krillReproductionRate);
  numNewKrill = min(numOffspring, numEmptySpaces);
  randLinearIndices = randperm(numEmptySpaces, numNewKrill);
  for i = 1:numNewKrill
    position = emptySpaces(randLinearIndices(i));
    krillPopulation(position) = 1;
  end
  
end