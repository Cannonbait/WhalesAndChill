function krillPopulation = MoveKrill(krillPopulation)
  areaSize = length(krillPopulation);
  [X,Y] = find(krillPopulation > 0);
  numKrill = length(X);
  movementSeed = rand(numKrill,1);
  
  for i = 1:numKrill
    x = X(i);
    y = Y(i);
    krillPopulation(x,y) = 0;
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
    krillPopulation(x,y) = 1;
  end
end