function positions = InitializePositions(nParticles,nVariables,xMax,xMin)
    positions = zeros(nParticles,nVariables);
    for i = 1:nParticles
        for j = 1:nVariables
            positions(i,j) = xMin + rand()*(xMax-xMin);
        end
    end
end

