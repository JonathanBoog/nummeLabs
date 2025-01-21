% y är förskjutningen från jämviktsläget (y=0) och t är tiden
y = @(t) 8*exp(-t/2).*cos(3*t); % använd punkt när det är multiplikation mellan två t %%%%
yp = @(t) exp(-t/2).*(-4*cos(3*t)-24*sin(3*t)); % Derivata för y %%%%


% a)

H = 0.5;%%%%%%

% Funktioner
f = @(t) y(t) - H; % y(t) - H = 0 
fp = @(t) yp(t);

%{
% Ta fram ett gissningsvärde
t = 0:0.1:10; % Test värden för att få gissningsvärde
figure;
plot(t,f(t))
legend('Graf')
xlabel('t')
ylabel('längd')
%}

% Parametrar för Newtons metod
tol = 1e-8; % Tolerans %%%%%%
xOld = 4.5; % Startvärde från gissning %%%%%%

% No touchy
iter = 0; % Iterations start
maxiter = 100; % Max iter
diffr = abs(tol)+1;

% Newtons metod
while diffr > tol && iter < maxiter
    iter = iter + 1;          % Öka iterationsräknaren
    xNew = xOld - f(xOld)/fp(xOld); % Uppdatera radien
    diffr = abs(xNew - xOld);   % Beräkna skillnaden
    xOld = xNew;                % Uppdatera radien
    % Debug-utskrift
    fprintf('Iteration %d: r = %.10f, diff = %.10f\n', iter, xNew, diffr);
end

% Spara resultatet
domain = round(xOld, 4); % Avrunda till 4 decimaler
fprintf('\nDet sökta värdet är %.4f meter.\n', domain);

% Kontroll av volymen med beräknad radie
kontrollVarde = y(xOld);
fprintf('Kontrollerat värde: %.10f (ska vara %.10f)\n', kontrollVarde, H);

% Svar för a)
% Vi använde värdet 4.5
% Antalet iterationer blev 3 st.


% b)