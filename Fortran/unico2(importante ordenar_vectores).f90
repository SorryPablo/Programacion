program unico
    integer,parameter :: n=10
    integer :: x(n)=[1,2,1,3,9,0,0,9,1,9],y(n),z
    j=0
    
    do i=1,n
        z=x(i)
        if (all(z/=x(1:i-1))) then
            !print*,'inserto=',z,'en y=',y(:j)
            do k=1,j
                if(y(k)>z) exit
            end do 
            !print*,'en posicion=',k           
            do l=j,k,-1
                y(l+1)=y(l)
            end do
            y(k)=z;j=j+1
            !print*,'novo=',y(:j)
        end if
    end do
    print*,'y=',y(:j)
end program unico