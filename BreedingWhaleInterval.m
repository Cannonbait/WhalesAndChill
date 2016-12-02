function whalePopulation = BreedingWhaleInterval(whalePopulation, whaleBreedRequirement,breedFullnessReduction, initialFullness, iTimestep, breedingCycle)
  if (mod(iTimestep, breedingCycle) == 0)
    pregnantWhales = find(whalePopulation > whaleBreedRequirement);
    numPregnantWhales = length(pregnantWhales);
    emptySpaces = find(whalePopulation == 0);
    numEmptySpaces = length(emptySpaces);
    numNewWhales = min(numPregnantWhales, numEmptySpaces);
    randLinearIndices = randperm(numEmptySpaces, numNewWhales);
    for i = 1:numNewWhales
      whalePopulation(pregnantWhales(i)) = 200;
      position = emptySpaces(randLinearIndices(i));
      whalePopulation(position) = initialFullness;
    end  
  end
end