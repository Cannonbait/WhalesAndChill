function [x, y] = VerifyMovement( x, y, oldX, oldY, population)
  if population(x, y) > 0
    x = oldX;
    y = oldY;
  end
end

