program distanciapuntoplano
print ' (" a ,b ,c , d ? " , $ ) '
read * ,a ,b ,c , d
print ' (" x0 =( x ,y , z )? " , $ ) '
read * ,x ,y , z
print * , ' distancia = ' , abs ( a * x + b * y + d * z + d )/ sqrt ( a **2+ b **2+ c **2)
end program distanciapuntoplano