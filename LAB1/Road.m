<<<<<<< HEAD
% a)
% Data
P1A = [175 950]; P1B = [160 1008];
L1A = 60; L1B = 45;

P2A = [410 2400]; P2B = [381 2500];
L2A = 75; L2B = 88;

P3A = [675 1730]; P3B = [656 1760]; 
L3A = 42; L3B = 57;


f1 = @(x,y) (x-P1A(1)).^2 + (y -P1A(2)).^2 - L1A^2;
g1 = @(x,y) (x-P1B(1)).^2 + (y -P1B(2)).^2 - L1B^2;
F1 = @(x,y) [f1(x,y);g1(x,y)];
J1 = @(x,y) [2*(x-P1A(1)) 2*(y -P1A(2)); 2*(x-P1B(1)) 2*(y -P1B(2))];

f2 = @(x,y) (x-P2A(1)).^2 + (y -P2A(2)).^2 - L2A^2;
g2 = @(x,y) (x-P2B(1)).^2 + (y -P2B(2)).^2 - L2B^2;
F2 = @(x,y) [f2(x,y);g2(x,y)];
J2 = @(x,y) [2*(x-P2A(1)) 2*(y -P2A(2)); 2*(x-P2B(1)) 2*(y -P2B(2))];

f3 = @(x,y) (x-P3A(1)).^2 + (y -P3A(2)).^2 - L3A^2;
g3 = @(x,y) (x-P3B(1)).^2 + (y -P3B(2)).^2 - L3B^2;
F3 = @(x,y) [f3(x,y);g3(x,y)];
J3 = @(x,y) [2*(x-P3A(1)) 2*(y -P3A(2)); 2*(x-P3B(1)) 2*(y -P3B(2))];



% Plot av gissning finns LÄNGST NER

% 1)
x=204; y=1003; % Startgissning

tol=1e-11; hnorm = 1; iter = 0;


while hnorm > tol && iter < 20
   iter = iter + 1;
   h = -J1(x,y)\F1(x,y);
   x = x + h(1); y = y + h(2);
   hnorm = norm(h);
   fprintf('Iteration %d: x = %.10f, y = %.10f hnorm = %.10f \n', iter, x, y, hnorm);
end
   fprintf("P1 %f %f \n\n", x, y);
   % När Newton är klar, lagra resultatet i radvektorerna 
    P1 = [x, y];
  

x=450; y=2450; % Startgissning

tol=1e-11; hnorm = 1; iter = 0;

% 2
while hnorm > tol && iter < 20
   iter = iter + 1;
   h = -J2(x,y)\F2(x,y);
   x = x + h(1); y = y + h(2);
   hnorm = norm(h);
   fprintf('Iteration %d: x = %.10f, y = %.10f hnorm = %.10f \n', iter, x, y, hnorm);
end
   fprintf("P2 %f %f \n\n", x, y);
   % När Newton är klar, lagra resultatet i radvektorerna 
   P2 = [x,y];
%3
x=700; y=1750; % Startgissning

tol=1e-11; hnorm = 1; iter = 0;


while hnorm > tol && iter < 20
   iter = iter + 1;
   h = -J3(x,y)\F3(x,y);
   x = x + h(1); y = y + h(2);
   hnorm = norm(h);
   fprintf('Iteration %d: x = %.10f, y = %.10f hnorm = %.10f \n', iter, x, y, hnorm);
end
   fprintf("P3 %f %f \n\n", x, y);
    P3 = [x,y];


   fprintf("P1: x = %.10f, y = %.10f \n", P1(1), P1(2));
   fprintf("P2: x = %.10f, y = %.10f \n", P2(1), P2(2));
   fprintf("P3: x = %.10f, y = %.10f\n", P3(1), P3(2));
%b)

P0 = [0,0];
P1 = P1;
P2 = P2;
P3 = P3;
P4 = [1020,0];

% Alla y värden:
x = [P0(1), P1(1), P2(1), P3(1), P4(1)]';
y = [P0(2) P1(2) P2(2) P3(2) P4(2)]';


% Newtons ansats för interpolation
p = @(a,x) a(1) + a(2)*(x-P0(1)) + a(3)*(x-P0(1)).*(x-P1(1)) + a(4)*(x-P0(1)).*(x-P1(1)).*(x-P2(1))+ a(5)*(x-P0(1)).*(x-P1(1)).*(x-P2(1)).*(x-P3(1)) ;

A = [ones(size(x)) (x-P0(1)) (x-P0(1)).*(x-P1(1)) (x-P0(1)).*(x-P1(1)).*(x-P2(1)) (x-P0(1)).*(x-P1(1)).*(x-P2(1)).*(x-P3(1))];

% Rita graf
a = A\y;

% Skriv ut koefficienterna
fprintf("Koefficienterna a: \n")
for i = 1:length(a)
    fprintf('a(%d) = %.4f\n', i, a(i));
end

% Begränsningen för grafen
roadX = 0:1020;

%Plotta graf
plot(roadX, p(a,roadX), 'b-'), hold on
plot(x,y,'o');
legend("väg", "datapunkter");
xlabel('x');
ylabel('y');
title('Fjärdegradspolynom genom interpolationspunkterna');
grid on;

% Koefficienterna blir





%{
%Plotta för att hitta gissningar till % a)
circle(P1A(1),P1A(2), L1A);
circle(P1B(1),P1B(2), L1B);

circle(P2A(1),P2A(2), L2A);
circle(P2B(1),P2B(2), L2B);

circle(P3A(1),P3A(2), L3A);
circle(P3B(1),P3B(2), L3B);
function h = circle(x,y,r)
    hold on
    th = 0:pi/50:2*pi;
    xunit = r*cos*(th) + x;
    yunit = r*sin(th) + y;
    h = plot(xunit, yunit);
end
%}
=======
% HEJ
>>>>>>> 3088ee58794787aa224215bb39bef448662f1b1a
