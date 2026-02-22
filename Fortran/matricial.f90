program matricial
    real,allocatable :: a(:,:),b(:,:)
    print '("n,m,p,q?",$)'
    read*,n,m,p,q
    allocate(a(n,m),b(p,q))
     print*,'a='
     do i=1,n
         read*,a(i,:)
     end do
     do j=1,p
        read*,a(j,:)
    end do
    matmul(a())
    end program matricial