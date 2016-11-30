function krillPopulation = InitializeKrill(numberKrills, areaSize)
  krillPopulation = zeros(areaSize);
  initialPositions = randperm(areaSize*areaSize, numberKrills);
  for pos = 1:size(initialPositions,2)
    krillPopulation(initialPositions(pos)) = 1;
  end
end
