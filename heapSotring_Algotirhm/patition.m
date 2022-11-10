function [subA, pI] = patition(A, subL, subR) 
    %pivot_index = subR;%피봇 index
        %원래 피봇인덱스를 가장 오른쪽 값으로 잡기 때문에 
        %새로운 변수 선언을 하지않고, 전달받은 인자를 이용하였다.
    Temp_1st = subL-1;
       %모든 연산의 기준은 다 vector의 index값임을 명시할것.
    for Temp_2nd = subL:1:subR-1
        %for문을 통해서 피봇전까지의 요소들을 재정렬해준다.
        if (A(Temp_2nd)<=A(subR))
            Temp_1st = Temp_1st+1;            
            %아래는 swap
            tempIN = A(Temp_1st);
            A(Temp_1st) = A(Temp_2nd);
            A(Temp_2nd) = tempIN;          
        end
    end
    %피봇빼고 나머지는 정렬이 되어있어야 한다.    
    tempOut = A(subR);
    A(subR) = A(Temp_1st+1);
    A(Temp_1st+1) = tempOut;

    subA = A;
    pI = Temp_1st+1;    
end