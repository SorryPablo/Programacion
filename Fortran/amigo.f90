module persona
    type amigo
        character(len=20) :: nom    ! Nombre de la persona
        character(len=20) :: regalo  ! A quién regala
    contains
        procedure :: nombre
    end type amigo
contains   
    subroutine nombre(a)
        class(amigo), intent(in) :: a
        print *, trim(a%nom), ' regala a ', trim(a%regalo)
    end subroutine nombre
end module persona

program principal
    use persona
    implicit none
    
    integer, parameter :: n = 5  ! Número de personas
    type(amigo) :: participantes(n)
    integer :: indices(n)
    integer :: i, j, temp
    logical :: valido
    real :: r
    
    ! Inicializar la semilla del generador de números aleatorios
    call random_seed()
    
    ! Inicializar lista de participantes
    participantes(1)%nom = "Ana"
    participantes(2)%nom = "Bruno"
    participantes(3)%nom = "Carlos"
    participantes(4)%nom = "Diana"
    participantes(5)%nom = "Elena"
    
    do
        ! Inicializar array de índices
        do i = 1, n
            indices(i) = i
        end do
        
        ! Desordenar los índices
        do i = n, 2, -1
            call random_number(r)
            j = int(r * i) + 1
            ! Intercambiar elementos
            temp = indices(i)
            indices(i) = indices(j)
            indices(j) = temp
        end do
        
        ! Verificar que nadie se regala a sí mismo
        valido = .true.
        do i = 1, n
            if (indices(i) == i) then
                valido = .false.
                exit
            end if
        end do
        
        ! Si la asignación es válida, salir del bucle
        if (valido) exit
    end do
    
    ! Asignar los regalos
    do i = 1, n
        participantes(i)%regalo = participantes(indices(i))%nom
    end do
    
    ! Mostrar resultados
    print *, "Asignación de regalos:"
    print *, "----------------"
    do i = 1, n
        call participantes(i)%nombre()
    end do
    
end program principal