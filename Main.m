clc
clear;
close all;
DEBUG_MODE_ON = 1; % Set this to 0 to stop plots and print outs during simulation
NUMBER_WHALES = 100;
NUMBER_KRILLS = 1000;
AREA_SIZE = 1000;

WHALE_MOVEMENT_RATE = 0.3;
KRILL_MOVEMENT_RATE = 0.6;
KRILL_REPRODUCTION_RATE = 0.01;
STARVATION_RATE = 10;
MIN_FOOD_SURVIVAL = 5;
Whale_breed_Score = 40;
New_Krills_Limit = 5;
Interval = 50;

krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE);

TIMESTEPS = 10000;

statistics = zeros(2,TIMESTEPS);
figure(1);
tic
for iTimestep = 1:TIMESTEPS
  if (DEBUG_MODE_ON)
    fprintf('Iteration: %d - Number of whales: %d - Number of krill: %d\n',...
      iTimestep, size(whalePopulation, 1), size(krillPopulation, 1));
  end
  
  % Movement : try to possibly move in swarms or in groups
  % Insted of random movement
  krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE);
  whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE);
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
    AREA_SIZE);
  
  %Breeding
  whalePopulation = WhaleBreeding(whalePopulation,Whale_breed_Score,AREA_SIZE);
  krillPopulation = KrillBreeding(krillPopulation,KRILL_REPRODUCTION_RATE,AREA_SIZE);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation, STARVATION_RATE, MIN_FOOD_SURVIVAL);
  
  %Fishing (To be added)
  
  %Animation
  if (DEBUG_MODE_ON)
    DrawPopulations(whalePopulation, krillPopulation, AREA_SIZE);
  end
end
toc