% Ryan Lindsay
% 101038101

nx = 50; 
ny = 55; 
G = sparse(nx*ny,nx*ny);         
    
for i = 1:nx
    for j = 1:ny
        n = j+(i-1)*ny;
        if i == 1 || j == 1|| i == nx || j == ny
            G(n,n) = 1;
        else
            
            
        n = j+(i-1)*ny;
        nxm = j+(i-2)*ny;
        nxp = j+i*ny;
        nym = (j-1)+(i-1)*ny;
        nyp = (j+1)+(i-1)*ny;
        
        G(n,n) = -4;
        G(n,nxm) = 1;
        G(n,nxp) = 1;
        G(n,nym) = 1;
        G(n,nyp) = 1;
    
    
        end
    end
end

figure(1)
spy(G)
title ('Spy Plot of G values')
[E,D] = eigs(-G,9,'SM');


figure(2)
eigenV = diag(D);
plot(eigenV)
title ('Eigenvalues')
eigenF = zeros(nx,ny,9);

for i = 1:nx
    for j = 1:ny
        n = j +(i-1)*ny;
        eigenF(i,j,:) = E(n,:);
    end
end

for i = 1:9
    figure(i+2)
    surf(eigenF(:,:,i))
end