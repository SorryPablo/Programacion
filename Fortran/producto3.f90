program producto
    real,allocatable :: v(:),w(:),a(:,:)
    print '("n=",$)'
    read*,n
    allocate(v(n),w(n),a(n,n))
    print '("v[]?",$)';read*,v
    print '("w[]?",$)';read*,w
    print*, 'a[;]?'
     do i=1,n
         read*,a(i,:)
     end do

     print*,'(v*a*w=)',dot_product(matmul(v,a),w)
    
    deallocate(v,w,a)
endprogram producto