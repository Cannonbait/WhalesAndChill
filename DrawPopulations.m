function DrawPopulations(whalePopulation, krillPopulation)
  lattice = krillPopulation + 1;
  lattice(whalePopulation > 0) = 3;
  
  % Plot
 [x1,y1] = find(krillPopulation>0);
 [x2,y2] = find(whalePopulation>0);
 clf;
  plot(x2,y2,'dk', 'MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor',[0 0 0])
    hold on
  plot(x1,y1,'og', 'MarkerSize',2)
  drawnow;
end

