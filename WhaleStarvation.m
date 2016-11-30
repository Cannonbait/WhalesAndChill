function whalePopulation = WhaleStarvation(whalePopulation, starvationRate, minFullnessSurvival)
  whalePopulation = whalePopulation - starvationRate;
  whalePopulation(whalePopulation < minFullnessSurvival) = 0;
end