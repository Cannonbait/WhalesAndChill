function whalePopulation = WhaleStarvation(whalePopulation, starvationRate, minFoodSurvival)
  newWhalePopulation = whalePopulation;
  for iWhale = 1:size(whalePopulation,1)
    newWhalePopulation(iWhale,3) = whalePopulation(iWhale,3)-starvationRate;
  end
  Remove = whalePopulation(:,3)>=minFoodSurvival;
  [x] = find(whalePopulation(:,1).*Remove);
  whalePopulation = whalePopulation(x,:);
end