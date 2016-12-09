function [whalePopulation,Angle1,Angle2] = IntelligentWhales(whalePopulation,krillPopulation,whalePopulation_old,Angle1,Angle2)
Theta1 = [90,90,0,-90,-90,-90,0,90];
Theta2 = [90,0,0,0,90,180,180,180];
Angle1 = Direction(whalePopulation,Angle1,Theta1);
Angle2 = Direction(whalePopulation,Angle2,Theta2);
areaSize = length(whalePopulation);
[x1,y1] = find(whalePopulation > 0);
[x2,y2] = find(whalePopulation_old > 0);
numWhales = length(x1);
movementSeed = rand(numWhales,1);
Angle1_new = Angle1;
Angle2_new = Angle2;
Whale_SearchLength = 10;
for i = 1:numWhales
  x = x1(i);
  y = y1(i);
  xOld = x;
  yOld = y;
  fullness = whalePopulation(x,y);
  Change_in_Score = whalePopulation(x1(i),y1(i))-whalePopulation_old(x2(i),y2(i));
  Score = whalePopulation(x1(i),y1(i));
  % Change the Direction
  if Change_in_Score<=0 && Score<800
    Angle1_new(i) = Angular_Search(Angle1_new(i),x,y,krillPopulation,Whale_SearchLength);
    Angle2_new(i) = Angular_Search(Angle2_new(i),x,y,krillPopulation,Whale_SearchLength);
 
    dx = cosd(Angle2_new(i));
    dy = sind(Angle1_new(i));
    mx = x+dx;
    my = y+dy;
    if ((mx && my) >0.5)&&((mx && my)<size(whalePopulation,1))
    x = round(x+dx);
    y = round(y+dy);
    end
  else
     if movementSeed(i) <= 0.25
      y = y+1;
    elseif movementSeed(i) <= 0.5
      y = y-1;
    elseif movementSeed(i) <= 0.75
      x = x+1;
    else
      x = x-1;
     end
  end
    
    
  [x, y] = PeriodicBoundary(x, y, areaSize);
  [x, y] = FixCollisions(xOld, yOld, x, y, whalePopulation);
  whalePopulation(xOld, yOld) = 0;
  whalePopulation(x,y) = fullness;
  
end
Angle1 = Angle1_new;
Angle2 = Angle2_new;
end