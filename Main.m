NUMBER_WHALES = 100;
NUMBER_KRILLS = 1000;
AREA_SIZE = 100;

WHALE_MOVEMENT_RATE = 5;
KRILL_MOVEMENT_RATE = 2;

krillPopulation = InitializeKrill(NUMBER_KRILLS, AREA_SIZE);
whalePopulation = InitializeWhales(NUMBER_WHALES, AREA_SIZE);

TIMESTEPS = 100;

statistics = zeros(2,TIMESTEPS);

for iTimestep = 1:TIMESTEPS
  % Movement
  krillPopulation = MoveKrill(krillPopulation, KRILL_MOVEMENT_RATE,AREA_SIZE);
  whalePopulation = MoveWhales(whalePopulation,WHALE_MOVEMENT_RATE,AREA_SIZE);
  
  %Predation
  [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation);
  
  %Breeding
  whalePopulation = WhaleBreeding(whalePopulation);
  krillPopulation = KrillBreeding(krillPopulation);
  
  %Starvation
  whalePopulation = WhaleStarvation(whalePopulation);
  
end
  