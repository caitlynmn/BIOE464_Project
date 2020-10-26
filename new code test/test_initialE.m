%% BIOE464 Monte Carlo Project
clear all
clc
clf
%% Initialize Constant Parameters
N = 5;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
beta = 1./(T);       %beta in reduced units
density = 0.1:0.1:0.8;    %different densities
Nstep = 1;             %simulation steps
%% Monte Carlo Test with One Density, One Temp
rho = density(5);    %density of 0.5
b = beta(1);         %with T = 0.9
L = (N/rho)^(1/3);   %determine length of side of cubic lattice (L = 10 here)
%% Create initial particle values
initial_coords = create_coords(N,L);  %create coordinates of particles
initial_energies = compute_whole_lattice_E(initial_coords,L)   %compute energies of particles