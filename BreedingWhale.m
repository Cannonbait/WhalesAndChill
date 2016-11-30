function whalePopulation = BreedingWhale(whalePopulation,Whale_breed_Score,GRID_SIZE)
  % add new whales
  ind = size(find(whalePopulation(:,3)>=Whale_breed_Score),1);
  new = randi([1 GRID_SIZE],ind,2);
  new(:,3) = 1;
  whalePopulation = vertcat(whalePopulation,new);
  % remove score for the matured
  Matured = whalePopulation(:,3);
  Matured(Matured==Whale_breed_Score) = 1;
  whalePopulation(:,3) = Matured;
end