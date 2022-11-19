function particles = EvaluateParticles(X,nParticles)
    particles = zeros(nParticles,1);
    for k = 1:nParticles
        x = X(k,1);
        y = X(k,2);
        particles(k) = (x^2+y-11)^2 + (x+y^2-7)^2 ;
    end
end

