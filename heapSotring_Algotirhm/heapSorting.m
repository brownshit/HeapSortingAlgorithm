function heapSortedVector = heapSorting(X,N)
%{
    heap Sorting is simuler as binary tree.
    1.tree structure build
    2.put sorted numbers in array
        compare with number which one is besides
%}
row_temp = log2(N);
Row = ceil(row_temp);
%get matrix madeby heap
Heapmatrix = heapMake(X,N,Row);
include_0_element_num = 2^Row-1;  %this variable means 2진수 벡터길이

tempVector = zeros(1,include_0_element_num);
Row_counter = 1;
%HeapMatrix_Slicing
%first, we have to get every element of matrix.

for arrInputNum = include_0_element_num:(-1):1
    tempVector(arrInputNum) = Heapmatrix(1,1);
    Heapmatrix(1,1) = 0;    %(1,1)이 0이 된다.
    disp(arrInputNum + "번째 실행 : ")
    disp(Heapmatrix);
    
    % 두수를 비교하여 
    %한개의 row에 대한 step
    %in this condition, _if_ cause _for_ to stop.
    
    Index_nextParent = 1;
    %아래에서 (row-1)번 만큼의 두수비교 후 대입의 algorithm이 실행된다.
    %in here you have to write code about shifting componant to upper.
    for rotate_ROW = 1:1:Row-1
        disp("in for");
        interval_ChlidLR = (2*Row)/2^(rotate_ROW); %index_interval
        %in this condition, 
        %lower componant will shift to upper componant
        %it needs Child_L, Child_R, ParantComp
        
        disp("rotate_ROW : "+rotate_ROW);
        disp("      Index_nextParent : "+Index_nextParent);
        disp("      interval_ChlidLR : "+interval_ChlidLR);
        ParantComp = Heapmatrix(rotate_ROW,Index_nextParent);  %upper comp
        Child_L = Heapmatrix(rotate_ROW+1,Index_nextParent);   %left comp
        Child_R = Heapmatrix(rotate_ROW+1,Index_nextParent + interval_ChlidLR);   %right comp
        disp("ParantComp : "+ParantComp);
        disp("      Child_L : "+Child_L);
        disp("      Child_R : "+Child_R);
        %아래의 코드들은 연쇄적으로 작용해서 행당 힙 정렬을 완성시킨다.
        if Child_L > Child_R
            disp("L>R");
            %L > R case
            temp = Heapmatrix(rotate_ROW,Index_nextParent);
            Heapmatrix(rotate_ROW,Index_nextParent) = Heapmatrix(rotate_ROW+1,Index_nextParent);
            Heapmatrix(rotate_ROW+1,Index_nextParent) = temp;
            %{
                * guidelines
                temp = ParantComp;
                ParantComp = Child_L;
                Child_L =temp;
            %}
            %underline can be ommision(생략)
            %Index_nextParent = Index_nextParent;
        else
            disp("L<R");
            %L < R OR_EQUAL_case
            temp = Heapmatrix(rotate_ROW,Index_nextParent);
            Heapmatrix(rotate_ROW,Index_nextParent) = Heapmatrix(rotate_ROW+1,Index_nextParent + interval_ChlidLR);
            Heapmatrix(rotate_ROW+1,Index_nextParent + interval_ChlidLR) = temp;

            %this index shows what is the next index after this
            %operation
            Index_nextParent = Index_nextParent + interval_ChlidLR;
        end
        %L과 R의 인덱스중 더 컸던 값의 index를 다시 넘겨주는 작업이 필요하다.
        end
    Row_counter = Row_counter + 1;  %add row counter number to stop for
end

%this code ends this Sorting algorithm.
start_Index = (2^Row)-N;
heapSortedVector = tempVector(start_Index:end);
disp(heapSortedVector);
end