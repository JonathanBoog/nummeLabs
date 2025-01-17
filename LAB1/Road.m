
g = @ ( x ) ( - x ^3 -3) /4; % Anonym funktion for g ( x )

xold = 0; % startgissning
tol = 1e-10; % given tolerans
diff = 1; % initiera
it = 0; % starta raknare
maxiter = 100; % Maximalt antal iter

while diff > tol && it < maxiter
it = it + 1; % rakna antal iterationer
x = g ( xold ) ; % fixpunkt -> x_n +1
diff = abs (x - xold ) ; % | x_n +1 - x_n |
xold = x ; % uppdatera xold
disp ([ it x diff ])
end
