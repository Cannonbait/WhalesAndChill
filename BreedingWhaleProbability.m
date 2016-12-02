function whalePopulation = BreedingWhaleProbability(whalePopulation, whaleBreedRequirement, postBreedFullness, initialFullness, probabilityBreeding)
  
  whales = find(whalePopulation > 0);
  randSeed = rand(length(whales),1);
  
  emptySpaces = find(whalePopulation == 0);
  % Shuffle the empty spaces value
  emptySpaces = emptySpaces(randperm(length(emptySpaces)));
  
  whalesBorn = 0;
  for i = 1:length(whales)
    if randSeed(i) < probabilityBreeding && whalePopulation(whales(i)) > whaleBreedRequirement
      whalesBorn = whalesBorn + 1;
      whalePopulation(emptySpaces(whalesBorn)) = initialFullness;
      whalePopulation(whales(i)) = postBreedFullness;
    end
  end
end

