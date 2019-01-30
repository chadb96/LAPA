    % clear all
    
    %clearvars
    %clearvars -GLOBAL
    %close all
    
    % set(0,'DefaultFigureWindowStyle','docked')
    global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²
   
    %variables
    nx=50;
    ny=50;
    maxiter=1000;
    dx= 2/(nx-1);
    dy= 2/(ny-1);
    x=0:dx:2;
    y=0:dy:2;
    %initial conditions
    V=zeros(ny,nx);
    Vprev=zeros(ny,nx);
    %boundaries
    V(:,1)=0;
    V(:,nx)=y;
    V(1,:)=V(2,:);        
    V(ny,:)=V(ny-1,:); 
    %iteration
    j=2:nx-1;
    i=2:ny-1;
    
    for i=1:maxiter
        for j=1:maxiter
            for t=1:maxiter
                Vprev=V;
                if i==1 %right
                     V(i,j)=(Vprev(i+1,j)+Vprev(i,j+1)+Vprev(i,j-1))/3;
                elseif i==0 %left
                         V(i,j)=(Vprev(i,j)+Vprev(i,j+1)+Vprev(i,j-1))/3;
                elseif j==1 %top
                             V(i,j)=(Vprev(i,j+1)+Vprev(i+1,j)+Vprev(i-1,j))/3;
                elseif j==0 %bottom
                                 V(i,j)=(Vprev(i,j)+Vprev(i+1,j)+Vprev(i-1,j))/3;
                             end
                         end
                     end
                end
    surf(x,y,V,'EdgeColor','none');
    title({'Laplace Equation by Iteration';['{\itNumber of iterations} = ',num2str(t)]})
        V(:,1)=0;
        V(:,nx)=y;
        V(1,:)=V(2,:);
        V(ny,:)=V(ny-1,:);
       
        
    
     
    