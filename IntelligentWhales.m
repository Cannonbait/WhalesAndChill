function whalePopulation = IntelligentWhales(whalePopulation,whalePopulation_old,Angle)
  Theta = [ 0 90 180 270];
  areaSize = length(whalePopulation);
  [x1,y1] = find(whalePopulation > 0);
  [x2,y2] = find(whalePopulation_old > 0);
  numWhales = length(x1);
  movementSeed = rand(numWhales,1);
 
  
  for i = 1:numWhales
    x = x1(i);
    y = y1(i);
    xOld = x;
    yOld = y;
    fullness = whalePopulation(x,y);
    Change_in_Score = whalePopulation(x1(i),y1(i))-whalePopulation_old(x2(i),y2(i));
    if Change_in_Score<0 && rand>0.2
      Angle(i) = Theta(randi(numel(Theta)));
    elseif Change_in_Score>0&& rand<0.2
      Angle(i) = Theta(randi(numel(Theta)));
    end
    dx = cosd(Angle(i));
    dy = sind(Angle(i));
    x = x+dx;
    y = y+dy;
    

    
    [x, y] = PeriodicBoundary(x, y, areaSize);
    [x, y] = FixCollisions(xOld, yOld, x, y, whalePopulation);
    whalePopulation(xOld, yOld) = 0;
    whalePopulation(x,y) = fullness;
    
  end
end