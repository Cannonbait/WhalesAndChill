function whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE)
whalePopulation = randi([1 AREA_SIZE],NUMBER_WHALES,2);
whalePopulation(:,3) = 0;
end