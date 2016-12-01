function krillPopulation = MoveKrill(krillPopulation)
  areaSize = length(krillPopulation);
  [X,Y] = find(krillPopulation > 0);
  numKrill = length(X);
  movementSeed = rand(numKrill,1);
  
  for i = 1:numKrill
<<<<<<< HEAD
    x = X(i);
    y = Y(i);
    xOld = x;
    yOld = y;
    if movementSeed(i) <= 0.25;
=======
    oldX = X(i);
    oldY = Y(i);
    x = oldX;
    y = oldY;
    if movementSeed(i) <= 0.25
>>>>>>> e4b19b946d61b6ef6fc29ea7decdf495fe03900e
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
    [x, y] = FixCollisions(xOld, yOld, x, y, krillPopulation);
    krillPopulation(xOld, yOld) = 0;
=======
    [x, y] = VerifyMovement(x, y, oldX, oldY, krillPopulation);
    krillPopulation(oldX, oldY) = 0;
>>>>>>> e4b19b946d61b6ef6fc29ea7decdf495fe03900e
    krillPopulation(x,y) = 1;
  end
end