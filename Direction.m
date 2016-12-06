function Angle = Direction(whalePopulation,Angle,Theta)

Whale_size = size(whalePopulation(whalePopulation>0),1);
Angle_size = size(Angle,2);

if Whale_size >Angle_size
  newAngles1 = Whale_size -Angle_size;
  for i = 1 : newAngles1
    AngleNew(i) = Theta(randi(numel(Theta)));
  end
  Angle = horzcat(Angle,AngleNew);
elseif Whale_size < Angle_size
  newAngles2 =  Angle_size-Whale_size;
  Angle = Angle(1:Angle_size-newAngles2);
end

end
