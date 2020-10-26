
% email: aramahmed@kissr.edu.krd
% this code is an implementation of a research work which is submitted to a journal and it is in the process of revision
% title of the research work: Dynamic Cat Swarm Optimization Algorithm for Backboard Wiring Problem

% Disclaimer
% We appreciate the below research works as part of their codes were used
% in this software
%  https://www.sciencedirect.com/science/article/abs/pii/S0965997816300163
%  https://ieeexplore.ieee.org/document/8672851
%  https://www.mathworks.com/matlabcentral/fileexchange/67211-ann-weight-optimization-using-cat-swarm-optimization
%  https://link.springer.com/article/10.1007/s00521-018-3592-0
%________________________________________________________________

%Xpl and Xpt: will return the percentage of exploration and exploitation respectively
%Best_score = will return the fitness value of the global best solution after Max_iteration is reached.
%Best_pos = will return the position of the global best solution after Max_iteration is reached.

clear all 
close all
clc

% % in order to run the test functions please uncomment the below for loop and then write the function name 

for dd=1:1

N=30; % Number of search agents
Function_name='F18'; % Name of the test function that can be from F1 to F23 or from cec01 to cec10 (Table 1,2 in the paper)
MaxIter=500; % Maximum numbef of iterations
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);% Load details of the selected benchmark function
[Best_score,Best_pos,Xpl,Xpt]=DCSO(N,MaxIter,lb,ub,dim,fobj);% run the DCSO algorithm
end

%% in order to run the QAP datasets please uncomment the below foor loop and then write the name of the dataset such as ste36a, ste36b or ste36c

% for dd=1:1
% N=30; % Number of search agents
% MaxIter=500; % Maximum numbef of iterations
% lb=0;
% ub=1;
% dim=36;
% fobj=@ste36c; % Name of the dataset can be ste36a, ste36b, or ste36c (Table 4 in the paper)
% [Best_score,Best_pos,Xpl,Xpt]=DCSO(N,MaxIter,lb,ub,dim,fobj);
% end
        



