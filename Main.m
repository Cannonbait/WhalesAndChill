clc
clear;close all;
NUMBER_WHALES = 100;
NUMBER_KRILLS = 1000;
AREA_SIZE = 100;

WHALE_MOVEMENT_RATE = 0.3;
KRILL_MOVEMENT_RATE = 0.6;
Whale_breed_Score = 40;
New_Krills_Limit = 5;
Interval = 50;
Starvation_Value = 2.5;
krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE);

TIMESTEPS = 10000;

statistics = zeros(2,TIMESTEPS);
figure(1);
tic
for iTimestep = 1:TIMESTEPS
    fprintf('Number of whales: %d - Number of krill: %d\n',...
        size(whalePopulation, 1), size(krillPopulation, 1));
    % Movement : try to possibly move in swarms or in groups
    % Insted of random movement
    krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE,AREA_SIZE);
    whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE);
    
    %Predation
    [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
        AREA_SIZE);
    
    %Breeding
    whalePopulation = WhaleBreeding(whalePopulation,Whale_breed_Score,AREA_SIZE);
    krillPopulation = KrillBreeding(krillPopulation,New_Krills_Limit,AREA_SIZE);
    
    %Starvation
    whalePopulation = WhaleStarvation(whalePopulation,TIMESTEPS,iTimestep,Starvation_Value,Interval);
    
    %Fishing (To be added)
    
    %Animation
    clf;
    plot(whalePopulation(:,1),whalePopulation(:,2),'.k')
    hold on
    plot(krillPopulation(:,1),krillPopulation(:,2),'.g')
    pause(0.01);
end
toc