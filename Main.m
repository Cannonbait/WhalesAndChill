clc
clear;close all;
NUMBER_WHALES = 100;
NUMBER_KRILLS = 1000;
AREA_SIZE = 100;

WHALE_MOVEMENT_RATE = 5;
KRILL_MOVEMENT_RATE = 2;
Whale_breed_Score = 50;
krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE);

TIMESTEPS = 100;

statistics = zeros(2,TIMESTEPS);
t = 1;
for iTimestep = 1:TIMESTEPS
  % Movement
  krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE,AREA_SIZE);
  whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE);
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
  AREA_SIZE,NUMBER_KRILLS,NUMBER_WHALES);
  
  %Breeding
  whalePopulation = WhaleBreeding(whalePopulation,Whale_breed_Score,GRID_SIZE);
  krillPopulation = KrillBreeding(krillPopulation);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation,TIMESTEPS,t,Starvation_Value,Interval);
  
  t = t + 1;
end
  