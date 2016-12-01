function whalePopulation = MoveWhales(whalePopulation)
  areaSize = length(whalePopulation);
  [X,Y] = find(whalePopulation > 0);
  numWhales = length(X);
  movementSeed = rand(numWhales,1);
  
  for i = 1:numWhales
<<<<<<< HEAD
    x = X(i);
    y = Y(i);
    xOld = x;
    yOld = y;
=======
    oldX = X(i);
    oldY = Y(i);
    x = oldX;
    y = oldY;
>>>>>>> e4b19b946d61b6ef6fc29ea7decdf495fe03900e
    fullness = whalePopulation(x,y);
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
<<<<<<< HEAD
    [x, y] = FixCollisions(xOld, yOld, x, y, whalePopulation);
    whalePopulation(xOld, yOld) = 0;
=======
    [x, y] = VerifyMovement(x, y, oldX, oldY, whalePopulation);
    whalePopulation(oldX, oldY) = 0;
>>>>>>> e4b19b946d61b6ef6fc29ea7decdf495fe03900e
    whalePopulation(x,y) = fullness;
  end
end