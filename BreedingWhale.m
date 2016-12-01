function whalePopulation = BreedingWhale(whalePopulation, whaleBreedRequirement,breedFullnessReduction, initialFullness)
  pregnantWhales = find(whalePopulation > whaleBreedRequirement);
  numPregnantWhales = length(pregnantWhales);
  emptySpaces = find(whalePopulation == 0);
  numEmptySpaces = length(emptySpaces);
  numNewWhales = min(numPregnantWhales, numEmptySpaces);
  randLinearIndices = randperm(numEmptySpaces, numNewWhales);
  for i = 1:numNewWhales
    whalePopulation(pregnantWhales(i)) = whalePopulation(pregnantWhales(i))*breedFullnessReduction;
    whalePopulation(emptySpaces(randLinearIndices(i))) = initialFullness;
  end  
end