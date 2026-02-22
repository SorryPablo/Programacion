module obxecto !OJO con los TABULADORES, todo bien espaciado.
    type punto
        real :: x,y                      !TIPOS DE NUMEROS/VARIABLES
    contains
        procedure :: mostra
    end type punto
    !--------------------------
    type,extends(punto) :: masa
        real :: m
    contains
        procedure :: mostra=>mostra2
    end type masa
    !--------------------------
    interface operator(+)                 !Redefines que significa la suma de dos objetos
        procedure suma
    end interface operator(+)
    !--------------------------
    interface operator(>)
        procedure maior
    end interface operator(>)
contains   
    subroutine mostra(a)
        class(punto),intent(in) :: a
        print *,'punto: x=',a%x,' y=',a%y        !CONTAINS: CONTIENE TODAS LAS SUBROUTINES
    end subroutine mostra                        !Y LAS CLASES QUE SE QUIEREN DEFINIR
    !--------------------------
    subroutine mostra2(a)                 !Es una subrutina que toma
        class(masa),intent(in) :: a       !los valores ya definidos de x,y
        print *,'masa: x=',a%x,' y=',a%y,' m=',a%m
    end subroutine mostra2
    !--------------------------
    type(punto) function suma(a,b)
        class(punto),intent(in) :: a,b
        suma=punto(a%x+b%x,a%y+b%y)
    end function suma
    !--------------------------
    logical function maior(a,b)
        class(punto),intent(in) :: a,b
        maior=(a%x**2+a%y**2 > b%x**2+b%y**2)
    end function maior
end module obxecto

!--------------------------
program principal
use obxecto
class(punto),allocatable :: p,q,r
!--------------------------
print*,'polimorfismo:'
p=punto(1,2)
call p%mostra()          !Porque es importante?
q=masa(3,4,5)            !PQ PARA TODO P EL PROGRAMA SELECCIONA QUE SUBRUTINA USAR
call q%mostra()
!--------------------------
print*, 'sobrecarga do operador(+):'
r=p+q
call r%mostra()
!--------------------------
print*, 'sobrecarga do operador(>):'
if(p>q) then
    print*, 'p>q'
else
    print*, 'p<=q'
end if
end program principal