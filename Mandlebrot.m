clear, clc, clf;

% define the map
f =@(z,a,b) z^2 + (a+b*i);

% numpoints = square dimension of grid
numpoints = 200;

% N = number of stability-checking iterations
N = 50;

a_axis = linspace(-2.4,1.2,numpoints);
b_axis = linspace(-1.5,1.5,numpoints);

z0 = 0 + 0*i;

figure(1)
xlim([-2.4 1.2])
ylim([-1.5 1.5])
title('Boundary of stability in the $(a,b)$ parameter-space',...
    'interpreter','latex')
hold on

% main for loops
for i=1:length(a_axis)
    a = a_axis(i);
    for j=1:length(b_axis)
        b = b_axis(j);
        fprintf('(a,b)=(%f,%f)\n',a,b)
        % iterate the map
        for n=1:N
            if n==1
                zn = z0;
            else
                zn = f(zn,a,b);
            end
            % check for boundedness
            if abs(zn) > 4
                % unbounded orbit
                fprintf('unbounded on iteration %f\n',n)
                E = mod(n,2);
                if E == 0
                    plot(a,b,'.k','MarkerSize',1)
                else
                    plot(a,b,'.w')
                end
                hold on
                break;
            end
            if (abs(zn) <= 4) && (n==N)
               fprintf('bounded orbit\n')
               plot(a,b,'.k','MarkerSize',1)
               hold on
            end
        end % end of iteration
    end % end of column iteration
end % end of row iteration
