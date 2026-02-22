program retorno_carro
integer,parameter :: n=10000000
do i=1,n
    write (*,'(1a1,f6.2,"%",$)') char(13),100.*i/n
end do
write (*,*) ''
end program retorno_carro