function krillPopulation = InitializeKrill(numberKrills, areaSize)
  krillPopulation = zeros(areaSize);
  initialPositions = randperm(areaSize*areaSize, numberKrills);
  for pos = 1:size(initialPositions)
    krillPopulation(initialPositions(pos)) = 1;
  end
end
