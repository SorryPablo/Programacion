program euclides
    integer :: k,n,m,s
    print '("n,m?",$)'
    read*,n,m
    if (n<m) then
        k=n;n=m;m=k
    end if
    s=n*m
    do
        k=mod(n,m)
        n=m
        if(k==0) exit
        m=k
    end do
    print '("mcd=",i0)',n
    print '("mcm=",i0)', s/n
end program euclides