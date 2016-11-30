function whalePopulation = WhaleStarvation(whalePopulation, starvationRate, minFoodSurvival)
  whalePopulation(:,3) = arrayfun(@(x) x-1, whalePopulation(:,3));
  Remove = whalePopulation(:,3)>=minFoodSurvival;
  [x] = find(whalePopulation(:,1).*Remove);
  whalePopulation = whalePopulation(x,:);
end