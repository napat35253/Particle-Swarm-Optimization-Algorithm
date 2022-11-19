function velocities = InitializeVelocities(nParticles,nVariables,xMax,xMin,alpha,deltaT)
    velocities = zeros(nParticles,nVariables);
    for i = 1:nParticles
        for j = 1:nVariables
            velocities(i,j) = (alpha/deltaT)*(-((xMax-xMin)/2))+rand()*(xMax-xMin);
        end
    end
end

