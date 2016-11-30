function krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE,AREA_SIZE)
  n = size(krillPopulation(:,1));
  VonNeuman = [1 -1 0 0; 0 0 1 -1]; % VonNeuman Neighbourhood
  XPos = krillPopulation(:,1);
  YPos = krillPopulation(:,2);
  for i = 1:n
    for t = 1:4
      i2 = XPos(i)+VonNeuman(1,t);
      j2 = YPos(i)+VonNeuman(2,t);
      if i2 > 0 && i2 < AREA_SIZE+1 && j2 > 0 && j2 < AREA_SIZE+1 && rand < KRILL_MOVEMENT_RATE
        krillPopulation(i,1) = krillPopulation(i,1)+VonNeuman(1,t);
        krillPopulation(i,2) = krillPopulation(i,2)+VonNeuman(2,t);
      end
    end
  end
end