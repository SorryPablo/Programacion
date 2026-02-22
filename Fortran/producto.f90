program producto
    real :: m
    real,allocatable :: v(:),w(:),a(:,:)
    print '("n=",$)'
    read*,n
    allocate(v(n),w(n),a(n,n))
    print '("v[]?",$)';read*,v
    print '("w[]?",$)';read*,w
     print*,'a='
     do i=1,n
         read*,a(i,:)
     end do

     m=0
     do j=1,n
            m=m+w(j)*sum(v*a(:,j))
     end do
     print*,'(v*a*w=)',m
    
    deallocate(v,w,a)
endprogram producto