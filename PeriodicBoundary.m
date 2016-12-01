function [newX, newY] = PeriodicBoundary(x, y, areaSize)
  newX = x;
  newY = y;
  
  if (x > areaSize)
    newX = 1;
  elseif (x < 1)
    newX = areaSize;
  end
  
  if (y > areaSize)
    newY = 1;
  elseif (y < 1)
    newY = areaSize;
  end
end