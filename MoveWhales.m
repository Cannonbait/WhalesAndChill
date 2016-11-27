function whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE)
n = size(whalePopulation(:,1));
XPos = whalePopulation(:,1);
YPos = whalePopulation(:,2);
VonNeuman = [1 -1 0 0; 0 0 1 -1]; % VonNeuman Neighbourhood

for i = 1:n
    for t= 1:4
        i2 = XPos(i)+VonNeuman(1,t); j2= YPos(i)+VonNeuman(2,t);
        if i2>0 && i2 <AREA_SIZE+1 && j2>0 && j2 <AREA_SIZE+1 && rand < WHALE_MOVEMENT_RATE
            XPos(i) = XPos(i)+VonNeuman(1,t);
            YPos(i) = YPos(i)+VonNeuman(2,t);
        end
    end
end

end