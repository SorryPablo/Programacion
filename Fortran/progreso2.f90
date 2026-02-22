program retorno_carro
real(8) :: t0,t1,dt,i=1,n=50000000.  !50000000.
character(40) :: strtime
print '(a10,"   ",a)','Progreso','Tempo restante'
call cpu_time(t0)
do
    call cpu_time(t1)
    dt=(t1-t0)*(n-i)/i
    write (*,'(1a1,f10.2,"%   ",a,$)') char(13),100.*i/n,strtime(dt)
    i=i+1
    if(i>n) exit
end do
write (*,*) ''
end program retorno_carro
!----------------------------------
character(40) function strtime(t) result(str)
real(8),intent(in) :: t
integer :: year,month,d,h,m,s
if(t<60) then  ! seconds in a minute
    s=floor(t)
    write(str,'(i2," s")') s
else if(t<3600) then  ! seconds in an hour
    m=floor(t/60);s=floor(t-60*m);
    write(str,'(i2," m ",i2," s")') m,s
else if(t<86400) then  ! seconds in a day
     h=floor(t/3600);m=floor((t-3600*h)/60);s=floor(t-3600*h-60*m);
     write(str,'(i2," h ",i2," m ",i2," s")') h,m,s
else if(t<2592000) then  ! seconds in a month
     d=floor(t/86400);h=floor((t-86400*d)/3600);m=floor((t-86400*d-3600*h)/60);s=floor(t-86400*d-3600*h-60*m);
     write(str,'(i2," d ",i2," h ",i2," m ",i2," s")') d,h,m,s
else if(t<31536000) then  ! seconds in a year
     month=floor(t/2592000);d=floor((t-2592000*month)/86400);h=floor((t-2592000*month-86400*d)/3600);
     m=floor((t-2592000*month-86400*d-3600*h)/60);s=floor(t-2592000*month-86400*d-3600*h-60*m);
     write(str,'(i2," month ",i2," d ",i2," h ",i2," m ",i2," s")') month,d,h,m,s
else
    y=floor(t/31536000);month=floor((t-31536000*y)/2592000);d=floor((t-31536000*y-2592000*month)/86400);
    h=floor((t-31536000*y-2592000*month-86400*d)/3600);m=floor((t-31536000*y-2592000*month-86400*d-3600*h)/60);
    s=floor(t-31536000*y-2592000*month-86400*d-3600*h-60*m)
    write(str,'(i2," y ",i2," month ",i2," d ",i2," h ",i2," m ",i2," s")') month,d,h,m,s
end if
return
end function strtime
