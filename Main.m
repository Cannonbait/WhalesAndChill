clear;
clc;
close all;
DEBUG_MODE_ON = 1; % Set this to 0 to stop plots and print outs during simulation
NUMBER_WHALES = 170;
NUMBER_KRILLS = 9000;
AREA_SIZE = 100;

KRILL_REPRODUCTION_RATE = 0.01;
FULLNESS_INCREASE_WHALES = 10;
BREEDING_CYCLE = 365;
STARVATION_RATE = 1;
INITIAL_FULLNESS = 100;
MIN_FOOD_SURVIVAL = 5;
WHALE_BREED_REQUIREMENT = 800;
BREED_FULLNESS_REDUCTION = 600;

krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE, INITIAL_FULLNESS);

TIMESTEPS = 10000;

numWhales = zeros(TIMESTEPS, 1);
numKrills = zeros(TIMESTEPS, 1);

tic
for iTimestep = 1:TIMESTEPS
  
  numWhales(iTimestep) = sum(whalePopulation(:) > 0);
  numKrills(iTimestep) = sum(krillPopulation(:) > 0);
  
  if (DEBUG_MODE_ON)
    fprintf('Iteration: %d - Number of whales: %d - Number of krill: %d\n',...
      iTimestep, numWhales(iTimestep), numKrills(iTimestep));
  end
  
  % Movement : try to possibly move in swarms or in groups
  % Insted of random movement
  krillPopulation = MoveKrill(krillPopulation);
  whalePopulation = MoveWhales(whalePopulation);
  
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
    FULLNESS_INCREASE_WHALES);
  
  %Breeding
  whalePopulation = BreedingWhale(whalePopulation, WHALE_BREED_REQUIREMENT, BREED_FULLNESS_REDUCTION, INITIAL_FULLNESS, iTimestep, BREEDING_CYCLE);
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