close all
clear all
clc

%% read the image with hand-written characters
pavadinimas = 'train_data.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 8);

%% Development of character recognizer
P = cell2mat(pozymiai_tinklo_mokymui);
T = [eye(8), eye(8), eye(8), eye(8), eye(8), eye(8), eye(8), eye(8)];
tinklas = newrb(P,T,0,1,13);

%% Extract features of the test image
pavadinimas = 'test.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Perform letter/symbol recognition
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% estimating neural network output for newly estimated features
Y2 = sim(tinklas, P2);
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'E'];
        case 3
            atsakymas = [atsakymas, 'I'];
        case 4
            atsakymas = [atsakymas, 'S'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'M'];
        case 7
            atsakymas = [atsakymas, 'K'];
        case 8
            atsakymas = [atsakymas, 'O'];
    end
end

figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off


