function [whalePopulation,Angle1,Angle2] = IntelligentWhales(whalePopulation,whalePopulation_old,Angle1,Angle2)
Theta1 =  [  90 180 270 360 ];
Theta2 = [  90 180 270 360 ];
areaSize = length(whalePopulation);
[x1,y1] = find(whalePopulation > 0);
[x2,y2] = find(whalePopulation_old > 0);
numWhales = length(x1);
movementSeed = rand(numWhales,1);
Angle1_new = Angle1;
Angle2_new = Angle2;

for i = 1:numWhales
  x = x1(i);
  y = y1(i);
  xOld = x;
  yOld = y;
  fullness = whalePopulation(x,y);
  Change_in_Score = whalePopulation(x1(i),y1(i))-whalePopulation_old(x2(i),y2(i));
  Score = whalePopulation(x1(i),y1(i));
  if Change_in_Score<=0 && Score<200
    Angle1_new(i) = Theta1(randi(numel(Theta1)));
    Angle2_new(i) = Theta2(randi(numel(Theta2)));
     dx = cosd(Angle2_new(i));
    dy = sind(Angle1_new(i));
    x = x+dx;
    y = y+dy;
  elseif Change_in_Score>0&& Score<200
    Angle1_new(i) = Theta1(randi(numel(Theta1)));
    Angle2_new(i) = Theta2(randi(numel(Theta2)));
    if rand<0.6
    dx = cosd(Angle2_new(i));
    dy = sind(Angle1_new(i));
    x = x+dx;
    y = y+dy;
    end
  end
  if rand<0.8
    dx = cosd(Angle2_new(i))*2;
    dy = sind(Angle1_new(i))*2;
    x = x+dx;
    y = y+dy;
  end
  
  
  [x, y] = PeriodicBoundary(x, y, areaSize);
  [x, y] = FixCollisions(xOld, yOld, x, y, whalePopulation);
  whalePopulation(xOld, yOld) = 0;
  whalePopulation(x,y) = fullness;
  
end
Angle1 = Angle1_new;
Angle2 = Angle2_new;
end