function whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE)
  areaSize = size(whalePopulation,1);
  krill = find(whalePopulation > 0);
  movementSeed = rand(size(krill,1),1);
  
  for i = 1:size(krill,1)
    [y,x] = ind2sub(areaSize, krill(i));
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
    whalePopulation(y,x) = 1;
  end

end