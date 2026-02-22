program aleatorio
real,dimension(10) :: x
print '(a,$)', "introduce a,b: "
read *, a, b
rango = b - a
call init_random_seed()
call random_number(x)
print '("real: ",10f8.4)', rango*x + a
call random_number(x)
print '("enteiro: ",10i5)', int(rango*x + a)
stop
end program aleatorio


!------------------------------------
subroutine init_random_seed()
integer :: i, n, clock
integer, allocatable :: seed(:)
call random_seed(size = n)
allocate(seed(n))
call system_clock(count = clock)
seed = clock + 37 * (/ (i - 1, i = 1, n) /)
call random_seed(put = seed)
deallocate(seed)
return
end subroutine
