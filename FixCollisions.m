function [x, y] = FixCollisions(xOld, yOld, xNew, yNew, population)
    x = xNew;
    y = yNew;

    if (population(x, y) > 0)
      x = xOld;
      y = yOld;
    end
end