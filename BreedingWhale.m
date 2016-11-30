function whalePopulation = BreedingWhale(whalePopulation, whaleBreedRequirement,breedFullnessReduction, initialFullness)
  pregnantWhales = find(whalePopulation > whaleBreedRequirement);
  emptySpaces = find(whalePopulation == 0);
  noNewWhales = min(size(pregnantWhales,1), size(emptySpaces,1));
  newWhales = randperm(size(emptySpaces,1), noNewWhales);
  for i = 1:size(pregnantWhales,1)
    whalePopulation(pregnantWhales(i)) = whalePopulation(pregnantWhales(i))*breedFullnessReduction;
    whalePopulation(newWhales(i)) = initialFullness;
  end
  
end