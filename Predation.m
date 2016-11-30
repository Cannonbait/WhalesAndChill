function [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,AREA_SIZE)
  WhalePos = zeros(AREA_SIZE);
  for i = 1:size(whalePopulation,1)
    WhalePos(whalePopulation(i,1),whalePopulation(i,2)) = 1;
  end

  KrillPos = zeros(AREA_SIZE);
  for i = 1:size(krillPopulation,1)
    KrillPos(krillPopulation(i,1),krillPopulation(i,2)) = 1;
  end
  %Remove Krill
  [Pos(:,1),Pos(:,2)] = find(KrillPos & WhalePos == 1);
  for i = 1:size(Pos,1)
    indx1(:,i) = (Pos(i,1)==krillPopulation(:,1))&(Pos(i,2)==krillPopulation(:,2));
  end
  if size(Pos,1)>0
    [x] = find(krillPopulation(:,1).*(sum(indx1,2)==0));
    krillPopulation = krillPopulation(x,:);
    %Whale score
    for i = 1:size(Pos,1)
      indx2(:,i) = (Pos(i,1)==whalePopulation(:,1))&(Pos(i,2)==whalePopulation(:,2));
    end
    whalePopulation(:,3) = whalePopulation(:,3) + (sum(indx2,2)==1);
  end
end