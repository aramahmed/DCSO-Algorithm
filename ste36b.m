function [sum, p]=MyCost(position)

  
distance=[   0    1    4    9   16   25   36   49   64    1    2    5   10   17   26   37   50   65    4    5    8   13   20   29   40   53   68    9   10   13   18   25   34   45   58   73;
    1    0    1    4    9   16   25   36   49    2    1    2    5   10   17   26   37   50    5    4    5    8   13   20   29   40   53   10    9   10   13   18   25   34   45   58;
    4    1    0    1    4    9   16   25   36    5    2    1    2    5   10   17   26   37    8    5    4    5    8   13   20   29   40   13   10    9   10   13   18   25   34   45;
    9    4    1    0    1    4    9   16   25   10    5    2    1    2    5   10   17   26   13    8    5    4    5    8   13   20   29   18   13   10    9   10   13   18   25   34;
   16    9    4    1    0    1    4    9   16   17   10    5    2    1    2    5   10   17   20   13    8    5    4    5    8   13   20   25   18   13   10    9   10   13   18   25;
   25   16    9    4    1    0    1    4    9   26   17   10    5    2    1    2    5   10   29   20   13    8    5    4    5    8   13   34   25   18   13   10    9   10   13   18;
   36   25   16    9    4    1    0    1    4   37   26   17   10    5    2    1    2    5   40   29   20   13    8    5    4    5    8   45   34   25   18   13   10    9   10   13;
   49   36   25   16    9    4    1    0    1   50   37   26   17   10    5    2    1    2   53   40   29   20   13    8    5    4    5   58   45   34   25   18   13   10    9   10;
   64   49   36   25   16    9    4    1    0   65   50   37   26   17   10    5    2    1   68   53   40   29   20   13    8    5    4   73   58   45   34   25   18   13   10    9;
    1    2    5   10   17   26   37   50   65    0    1    4    9   16   25   36   49   64    1    2    5   10   17   26   37   50   65    4    5    8   13   20   29   40   53   68;
    2    1    2    5   10   17   26   37   50    1    0    1    4    9   16   25   36   49    2    1    2    5   10   17   26   37   50    5    4    5    8   13   20   29   40   53;
    5    2    1    2    5   10   17   26   37    4    1    0    1    4    9   16   25   36    5    2    1    2    5   10   17   26   37    8    5    4    5    8   13   20   29   40;
   10    5    2    1    2    5   10   17   26    9    4    1    0    1    4    9   16   25   10    5    2    1    2    5   10   17   26   13    8    5    4    5    8   13   20   29;
   17   10    5    2    1    2    5   10   17   16    9    4    1    0    1    4    9   16   17   10    5    2    1    2    5   10   17   20   13    8    5    4    5    8   13   20;
   26   17   10    5    2    1    2    5   10   25   16    9    4    1    0    1    4    9   26   17   10    5    2    1    2    5   10   29   20   13    8    5    4    5    8   13;
   37   26   17   10    5    2    1    2    5   36   25   16    9    4    1    0    1    4   37   26   17   10    5    2    1    2    5   40   29   20   13    8    5    4    5    8;
   50   37   26   17   10    5    2    1    2   49   36   25   16    9    4    1    0    1   50   37   26   17   10    5    2    1    2   53   40   29   20   13    8    5    4    5;
   65   50   37   26   17   10    5    2    1   64   49   36   25   16    9    4    1    0   65   50   37   26   17   10    5    2    1   68   53   40   29   20   13    8    5    4;
    4    5    8   13   20   29   40   53   68    1    2    5   10   17   26   37   50   65    0    1    4    9   16   25   36   49   64    1    2    5   10   17   26   37   50   65;
    5    4    5    8   13   20   29   40   53    2    1    2    5   10   17   26   37   50    1    0    1    4    9   16   25   36   49    2    1    2    5   10   17   26   37   50;
    8    5    4    5    8   13   20   29   40    5    2    1    2    5   10   17   26   37    4    1    0    1    4    9   16   25   36    5    2    1    2    5   10   17   26   37;
   13    8    5    4    5    8   13   20   29   10    5    2    1    2    5   10   17   26    9    4    1    0    1    4    9   16   25   10    5    2    1    2    5   10   17   26;
   20   13    8    5    4    5    8   13   20   17   10    5    2    1    2    5   10   17   16    9    4    1    0    1    4    9   16   17   10    5    2    1    2    5   10   17;
   29   20   13    8    5    4    5    8   13   26   17   10    5    2    1    2    5   10   25   16    9    4    1    0    1    4    9   26   17   10    5    2    1    2    5   10;
   40   29   20   13    8    5    4    5    8   37   26   17   10    5    2    1    2    5   36   25   16    9    4    1    0    1    4   37   26   17   10    5    2    1    2    5;
   53   40   29   20   13    8    5    4    5   50   37   26   17   10    5    2    1    2   49   36   25   16    9    4    1    0    1   50   37   26   17   10    5    2    1    2;
   68   53   40   29   20   13    8    5    4   65   50   37   26   17   10    5    2    1   64   49   36   25   16    9    4    1    0   65   50   37   26   17   10    5    2    1;
    9   10   13   18   25   34   45   58   73    4    5    8   13   20   29   40   53   68    1    2    5   10   17   26   37   50   65    0    1    4    9   16   25   36   49   64;
   10    9   10   13   18   25   34   45   58    5    4    5    8   13   20   29   40   53    2    1    2    5   10   17   26   37   50    1    0    1    4    9   16   25   36   49;
   13   10    9   10   13   18   25   34   45    8    5    4    5    8   13   20   29   40    5    2    1    2    5   10   17   26   37    4    1    0    1    4    9   16   25   36;
   18   13   10    9   10   13   18   25   34   13    8    5    4    5    8   13   20   29   10    5    2    1    2    5   10   17   26    9    4    1    0    1    4    9   16   25;
   25   18   13   10    9   10   13   18   25   20   13    8    5    4    5    8   13   20   17   10    5    2    1    2    5   10   17   16    9    4    1    0    1    4    9   16;
   34   25   18   13   10    9   10   13   18   29   20   13    8    5    4    5    8   13   26   17   10    5    2    1    2    5   10   25   16    9    4    1    0    1    4    9;
   45   34   25   18   13   10    9   10   13   40   29   20   13    8    5    4    5    8   37   26   17   10    5    2    1    2    5   36   25   16    9    4    1    0    1    4;
   58   45   34   25   18   13   10    9   10   53   40   29   20   13    8    5    4    5   50   37   26   17   10    5    2    1    2   49   36   25   16    9    4    1    0    1;
   73   58   45   34   25   18   13   10    9   68   53   40   29   20   13    8    5    4   65   50   37   26   17   10    5    2    1   64   49   36   25   16    9    4    1    0 ];
   
flows = [  0    0    0    2    1    7    9    0    4   75    7   12   22    7    1    0    0    0    0   23    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0;
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
    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0];

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
