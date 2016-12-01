function DrawPopulations(whalePopulation, krillPopulation)
  lattice = krillPopulation + 1;
  lattice(whalePopulation > 0) = 3;
  
  % Plot
  image(lattice);
  colorMap = [1 1 1; 1 0 0; 0 0 1];
  colormap(colorMap);
  drawnow;
end

