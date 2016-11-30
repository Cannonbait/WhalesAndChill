% First and second dimension is for position, third is for amount eaten
function whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE)
    whalePopulation = randi([1 AREA_SIZE],NUMBER_WHALES,2);
    whalePopulation(:,3) = 1;
end