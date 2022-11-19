[X,Y] = meshgrid(-5:0.005:5);
a = 0.01;
Z = (X.^2+Y-11).^2 + (X+Y.^2-7).^2;
Z = log(a + Z);
contour3(X,Y,Z,100)