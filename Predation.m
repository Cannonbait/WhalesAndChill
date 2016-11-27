function [krillPopulation,whalePopulation] = Predation(krillPopulation, whalePopulation,AREA_SIZE,NUMBER_KRILLS,NUMBER_WHALES)

WhalePos = zeros(AREA_SIZE);
for i = 1:NUMBER_WHALES
WhalePos(whalePopulation(i,1),whalePopulation(i,2)) = 1;
end

KrillPos = zeros(AREA_SIZE);
for i = 1:NUMBER_KRILLS
KrillPos(krillPopulation(i,1),krillPopulation(i,2)) = 1;
end
%remove Krill
[Pos(:,1),Pos(:,2)] = find(KrillPos & WhalePos == 1);
for i = 1:length(Pos)
indx1(:,i) = (Pos(i,1)==krillPopulation(:,1))&(Pos(i,2)==krillPopulation(:,2));
end
[x] = find(krillPopulation(:,1).*(sum(indx1,2)==0));
krillPopulation = krillPopulation(x,:);
%whale score
for i = 1:length(Pos)
indx2(:,i) = (Pos(i,1)==whalePopulation(:,1))&(Pos(i,2)==whalePopulation(:,2));
end
whalePopulation(:,3) = whalePopulation(:,3) + (sum(indx2,2)==1);

end