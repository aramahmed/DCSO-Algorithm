function [Best_score,Best_pos,Xpl,Xpt]=DCSO(N,MaxIter,lb,ub,dim,fobj);

% parameter setting
CDC=0.8;
SMP = 5;
c = 2.05;
wMax = 0.9;
wMin = 0.4;
w = linspace(wMax, wMin, MaxIter);

%% Initialization   
VarSize=[1 dim];   % Size of Decision Variables Matrix
empty_particle.Position=[];
empty_particle.Velocity=[];
empty_particle.Cost=[];
empty_particle.best=[];
empty_particle.seek=[];
empty_particle.trace=[];
allPart=[];
pop=repmat(empty_particle,N,1);
for i=1:N
    pop(i).Position=unifrnd(lb,ub,VarSize);  
    pop(i).Velocity=zeros(VarSize);
    pop(i).Cost=fobj(pop(i).Position);  
end
[x,idx]=min([pop.Cost]);
g_best.Position=pop(idx).Position;
oldMinFitval=x;
[fmin0,index]=sort([pop.Cost]);
 ratio=MaxIter./N;
for k=1:MaxIter
    TCN =floor(k./ratio);
    if TCN<2
       TCN=2;
    end 
    SCN=N-TCN;
    
%%% SEEKING MODE %%%
if SCN ~= 0;         
for i=1:SCN
    seek_index=index(i);
    skmCats_smpC = repmat( pop(seek_index).Position, SMP, 1 );   
    for iSz = 1:size(skmCats_smpC,1)
    tmpVec = skmCats_smpC(iSz,:);
    numOfdimsTobeChanged = round( CDC*size(skmCats_smpC,2) );
    dimsInx = randperm( size(skmCats_smpC,2), numOfdimsTobeChanged);
    tmpDims = tmpVec(dimsInx);
    changed_tmpDims_posT = (1+rand)*tmpDims;
    changed_tmpDims_negT = (1-rand)*tmpDims;
    if rand>rand
            changed_selDims = changed_tmpDims_posT;
    else
        changed_selDims = changed_tmpDims_negT;
    end
    up_tmpVec = tmpVec;
    up_tmpVec(dimsInx) = changed_selDims;
    skmCats_smpC_up(iSz,:) = up_tmpVec;
    end
    v=size(skmCats_smpC_up,1);
    for i=1:v
        fT(i,1)=fobj(skmCats_smpC_up(i,:));
    end
    minInx = find(min(fT)==fT);
    if length(minInx) == 1
       tempM = skmCats_smpC_up(minInx,:);
    else
       rndMinInx = randi([1 length(minInx)],1,1);
       newMinInx = minInx(rndMinInx);
       tempM = skmCats_smpC_up(newMinInx,:);
    end
    pop(seek_index).Position=tempM;
end
end
 
%  %%% TRACING MODE %%%
for j=1:TCN
    trace_index=[];
    trace_index=index(j+SCN);
    pop(trace_index).Velocity = w(k).* pop(trace_index).Velocity + c*rand().*(g_best.Position - pop(trace_index).Position);
    pop(trace_index).Position = pop(trace_index).Position + pop(trace_index).Velocity;     
end

for i=1:N
   pop(i).Position = max(pop(i).Position, lb);
   pop(i).Position = min(pop(i).Position, ub);
   pop(i).Cost = fobj(pop(i).Position); 
end
   [x,idx]=min([pop.Cost]);
   newMinFitval=x;
   if newMinFitval < oldMinFitval
   g_best.Position=pop(idx).Position;
   oldMinFitval = newMinFitval;
   fitnessVal(k,1) = newMinFitval;
   else
   fitnessVal(k,1) = oldMinFitval;
        % do nothing
   end    
   [fmin0,index]=sort([pop.Cost]);
       
% Normalize particle position values
for i=1:N
    for j=1:dim
    pTemp(i,j) =(pop(i).Position(j));
    pTemp2(i,j)=(pop(i).Position(j));
    end
end
      
for j=1:dim
    for i=1:N
    pTemp2(i,j)=pTemp(i,j)+abs(min(pTemp(:,j)));
    end      
    if max(pTemp2(:,j))>0
    pTemp2(:,j)=pTemp2(:,j)/max(pTemp2(:,j));          
    else
    pTemp2(:,j)=0;
    end
end
    for i=1:N
% Population diversity of swarm individuals
    med=0;
    for j=1:dim
    med= med + abs(median(pTemp2(:,j))-pTemp2(i,j));
    end
    allPart(k,i)=med/dim;
    end            
% Population diversity as a whole
    temp=[];
for j=1:dim
    temp(j)=mean(abs(pTemp2(:,j)-mean(pTemp2(:,j))));           
end
    Div(k)= sum(temp)/N;
end
Xpl = mean((Div/max(Div))*100);
Xpt =mean((abs((Div-max(Div)))/max(Div))*100);
showX = ['Exploration: ', num2str(Xpl), ', Exploitation: ', num2str(Xpt)];
disp(showX)    

Best_pos=g_best.Position;
Best_score=min(fitnessVal)
end
