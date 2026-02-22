program mediaprod
    real :: media,produc
    print*,'"n?",$'
    read*,n

    media=0
    produc=1

    do i=1,n
        print*,'valor de x',i
        read*,x
        media = media + x
        produc=produc*x
    end do

    print*,'media:', media/n
    print*,'produc:',produc

end program mediaprod