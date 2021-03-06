function out = MVCTester(data)
%Plots the values of the computed MVC for different window sizes and
%orderings

nIterRMS = 5000;
nIterMean = 1;
nIterMedian = 1;
MVCRMS = zeros(1,nIterRMS);
MVCnMean = zeros(1,nIterMean);
MVCnMedian = zeros(1,nIterMedian);
for i = 1:nIterRMS
    for j = 1:nIterMean
        for k = 1:nIterMedian
            %RMS window length
            rms = rmsFilter(data,1+2*i);
            %Method: %MVC, median RMS
            sortedRMS = sort(rms);
            %MVC = sortedRMS(end);
            MVCRMS(i) = mean(sortedRMS(end-1:end));
            %Shape choice: noone cares?
            MVCnMean(j) = mean(sortedRMS(end-j:end));
            MVCnMedian(k) = median(sortedRMS(end-k:end));
        end
    end
    %Max or best of?
end

out = MVCRMS;
figure;
plot(out);
end