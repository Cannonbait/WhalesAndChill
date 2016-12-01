function whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE)
  areaSize = size(whalePopulation,1);
  [Y,X] = find(whalePopulation > 0);
  movementSeed = rand(length(Y),1);
  
  for i = 1:length(Y)
    y = Y(i);
    x = X(i);
    fullness = whalePopulation(y,x);
    whalePopulation(y,x) = 0;
    if movementSeed(i) <= 0.25
      y = y+1;
    elseif movementSeed(i) <= 0.5
      y = y-1;
    elseif movementSeed(i) <= 0.75
      x = x+1;
    else
      x = x-1;
    end
    x = min(areaSize,x);
    x = max(1, x);
    y = min(areaSize,y);
    y = max(1, y);
    whalePopulation(y,x) = fullness;
  end

end