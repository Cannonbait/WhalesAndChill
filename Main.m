
clear;
clc;
close all;
DEBUG_MODE_ON = 1; % Set this to 0 to stop plots and print outs during simulation
NUMBER_WHALES = 10;
NUMBER_KRILLS = 10000;
AREA_SIZE = 100;

KRILL_REPRODUCTION_RATE = 0.1;
STARVATION_RATE = 10;
INITIAL_FULLNESS = 60;
MIN_FOOD_SURVIVAL = 5;
WHALE_BREED_REQUIREMENT = 80;

krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE, INITIAL_FULLNESS);

TIMESTEPS = 1000;

numWhales = zeros(TIMESTEPS, 1);
numKrills = zeros(TIMESTEPS, 1);

tic
for iTimestep = 1:TIMESTEPS
  
  numWhales(iTimestep) = sum(whalePopulation(:) > 0);
  numKrills(iTimestep) = sum(krillPopulation(:) > 0);
  
  if (DEBUG_MODE_ON)
    fprintf('Iteration: %d - Number of whales: %d - Number of krill: %d\n',...
      iTimestep, numKrills(iTimestep), numKrills(iTimestep));
  end
  
  % Movement : try to possibly move in swarms or in groups
  % Insted of random movement
  krillPopulation = MoveKrill(krillPopulation);
  whalePopulation = MoveWhales(whalePopulation);
  
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
    AREA_SIZE);
  
  %Breeding
  whalePopulation = BreedingWhale(whalePopulation, WHALE_BREED_REQUIREMENT, AREA_SIZE, INITIAL_FULLNESS);
  krillPopulation = BreedingKrill(krillPopulation, KRILL_REPRODUCTION_RATE);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation, STARVATION_RATE, MIN_FOOD_SURVIVAL);
  
  %Fishing (To be added)
  
  %Animation
  if (DEBUG_MODE_ON)
    DrawPopulations(whalePopulation, krillPopulation);
  end
end
toc