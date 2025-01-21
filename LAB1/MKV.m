% Använder minsta kvadratmetoden

% Ladda data
load STHLMTEMP

% Ta ut en tusendel av data med steg
medelTemp = Tdm; % Reducerad medeltemperatur
t = (1:length(Tdm))'; % Reducerad tidsvektor

% Modell
k = 2*pi/365; % Period för modellen
T1 = @(c, t) c(1) + c(2)*sin(k*t) + c(3)*cos(k*t) + c(4)*sin(2*k*t) + c(5)*cos(2*k*t);

% a)
% Matrisen A
A = [ones(size(t)) sin(k*t) cos(k*t) sin(2*k*t) cos(2*k*t)];

% Lös det linjära systemet med minsta kvadratmetoden (Normalekvationerna)
c = A \ medelTemp; % Lös för koefficienterna

%Skriv ut koefficienterna
fprintf("Koefficienterna c: \n")
for i = 1:length(c)
    fprintf('c(%d) = %.8f\n', i, c(i));
end

% Temperaturerna enligt modellen
T1new = T1(c,t);

% Reducera datapunkter för plotting
plot_step = 10; % Stegstorlek för att plocka ut färre datapunkter
t_reduced = t(1:plot_step:end); % Reducerad tidsvektor
medelTemp_reduced = medelTemp(1:plot_step:end); % Reducerad temperatur

%Plotta modell temperaturen mot faktisk data
figure;
plot(t,T1new, 'b-'), hold on
plot(t_reduced, medelTemp_reduced, '.') % Datapunkter
legend('Modell', 'Datapunkter')
xlabel('t (tid i dygn)')
ylabel('T (Temperatur i grader)')
title('1 a)')


% b) Beräkna minsta kvadratsumman (norm(r)^2)

r = T1new - medelTemp; % Residualen
minstaKvadratSum = norm(r)^2 %

figure;
plot(t, r)
legend('Graf')
xlabel('t (tid i dygn)')
ylabel('r (Residualen)')
title('1 b) temperatur skillnad mellan faktisk data och en modell')

% c) Utökad modell för temperatur

%Modell
k = 2*pi/365; % Period för modellen
T2 = @(a,t) a(1) + a(2)*t + a(3)*t.^2 + a(4)*sin(k*t) + a(5)*cos(k*t) + a(6)*sin(2*k*t) + a(7)*cos(2*k*t);

% Matris
A = [ones(size(t)) t t.^2 sin(k*t) cos(k*t) sin(2*k*t) cos(2*k*t)];

% Lös för koefficienterna a
a = A\medelTemp;

% Skriv ut koefficienterna
fprintf("Koefficienterna a: \n")
for i = 1:length(a)
    fprintf('a(%d) = %.4f\n', i, a(i));
end

T2new = T2(a,t);

% Reducera datapunkter för plotting
plot_step = 10; % Stegstorlek för att plocka ut färre datapunkter
t_reduced = t(1:plot_step:end); % Reducerad tidsvektor
medelTemp_reduced = medelTemp(1:plot_step:end); % Reducerad temperatur

%Plotta nya utökade modell temperaturen mot faktisk data
figure;
plot(t,T2new, 'b-'), hold on
plot(t_reduced, medelTemp_reduced, '.') % Datapunkter
legend('Modell', 'Datapunkter')
xlabel('t (tid i dygn)')
ylabel('T (Temperatur i grader)')
title('1 c)')


% d)
r2 = T2new - medelTemp; % Residualen
minstaKvadratSum2 = norm(r2)^2 %

figure;
plot(t, r2)
legend('Graf')
xlabel('t (tid i dygn)')
ylabel('r (Residualen)')
title('1 d) temperatur skillnad mellan faktisk data och utökad modell')

%Svar på fråga:
% Man kan se en liten skillnad längst till höger i graferna.
% Residualen är en aning mer negativ i den utökade modellen.

% e)
%Svar på fråga:
% Från mitten i den anpassade modellen (2) börjar den öka en aning, en
% långsiktig ökning då. Från start till ungefär slutet av 1800-talet
% minskade temperaturen en aning, efter det har varit en stabil ökning.
% Inga tydligt plötsliga förändringar.