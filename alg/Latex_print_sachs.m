clear;clc;
load score_sachs.mat;load error_sachs.mat;
M = [score_sachs(:,1),error_sachs(:,1),score_sachs(:,2),error_sachs(:,2),score_sachs(:,3),error_sachs(:,3)]
