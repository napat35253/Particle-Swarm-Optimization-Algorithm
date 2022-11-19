function V = UpdateVelocities(V,X,xParticleBest,xSwarmBest,c1,c2,deltaT,w,vMax)
    
    for eachParticle = 1:size(V,1)
        term1 = c1*rand()*(xParticleBest(eachParticle,1:2)-X(eachParticle,:))/deltaT;
        term2 = c2*rand()*(xSwarmBest(1:2)-X(eachParticle,:))/deltaT;
        V(eachParticle,:) = w*V(eachParticle,:) + term1 + term2;
        
        % restrict Velocities
        for j = 1:size(V,2)
            if V(eachParticle,j) > vMax 
                V(eachParticle,j) = vMax;
            elseif V(eachParticle,j) <  -vMax
                V(eachParticle,j) = -vMax;
            end
        end
    end

end

