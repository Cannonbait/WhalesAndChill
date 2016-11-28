function whalePopulation = WhaleStarvation(whalePopulation,TIMESTEPS,t,Starvation_Value,Interval)
%Check for whales with low score at an interval of 50 timespteps
%if the score is <= starvation value the whale is removed

Int = Interval : Interval : TIMESTEPS;
if ismember(t,Int)
    Remove = whalePopulation(:,3)>=Starvation_Value;
    [x] = find(whalePopulation(:,1).*Remove);
    whalePopulation = whalePopulation(x,:);
end

end