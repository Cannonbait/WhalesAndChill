clear;
clc;
close all;
DEBUG_MODE_ON = 0; % Set this to 0 to stop plots and print outs during simulation
NUMBER_WHALES = 50;
NUMBER_KRILLS = 1000;
NUMBER_FISHERMEN = 1;
AREA_SIZE = 100;

KRILL_CARRYING_CAPACITY = AREA_SIZE^2;
KRILL_REPRODUCTION_RATE = 1/(AREA_SIZE)*1.5;
FULLNESS_INCREASE_WHALES = 10;
WHALE_BREEDING_CYCLE = 365;
WHALE_BREEDING_PROBABILITY = 1/WHALE_BREEDING_CYCLE;
STARVATION_RATE = 2;
INITIAL_FULLNESS = 100;
MIN_FOOD_SURVIVAL = 0;
WHALE_BREED_REQUIREMENT = 200;
WHALE_MAX_FULLNESS = 400;
POST_BREED_FULLNESS = 100;


krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE, INITIAL_FULLNESS);
Theta1 = [90,90,0,-90,-90,-90,0,90];
Theta2 = [90,0,0,0,90,180,180,180];
for i = 1 : NUMBER_WHALES
Angle1(i) = Theta1(randi(numel(Theta1)));
Angle2(i) = Theta2(randi(numel(Theta2)));
end
TIMESTEPS = 10000;

numWhales = zeros(TIMESTEPS, 1);
numKrills = zeros(TIMESTEPS, 1);
 whalePopulation_old = whalePopulation;
tic
for iTimestep = 1:TIMESTEPS
  
  numWhales(iTimestep) = sum(whalePopulation(:) > 0);
  numKrills(iTimestep) = sum(krillPopulation(:) > 0);
  
  if (DEBUG_MODE_ON)
    fprintf('Iteration: %d - Number of whales: %d - Number of krill: %d\n',...
      iTimestep, numWhales(iTimestep), numKrills(iTimestep));
  end
  
  % Movement
  krillPopulation = MoveKrill(krillPopulation);
  whalePopulation = MoveWhales(whalePopulation);
  %[whalePopulation,Angle1,Angle2] = IntelligentWhales(whalePopulation,krillPopulation,whalePopulation_old,Angle1,Angle2);
  
  %Predation
  [krillPopulation,whalePopulation] = PredationWhales(krillPopulation, whalePopulation,...
    FULLNESS_INCREASE_WHALES, WHALE_MAX_FULLNESS);
  
  krillPopulation = PredationFishermen(krillPopulation, NUMBER_FISHERMEN);
  
 
  %Breeding
%   whalePopulation = BreedingWhaleInterval(whalePopulation, WHALE_BREED_REQUIREMENT, ...
%     POST_BREED_FULLNESS, INITIAL_FULLNESS, iTimestep, BREEDING_CYCLE);
  whalePopulation = BreedingWhaleProbability(whalePopulation, WHALE_BREED_REQUIREMENT, ... 
    POST_BREED_FULLNESS, INITIAL_FULLNESS, WHALE_BREEDING_PROBABILITY);
  krillPopulation = BreedingKrill(krillPopulation, KRILL_REPRODUCTION_RATE, KRILL_CARRYING_CAPACITY);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation, STARVATION_RATE, MIN_FOOD_SURVIVAL);
  whalePopulation_old = whalePopulation;
  %Fishing (To be added)
  
  %Animation
  if (DEBUG_MODE_ON)
    DrawPopulations(whalePopulation, krillPopulation);
  end
  % pause(0.1);
end
toc

plot(1:TIMESTEPS, numWhales, 1:TIMESTEPS, numKrills);
fprintf('Whales, min - average - max: %d - %f - %d\n',...
      min(numWhales), mean(numWhales), max(numWhales));
fprintf('Krill, min - average - max: %d - %f - %d\n',...
      min(numKrills), mean(numKrills), max(numKrills));    
    