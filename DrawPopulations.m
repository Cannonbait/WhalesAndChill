function DrawPopulations(whalePopulation, krillPopulation, areaSize) 
  % Create shared lattice (2 = krill, 3 = whale)
  figure(1);
  clf;
  lattice = zeros(areaSize, areaSize);
  
  for i = 1:size(krillPopulation, 1)
    xPos = krillPopulation(i, 1);
    yPos = krillPopulation(i, 2);
    lattice(xPos, yPos) = 2;
  end
  
  for i = 1:size(whalePopulation, 1)
    xPos = whalePopulation(i, 1);
    yPos = whalePopulation(i, 2);
    lattice(xPos, yPos) = 3;
  end
    
  image(lattice);
  colorMap = [1 1 1; 0 1 0; 0 0 0];
  colormap(colorMap);
  drawnow;
end

