function [sum, p]=ste36c(position)

  
distance=[   0 1000 2000 3000 4000 5000 6000 7000 8000 1000 1414 2236 3162 4123 5099 6082 7071 8062 2000 2236 2828 3605 4472 5385 6324 7280 8246 3000 3162 3605 4242 5000 5830 6708 7615 8544;
 1000    0 1000 2000 3000 4000 5000 6000 7000 1414 1000 1414 2236 3162 4123 5099 6082 7071 2236 2000 2236 2828 3605 4472 5385 6324 7280 3162 3000 3162 3605 4242 5000 5830 6708 7615;
 2000 1000    0 1000 2000 3000 4000 5000 6000 2236 1414 1000 1414 2236 3162 4123 5099 6082 2828 2236 2000 2236 2828 3605 4472 5385 6324 3605 3162 3000 3162 3605 4242 5000 5830 6708;
 3000 2000 1000    0 1000 2000 3000 4000 5000 3162 2236 1414 1000 1414 2236 3162 4123 5099 3605 2828 2236 2000 2236 2828 3605 4472 5385 4242 3605 3162 3000 3162 3605 4242 5000 5830;
 4000 3000 2000 1000    0 1000 2000 3000 4000 4123 3162 2236 1414 1000 1414 2236 3162 4123 4472 3605 2828 2236 2000 2236 2828 3605 4472 5000 4242 3605 3162 3000 3162 3605 4242 5000;
 5000 4000 3000 2000 1000    0 1000 2000 3000 5099 4123 3162 2236 1414 1000 1414 2236 3162 5385 4472 3605 2828 2236 2000 2236 2828 3605 5830 5000 4242 3605 3162 3000 3162 3605 4242;
 6000 5000 4000 3000 2000 1000    0 1000 2000 6082 5099 4123 3162 2236 1414 1000 1414 2236 6324 5385 4472 3605 2828 2236 2000 2236 2828 6708 5830 5000 4242 3605 3162 3000 3162 3605;
 7000 6000 5000 4000 3000 2000 1000    0 1000 7071 6082 5099 4123 3162 2236 1414 1000 1414 7280 6324 5385 4472 3605 2828 2236 2000 2236 7615 6708 5830 5000 4242 3605 3162 3000 3162;
 8000 7000 6000 5000 4000 3000 2000 1000    0 8062 7071 6082 5099 4123 3162 2236 1414 1000 8246 7280 6324 5385 4472 3605 2828 2236 2000 8544 7615 6708 5830 5000 4242 3605 3162 3000;
 1000 1414 2236 3162 4123 5099 6082 7071 8062    0 1000 2000 3000 4000 5000 6000 7000 8000 1000 1414 2236 3162 4123 5099 6082 7071 8062 2000 2236 2828 3605 4472 5385 6324 7280 8246;
 1414 1000 1414 2236 3162 4123 5099 6082 7071 1000    0 1000 2000 3000 4000 5000 6000 7000 1414 1000 1414 2236 3162 4123 5099 6082 7071 2236 2000 2236 2828 3605 4472 5385 6324 7280;
 2236 1414 1000 1414 2236 3162 4123 5099 6082 2000 1000    0 1000 2000 3000 4000 5000 6000 2236 1414 1000 1414 2236 3162 4123 5099 6082 2828 2236 2000 2236 2828 3605 4472 5385 6324;
 3162 2236 1414 1000 1414 2236 3162 4123 5099 3000 2000 1000    0 1000 2000 3000 4000 5000 3162 2236 1414 1000 1414 2236 3162 4123 5099 3605 2828 2236 2000 2236 2828 3605 4472 5385;
 4123 3162 2236 1414 1000 1414 2236 3162 4123 4000 3000 2000 1000    0 1000 2000 3000 4000 4123 3162 2236 1414 1000 1414 2236 3162 4123 4472 3605 2828 2236 2000 2236 2828 3605 4472;
 5099 4123 3162 2236 1414 1000 1414 2236 3162 5000 4000 3000 2000 1000    0 1000 2000 3000 5099 4123 3162 2236 1414 1000 1414 2236 3162 5385 4472 3605 2828 2236 2000 2236 2828 3605;
 6082 5099 4123 3162 2236 1414 1000 1414 2236 6000 5000 4000 3000 2000 1000    0 1000 2000 6082 5099 4123 3162 2236 1414 1000 1414 2236 6324 5385 4472 3605 2828 2236 2000 2236 2828;
 7071 6082 5099 4123 3162 2236 1414 1000 1414 7000 6000 5000 4000 3000 2000 1000    0 1000 7071 6082 5099 4123 3162 2236 1414 1000 1414 7280 6324 5385 4472 3605 2828 2236 2000 2236;
 8062 7071 6082 5099 4123 3162 2236 1414 1000 8000 7000 6000 5000 4000 3000 2000 1000    0 8062 7071 6082 5099 4123 3162 2236 1414 1000 8246 7280 6324 5385 4472 3605 2828 2236 2000;
 2000 2236 2828 3605 4472 5385 6324 7280 8246 1000 1414 2236 3162 4123 5099 6082 7071 8062    0 1000 2000 3000 4000 5000 6000 7000 8000 1000 1414 2236 3162 4123 5099 6082 7071 8062;
 2236 2000 2236 2828 3605 4472 5385 6324 7280 1414 1000 1414 2236 3162 4123 5099 6082 7071 1000    0 1000 2000 3000 4000 5000 6000 7000 1414 1000 1414 2236 3162 4123 5099 6082 7071;
 2828 2236 2000 2236 2828 3605 4472 5385 6324 2236 1414 1000 1414 2236 3162 4123 5099 6082 2000 1000    0 1000 2000 3000 4000 5000 6000 2236 1414 1000 1414 2236 3162 4123 5099 6082;
 3605 2828 2236 2000 2236 2828 3605 4472 5385 3162 2236 1414 1000 1414 2236 3162 4123 5099 3000 2000 1000    0 1000 2000 3000 4000 5000 3162 2236 1414 1000 1414 2236 3162 4123 5099;
 4472 3605 2828 2236 2000 2236 2828 3605 4472 4123 3162 2236 1414 1000 1414 2236 3162 4123 4000 3000 2000 1000    0 1000 2000 3000 4000 4123 3162 2236 1414 1000 1414 2236 3162 4123;
 5385 4472 3605 2828 2236 2000 2236 2828 3605 5099 4123 3162 2236 1414 1000 1414 2236 3162 5000 4000 3000 2000 1000    0 1000 2000 3000 5099 4123 3162 2236 1414 1000 1414 2236 3162;
 6324 5385 4472 3605 2828 2236 2000 2236 2828 6082 5099 4123 3162 2236 1414 1000 1414 2236 6000 5000 4000 3000 2000 1000    0 1000 2000 6082 5099 4123 3162 2236 1414 1000 1414 2236;
 7280 6324 5385 4472 3605 2828 2236 2000 2236 7071 6082 5099 4123 3162 2236 1414 1000 1414 7000 6000 5000 4000 3000 2000 1000    0 1000 7071 6082 5099 4123 3162 2236 1414 1000 1414;
 8246 7280 6324 5385 4472 3605 2828 2236 2000 8062 7071 6082 5099 4123 3162 2236 1414 1000 8000 7000 6000 5000 4000 3000 2000 1000    0 8062 7071 6082 5099 4123 3162 2236 1414 1000;
 3000 3162 3605 4242 5000 5830 6708 7615 8544 2000 2236 2828 3605 4472 5385 6324 7280 8246 1000 1414 2236 3162 4123 5099 6082 7071 8062    0 1000 2000 3000 4000 5000 6000 7000 8000;
 3162 3000 3162 3605 4242 5000 5830 6708 7615 2236 2000 2236 2828 3605 4472 5385 6324 7280 1414 1000 1414 2236 3162 4123 5099 6082 7071 1000    0 1000 2000 3000 4000 5000 6000 7000;
 3605 3162 3000 3162 3605 4242 5000 5830 6708 2828 2236 2000 2236 2828 3605 4472 5385 6324 2236 1414 1000 1414 2236 3162 4123 5099 6082 2000 1000    0 1000 2000 3000 4000 5000 6000;
 4242 3605 3162 3000 3162 3605 4242 5000 5830 3605 2828 2236 2000 2236 2828 3605 4472 5385 3162 2236 1414 1000 1414 2236 3162 4123 5099 3000 2000 1000    0 1000 2000 3000 4000 5000;
 5000 4242 3605 3162 3000 3162 3605 4242 5000 4472 3605 2828 2236 2000 2236 2828 3605 4472 4123 3162 2236 1414 1000 1414 2236 3162 4123 4000 3000 2000 1000    0 1000 2000 3000 4000;
 5830 5000 4242 3605 3162 3000 3162 3605 4242 5385 4472 3605 2828 2236 2000 2236 2828 3605 5099 4123 3162 2236 1414 1000 1414 2236 3162 5000 4000 3000 2000 1000    0 1000 2000 3000;
 6708 5830 5000 4242 3605 3162 3000 3162 3605 6324 5385 4472 3605 2828 2236 2000 2236 2828 6082 5099 4123 3162 2236 1414 1000 1414 2236 6000 5000 4000 3000 2000 1000    0 1000 2000;
 7615 6708 5830 5000 4242 3605 3162 3000 3162 7280 6324 5385 4472 3605 2828 2236 2000 2236 7071 6082 5099 4123 3162 2236 1414 1000 1414 7000 6000 5000 4000 3000 2000 1000    0 1000;
 8544 7615 6708 5830 5000 4242 3605 3162 3000 8246 7280 6324 5385 4472 3605 2828 2236 2000 8062 7071 6082 5099 4123 3162 2236 1414 1000 8000 7000 6000 5000 4000 3000 2000 1000    0 ];
   
flows = [ 0    0    0    2    1    7    9    0    4   75    7   12   22    7    1    0    0    0    0   23    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    4   16    0    8    0    0   16    0    0    0    0    6    0    4    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    4   16   20    0    0    0    0   20    0    0    0    0    0    0    4    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    2    0    0    0   29    5   18   47   23    2    4    0   48    0    4    0    0    0    0   25    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    1    0    0   29    0   18   12   25    0    0    4    0   25    0    3    0    0    0    0   18    0    3    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    7    0    4    5   18    0    4    2    0    1   23    2   19    0    0    0    0    0    2   19    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    9    4   16   18   12    4    0    0   14   72    7    8   39    8   40    8    0    8    4    7    0    0    0    0    0    0    0   28    8    0    0    0    0    0    0    0;
    0   16   20   47   25    2    0    0   10   71    2    0    0    0    0    0    0   41    0    0    0    0    0    0    0    0    7    8    0    0    0    0    0    0    0    0;
    4    0    0   23    0    0   14   10    0   14    0    0   18    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
   75    8    0    2    0    1   72   71   14    0   11    1   17    0    1    0    0   17    0   15    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    7    0    0    4    4   23    7    2    0   11    0  316   33    8    2    0    0    0    8   34    0    0    6    0    0    0   10    0    0    6    0    0    0    0    0    0;
   12    0    0    0    0    2    8    0    0    1  316    0  157   25    4    0    0    1    0    0    0    0    0    0   22    0    1    0    0    0    0    0    0    0    0    0;
   22   16   20   48   25   19   39    0   18   17   33  157    0   11    6    0    0    6    0    5    8    3   10    0    0    0    9   11    2    0    0    1    0    0    0    0;
    7    0    0    0    0    0    8    0    0    0    8   25   11    0    3    0    0    1    1   21    0    1    0    2    0    0    5    0    0    3    2    5    5    4    0    0;
    1    0    0    4    3    0   40    0    0    1    2    4    6    3    0   19    0    2    2   12    0    0    0    0    0    0    0    7    3    0    0    0    0    0    0    0;
    0    0    0    0    0    0    8    0    0    0    0    0    0    0   19    0    0    6    0    1    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0   40    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    6    0    0    0    0    8   41    0   17    0    1    6    1    2    6   40    0    0   26    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    2    4    0    0    0    8    0    0    1    2    0    0    0    0   13    9    0    7    0    0    0    0   27   16    3    0   20    0    4    0    0;
   23    4    4   25   18   19    7    0    0   15   34    0    5   21   12    1    0   26   13    0   11    4   36    0    0    0   16   18    9   10    1   28    6    2    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    8    0    0    0    0    0    9   11    0   36    6    0    8    0    2    0    0    0    0    0    0    0    0    0;
    0    0    0    0    3    0    0    0    0    0    0    0    3    1    0    0    0    0    0    4   36    0    0    0    0    0    4    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    6    0   10    0    0    0    0    0    7   36    6    0    0    0    0   12    9    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    2    0    0    0    0    0    0    0    0    0    0   26    0    5    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0   22    0    0    0    0    0    0    0    0    8    0    0   26    0   35    2    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0   12    0   35    0    4    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    7    0    0   10    1    9    5    0    0    0    0    0   16    2    4    9    5    2    4    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0   28    8    0    0    0    0   11    0    7    0    0    0   27   18    0    0    0    0    0    0    0    0   10   22    4    6    4   12    0    0;
    0    0    0    0    0    0    8    0    0    0    0    0    2    0    3    0    0    0   16    9    0    0    0    0    0    0    0   10    0   19   12    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    6    0    0    3    0    0    0    0    3   10    0    0    0    0    0    0    0   22   19    0   19    4    5    8    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    2    0    0    0    0    0    1    0    0    0    0    0    0    0    4   12   19    0    0    3   13    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    1    5    0    0    0    0   20   28    0    0    0    0    0    0    0    6    0    4    0    0   18   24    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    5    0    0    0    0    0    6    0    0    0    0    0    0    0    4    0    5    3   18    0   20    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    4    0    0    0    0    4    2    0    0    0    0    0    0    0   12    0    8   13   24   20    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0 ];

dim=size(distance,1);

    [position, p] = sort(position);
    p = p(1:dim);
    z=dim-1;
    sum=0;
    for i=1:z
        for j=1:dim
            sum=sum+distance(i,j)*flows(p(i),p(j));
        end
    end

end