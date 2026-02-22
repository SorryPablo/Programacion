program basel
    real,parameter :: pi=3.141592
    real,parameter :: res=1.644934
    print*,'"iteraciones?",$'
    read*,k
    s=0

    do i=1,k
        s=s+1/(i**2)
    end do
    s=s/res
    print*,s
end program basel