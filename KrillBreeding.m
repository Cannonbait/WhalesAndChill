function krillPopulation = KrillBreeding(krillPopulation,New_Krills_Limit,GRID_SIZE)
    % generate random numer of krills between 1-50
    % the same number of krill population is added
    no_of_krills = randi([1 New_Krills_Limit]);
    New = randi([1 GRID_SIZE],no_of_krills,2);
    krillPopulation = vertcat(krillPopulation , New);
end