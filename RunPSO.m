%% Initialize variable
nParticles = 40;
nVariables = 2;
nTrials = 100;
deltaT = 1;
xMin = -5;
xMax = 5;
vMax = 5;
alpha = 1.0;
c1 = 2;
c2 = 2;
wInitial = 1.4;
wMin = 0.3;
beta = 0.9; % factor with which w decreses each iteration

X = InitializePositions(nParticles,nVariables,xMax,xMin);
V = InitializeVelocities(nParticles,nVariables,xMax,xMin,alpha,deltaT);

% x y f(x,y) +10^5 because the best is finding min
xParticleBest = zeros(nParticles,nVariables+1)+10^5;
xSwarmBest = zeros(1,nVariables+1)+10^5;

w = wInitial;

%% Evaluate 
for i = 1:nTrials
    particlesScore = EvaluateParticles(X,nParticles);
    for n = 1:nParticles
        if particlesScore(n) < xSwarmBest(3)
            xSwarmBest(1:2) = X(n,:);
            xSwarmBest(3) = particlesScore(n);
        end
        if particlesScore(n) < xParticleBest(n,3)
            xParticleBest(n,1:2) = X(n,:);
            xParticleBest(n,3) = particlesScore(n);
        end
    end

    V = UpdateVelocities(V,X,xParticleBest,xSwarmBest,c1,c2,deltaT,w,vMax);
    X = UpdatePositions(V,X,deltaT);
    w = UpdateInertiaWeight(w, wMin, beta);
    
end

xParticleBest
xSwarmBest

