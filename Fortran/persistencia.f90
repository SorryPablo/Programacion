program persistencia
    print '("n?  ",$)'
    read*,n
    print '(i0,$)',n


    m=0
    do
        k=1
        do
            k=k*mod(n,10);n=n/10
            if (n==0) then
                print '(" -> ",i0,$)',k
                m=m+1
                n=k
                exit
            end if
        end do
        if (k<10) exit
    end do
    print '("    persistencia=",i0)',m
end program persistencia