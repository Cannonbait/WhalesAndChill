function whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE)
  n = size(whalePopulation(:,1));
  VonNeuman = [1 -1 0 0; 0 0 1 -1]; % VonNeuman Neighbourhood
  XPos = whalePopulation(:,1);
  YPos = whalePopulation(:,2);
  for i = 1:n
    for t= 1:4
      i2 = XPos(i)+VonNeuman(1,t);
      j2 = YPos(i)+VonNeuman(2,t);
      if i2 > 0 && i2 < AREA_SIZE+1 && j2 > 0 && j2 < AREA_SIZE+1 && rand < WHALE_MOVEMENT_RATE
        whalePopulation(i,1) = whalePopulation(i,1)+VonNeuman(1,t);
        whalePopulation(i,2) = whalePopulation(i,2)+VonNeuman(2,t);
      end
    end
  end
end