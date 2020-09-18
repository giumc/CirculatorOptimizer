clc
clear all
close all


h=0.008*0.0254; %thickness in meters
eps_r=3.6; %relative dielectric constant
eps_0=8.85e-12;

%capacitances
cp=@(eps_r,W,H) eps_0*eps_r*W/H;


