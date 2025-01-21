% Denna fil använder Sekantmetoden och Newtons metod




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
diff = abs(tol)+1;

newton_diff = []; %% För uppgift c) 

% Newtons metod
while diff > tol && iter < maxiter
    iter = iter + 1;          % Öka iterationsräknaren
    xNew = xOld - f(xOld)/fp(xOld); % Uppdatera radien
    diff = abs(xNew - xOld);   % Beräkna skillnaden
    xOld = xNew;                % Uppdatera radien
    newton_diff = [newton_diff, diff];
    % Debug-utskrift
    fprintf('Iteration %d: r = %.10f, diff = %.10f\n', iter, xNew, diff);
end

% Spara resultatet
domain = round(xOld, 4); % Avrunda till 4 decimaler
fprintf('\nDet sökta värdet är %.4f meter.\n\n', domain);
%{
kontrollVarde = y(xOld);
fprintf('Kontrollerat värde: %.10f (ska vara %.10f)\n', kontrollVarde, H);
%}
% Svar för a)
% Vi använde värdet 4.5
% Antalet iterationer blev 3 st.


% b)
H = 0.5;
f = @(t) y(t) - H; %% Använder tidigare funktion 

t0 = 4; t1 = 4.5;
tol = 1e-8; maxiter = 100; iter = 0;
diff = tol + 1;

sekant_diff = []; %% Uppgift c)

% Sekantmetoden
while diff > tol && iter < maxiter
    iter = iter + 1; % Öka iterationsräknaren
    temp = t1;
    t1 = t1-f(t1)*(t1-t0)/(f(t1)-f(t0)); % Uppdatera radien
    t0 = temp;
    diff = abs(t1 - t0);   % Beräkna skillnaden
    sekant_diff(end+1) = diff;
    % Debug-utskrift
    fprintf('Iteration %d: t = %.10f, diff = %.10f\n', iter, t1, diff);
end

% Spara resultatet
domain = round(t1, 4); % Avrunda till 4 decimaler
fprintf('\nDet sökta värdet är %.4f meter.\n\n', domain);

% Vilka startvärden har använts?
% 4 & 4.5
% Antalet iterationer var 4
% Det behövdes en iteration till för sekantmetoden
% Newtons konvergerar kvadratiskt medan sekantmetoden superlinjär (1.62).

% c)
n1 = 1:length(newton_diff);
n2 = 1:length(sekant_diff);

figure;
semilogy(n1,newton_diff), hold on
semilogy(n2, sekant_diff);
legend('Funktion')
xlabel('n')
ylabel('|t_{n+1} - t_n| (log-skala)');
title('hihi')





% d)
H = 2.8464405473;%%%%%%

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
xOld = 2; % Startvärde från gissning %%%%%%

% No touchy
iter = 0; % Iterations start
maxiter = 100; % Max iter
diff = abs(tol)+1;
fprintf('\nd)\n');

diffNewt = [];

% Newtons metod
while diff > tol && iter < maxiter
    iter = iter + 1;          % Öka iterationsräknaren
    xNew = xOld - f(xOld)/fp(xOld); % Uppdatera radien
    diff = abs(xNew - xOld);   % Beräkna skillnaden
    diffNewt = [diffNewt, diff];
    xOld = xNew;                % Uppdatera radien
    % Debug-utskrift
    fprintf('Iteration %d: r = %.10f, diff = %.10f\n', iter, xNew, diff);
end

% Spara resultatet
domain = round(xOld, 4); % Avrunda till 4 decimaler
fprintf('\nDet sökta värdet är %.4f meter.\n\n', domain);

kontrollVarde = y(xOld);
fprintf('Kontrollerat värde: %.10f (ska vara %.10f)\n', kontrollVarde, H);

n1 = 1:length(diffNewt);

figure;
semilogy(n1,diffNewt)
legend('Funktion')
xlabel('n')
ylabel('|t_{n+1} - t_n| (log-skala)');
title('hihi')

% Konvergenshastigheten är mycket långsammare nu än i a).
% Anledningen är eftersom nollstället ligger extremt nära en extremtpunkt,
% derivata = 0
% % Känsligheten kan ha stor påverkan iom att endast en lite decimal kan
% göra att det tar så mycket längre tid (antalet iterationer) att beräkna
% nollstället (samma anledning som för konvergenshastigheten)
