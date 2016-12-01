function whalePopulation = MoveWhales(whalePopulation)
  areaSize = length(whalePopulation);
  [X,Y] = find(whalePopulation > 0);
  numWhales = length(X);
  movementSeed = rand(numWhales,1);
  
  for i = 1:numWhales
    x = X(i);
    y = Y(i);
    fullness = whalePopulation(x,y);
    whalePopulation(x,y) = 0;
    if movementSeed(i) <= 0.25
      y = y+1;
    elseif movementSeed(i) <= 0.5
      y = y-1;
    elseif movementSeed(i) <= 0.75
      x = x+1;
    else
      x = x-1;
    end
    [x, y] = PeriodicBoundary(x, y, areaSize);
    whalePopulation(x,y) = fullness;
  end
end