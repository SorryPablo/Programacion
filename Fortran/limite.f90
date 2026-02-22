program limite
    open(1,file='limite.txt')
    x=1
    do
        write(1,*) x,x**sin(1/x)-1
        x=x+1
        if (x>10000) exit
    end do
    close(1)
end program limite