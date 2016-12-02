clear;
clc;
close all;
DEBUG_MODE_ON = 0; % Set this to 0 to stop plots and print outs during simulation
NUMBER_WHALES = 146;
NUMBER_KRILLS = 2001;
AREA_SIZE = 100;

KRILL_CARRYING_CAPACITY = AREA_SIZE^2;
KRILL_REPRODUCTION_RATE = 1/(AREA_SIZE);
FULLNESS_INCREASE_WHALES = 10;
BREEDING_CYCLE = 365;
BREEDING_PROBABILITY = 1/BREEDING_CYCLE;
STARVATION_RATE = 1;
INITIAL_FULLNESS = 100;
MIN_FOOD_SURVIVAL = 0;
WHALE_BREED_REQUIREMENT = 800;
WHALE_MAX_FULLNESS = 1200;
POST_BREED_FULLNESS = 200;

krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE, INITIAL_FULLNESS);

TIMESTEPS = 100000;

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
    FULLNESS_INCREASE_WHALES, WHALE_MAX_FULLNESS);
 
  %Breeding
%   whalePopulation = BreedingWhaleInterval(whalePopulation, WHALE_BREED_REQUIREMENT, ...
%     POST_BREED_FULLNESS, INITIAL_FULLNESS, iTimestep, BREEDING_CYCLE);
  whalePopulation = BreedingWhaleProbability(whalePopulation, WHALE_BREED_REQUIREMENT, ... 
    POST_BREED_FULLNESS, INITIAL_FULLNESS, BREEDING_PROBABILITY);
  krillPopulation = BreedingKrill(krillPopulation, KRILL_REPRODUCTION_RATE, KRILL_CARRYING_CAPACITY);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation, STARVATION_RATE, MIN_FOOD_SURVIVAL);
  
  %Fishing (To be added)
  
  %Animation
  if (DEBUG_MODE_ON)
    DrawPopulations(whalePopulation, krillPopulation);
  end
end
toc

plot(1:TIMESTEPS, numWhales, 1:TIMESTEPS, numKrills);
fprintf('Whales, min - average - max: %d - %f - %d\n',...
      min(numWhales), mean(numWhales), max(numWhales));
fprintf('Krill, min - average - max: %d - %f - %d\n',...
      min(numKrills), mean(numKrills), max(numKrills));    
    