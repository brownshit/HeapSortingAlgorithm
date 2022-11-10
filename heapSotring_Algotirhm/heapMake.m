function returnMatrix = heapMake(X,N,row) %배열/배열 요소 개수/행 길이
    %{
    this function return matrix which display heap tree structure.
    column number = 2^row.
    how about return?
        return must be filled with 0.
        it means that 0 value in array has data in matrix.
    %}
    column = 2^(row-1);
    heapMatrix = zeros(row,column);
    
    %{
            <아래의 구문은 짝수 홀수 판별시에 유용하게 사용가능>
                remainderN = N;     % N을 2로 나눌때의 나머지 값
                while remainderN >0
                    remainderN = remainderN - 2;
                end
                if remainderN<0
                    remainderN = remainderN + 1;
                end    
    %}

    %{
    heapMatrix's index
    ex) row = 4
    
    1
    1               5
    1       3       5       7
    1   2   3   4   5   6   7   8
    
    - 수의 개수 15
    
    column = 2^row
    %}
    %아무리 생각해봐도 넣으면서 정렬은 너무 복잡함.
    %일단 다 넣고 아래부터 정렬하는 방법을 택하겠음
    tempheapcomp = log2(N);
    numofHeapComp = ceil(tempheapcomp);
    for add0Comp = N+1:1:2^numofHeapComp-1
        X(add0Comp) = 0;
    end
    %   disp(X);

    %upper add 0component in arr X.
    %it is ready to make heap
    
    i = 1;
    row_num = 0;
    while (row_num ~= row) %
        i = 2^row_num; %1,2,4,8, ... 
        row_num = row_num +1;
        
        for j = i:1:(2*i-1)
            %   disp("j : "+j+"     i : "+i);
            proto_heapIndex = j-i;
            heapIndex = 1+proto_heapIndex*(column/(2^(row_num-1)));
            heapMatrix(row_num,heapIndex) = X(j);
        end
    end
    %   disp(heapMatrix);
    %upper code made heap matrix
    

    %sorting matrix by besides componant.
    %bottom componant number 만큼의 for문. 각 가지 개수만큼
    for rotatebottomNum = 1:1:column
        tempArr = zeros(1,row);     %tempArr is each column's row component's set
        %   disp("          rotatebottomNum : "+rotatebottomNum);

        for tempArr_index = 1:1:row
            
            %innerRow is value of index of tempArr's but include mean of
                %heapMatrix. easily it changes number.
            innerRow = row +1-tempArr_index;
            %makes row component into one dependance array.
            Numinterval = floor((rotatebottomNum-1)/(2^(innerRow-1)));
            %   disp("                  Numinterval : "+Numinterval);

%================<OK>================

            column_Index = 1+2^(innerRow-1)*Numinterval;
            %   disp("column_Index["+tempArr_index+"] : "+column_Index);
            tempArr(innerRow) = heapMatrix(tempArr_index, column_Index);
            %point heapmatrix의 내부인덱스 issue가...
        end
        %   disp("tempArr["+rotatebottomNum+"] : "+tempArr);
        tempArr = quickSort(tempArr,1,row);
        %   disp("SORTED_ARR["+rotatebottomNum+"] : "+tempArr);

        for tempArr_index = 1:1:row

            innerRow = row+1-tempArr_index;
            Numinterval = floor((rotatebottomNum-1)/(2^(innerRow-1)));
            column_Index = 1+2^(innerRow-1)*Numinterval;
            
            heapMatrix(tempArr_index, column_Index) = tempArr(innerRow);
            %   disp("componant : "+heapMatrix(tempArr_index, column_Index) +"   innerRow : "+innerRow);
        end
        %{
        k = floor(rotatebottomNum/row)
        heapMatrix의 index num : 1+2^(row-1)*k
        %}
    end

    %값의 반환 heapMarix의 return.
    returnMatrix = heapMatrix;
end     %function end!  


