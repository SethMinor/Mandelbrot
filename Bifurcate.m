clear, clc, clf;

% the map
f =@(x,c) x^2 + c;

% k = num iterations
K = 65;

% initial condition
x0 = rand;

% number of c-values tested
M1 = 10000;
M2 = 600;

% range of parameter values
C1 = linspace(-2.4,-0.5,M1);
C2 = linspace(-0.5,1.2,M2);

figure (1)
xlim([-2.4 1.2])
ylim([-2.25 2.25])
set(gca,'Color','k')
xticks(-2.4:0.2:1.2)
yticks(-2.25:1:2.25)
title('Birfurcation diagram of the real-valued map $x_{n+1}={x_n}^2+c$',...
    'interpreter','latex')
hold on

% iterate over all parameter values
for i = 1:M1
    c = C1(i);
    
    % introduce a small amount of randomness
    K = K + randi([0 5]);

    for k = 1:K
        if k==1
            xn = x0;
        elseif k~=1
            xn = f(xn,c);
        end
    end

    plot(c,xn,'.w','MarkerSize',1)
    hold on
end
for i = 1:M2
    c = C2(i);
    
    % introduce a small amount of randomness
    K = K + randi([0 5]);

    for k = 1:K
        if k==1
            xn = x0;
        elseif k~=1
            xn = f(xn,c);
        end
    end

    plot(c,xn,'.w','MarkerSize',0.5)
    hold on
end

