classdef punto
    properties
        x
        y
    end
    methods
        function p=punto(x,y)
            p.x=x;p.y=y; #Collemos os argumentos x,y e os ¿obxectiza?
        end
        function mostra(p)
            printf('punto:p.x=%g p.y=%g\n',p.x,p.y)
        end
        function s=plus(a,b)
            s=punto(a.x+b.x,a.y+b.y);
        end
    end
end
