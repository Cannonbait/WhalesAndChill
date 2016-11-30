function whalePopulation = InitializeWhales(numberWhales, areaSize, initialFullness)
  whalePopulation = zeros(areaSize);
  initialPositions = randperm(areaSize*areaSize, numberWhales);
  for pos = 1:size(initialPositions,2)
    whalePopulation(initialPositions(pos)) = initialFullness;
  end
end