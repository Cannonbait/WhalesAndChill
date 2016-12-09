function New_Angle = Angular_Search(Angle,x1,y1,krillPopulation,Whale_SearchLength)
Search_range = Angle-90 : 10 : Angle +90;
for i = 1 : length(Search_range)
  Radius = Whale_SearchLength;
  x2 = x1 + Radius*cosd(Search_range(i));
  y2 = y1 + Radius*sind(Search_range(i));
  % out of bounds error
  Pos = [];
  Pos(:,1) = linspace(x1,x2,Whale_SearchLength+1);
  Pos(:,2) = linspace(y1,y2,Whale_SearchLength+1);
  Pos1 = Pos(:,1)>0.5&Pos(:,1)<100;
  Pos2 = Pos(:,2)>0.5&Pos(:,2)<100;
  Pos_Store = Pos.*Pos1.*Pos2;
  Pos = Pos_Store(Pos_Store>0);
  Pos = round(reshape(Pos,length(Pos)/2,2));
  A = zeros(size(krillPopulation));
  for j = 1: size(Pos,1)
    A(Pos(j,1),Pos(j,2)) = 1;
  end
  density(i) = length(find(A&krillPopulation == 1));
end
% Turning whale to the new direction considering density

New_Angle = Search_range(density==max(density));
New_Angle = New_Angle(randi(numel(New_Angle)));
end


