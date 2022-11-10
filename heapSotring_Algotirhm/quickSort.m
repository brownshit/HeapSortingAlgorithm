function X = quickSort(X, L, R)%X는 벡터, L과 R은 좌우 포인터
    if L+1 == R
        if X(L)>X(R)
            temp = X(L);
            X(L) = X(R);
            X(R) = temp;
        end
    elseif L<R        
        [X,pivot] = patition(X, L,R);
        X = quickSort(X, L, pivot-1);
        X = quickSort(X, pivot+1, R);
    end
end