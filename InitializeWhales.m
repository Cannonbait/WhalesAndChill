function whalePopulation = InitializeWhales(numberWHales, areaSize, initialFullness)
  whalePopulation = zeros(areaSize);
  initialPositions = randperm(areaSize*areaSize, numberWHales);
  for pos = 1:size(initialPositions)
    whalePopulation(initialPositions(pos)) = initialFullness;
  end
end