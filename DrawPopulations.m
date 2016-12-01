function DrawPopulations(whalePopulation, krillPopulation) 
  lattice = sign(whalePopulation)*2 + krillPopulation;
  
  % Plot
  imagesc(lattice);
  colorMap = [1 1 1; 1 0 0; 0 0 1];
  colormap(colorMap);
  drawnow;
end

