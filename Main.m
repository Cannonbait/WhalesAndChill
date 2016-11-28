clc
clear;close all;
NUMBER_WHALES = 100;
NUMBER_KRILLS = 1000;
AREA_SIZE = 100;

WHALE_MOVEMENT_RATE = 0.5;
KRILL_MOVEMENT_RATE = 0.2;
Whale_breed_Score = 50;
New_Krills_Limit = 5;
Interval = 50;
Starvation_Value = 2;
krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE);

TIMESTEPS = 10000;

statistics = zeros(2,TIMESTEPS);
t = 1;
for iTimestep = 1:TIMESTEPS
    disp(t);
  % Movement
  krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE,AREA_SIZE);
  whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE);
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,...
                                                                 AREA_SIZE);
  
  %Breeding
  whalePopulation = WhaleBreeding(whalePopulation,Whale_breed_Score,AREA_SIZE);
  krillPopulation = KrillBreeding(krillPopulation,New_Krills_Limit,AREA_SIZE);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation,TIMESTEPS,t,Starvation_Value,Interval);
  
  t = t + 1;
end
  