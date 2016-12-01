function krillPopulation = BreedingKrill(krillPopulation,krillReproductionRate, krillCarryingCapacity)
  totalKrill = sum(krillPopulation(:) > 0);
  numOffspring = krillReproductionRate*totalKrill*(1-totalKrill/krillCarryingCapacity);
  
  emptySpaces = find(krillPopulation == 0);
  numEmptySpaces = length(emptySpaces);
  numNewKrill = round(min(numOffspring, numEmptySpaces));
  randLinearIndices = randperm(numEmptySpaces, numNewKrill);
  for i = 1:numNewKrill
    position = emptySpaces(randLinearIndices(i));
    krillPopulation(position) = 1;
  end

end