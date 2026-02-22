program ec2grao
    print '("a,b,c?",$)'
    read *,a,b,c
    d=b**2-4*a*c;a2=2*a

    if ( a==0 ) then
        if ( b==0 ) then
            if ( c==0 ) then
                print*,'IR'
            else
                print*,'x='
            end if
        else
            print*,"x=",-c/b
        end if
    else
        if ( d<0 ) then
            print*,-(b/(a2)),'+-i*',sqrt(-d)/(a2)
        else if(d==0) then
            print*,-b/(a2)
        else
            print*,-(b/(a2)),'+-',sqrt(d)/(a2)
        end if
    end if
endprogram ec2grao