classdef masa < punto #Derivada de punto
    properties
        m
    end
    methods
        function ms=masa(x,y,m)
            ms=ms@punto(x,y); #Para que funcione hay que llamar así entero,
            ms.m=m;           #no componente a componente
        end
        function mostra(ms)
            printf('masa:x=%g y=%g z=%g\n',ms.x,ms.y,ms.m)
        end
    end
end
