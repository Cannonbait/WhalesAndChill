function krillPopulation = PredationFishermen( krillPopulation, numberFishermen)
  krill = find(krillPopulation > 0);
  numKrillsToRemove = min(length(krill), numberFishermen);
  krillsToRemove = randperm(length(krill), numKrillsToRemove);
  
  for i = 1:length(krillsToRemove)
    krillPopulation(krill(krillsToRemove(i))) = 0;
  end
  

end

