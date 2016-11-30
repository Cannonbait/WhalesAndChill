function [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation, fullnessIncreaseWhales)
  whales = find(whalePopulation > 0);
  
  for i = 1:size(whales)
    if krillPopulation(whales(i)) > 0
      krillPopulation(whales(i)) = 0;
      whalePopulation(whales(i)) = whalePopulation(whales(i)) + fullnessIncreaseWhales;
    end
  end
end