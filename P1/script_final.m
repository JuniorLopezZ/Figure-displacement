% matrices de vertices % 
m = [1 -1 ; 1 1;-1 1 ;-1 -1];

m_limite=(50).*m;

vecX=m_limite(:,1); % valores de x_limite %
vecY=m_limite(:,2); % valores de y_limite %
[minX_limite,maxX_limite]=bounds(vecX)
[minY_limite,maxY_limite]=bounds(vecY)
% centro del robot inicialmente % 
v= [0 0];
trazado(m_limite,v,"g-o");
% dibujamos el robot sin rotar y sin transladar%
% se mostrara lineas de color rojo %
[P1,P2]=trazado(m,v,"r-*");
delete(P1);
delete(P2);
% definimos la postura %
pose=[5,5,0];
% realizamos la transformacion de m % 
[m_trans,centro_trans]=transformacion(m,pose(1),pose(2),pose(3),v);
% % dibujamos el robot rotado y transladado%
% se monstrara lineas de color azul %
[P1,P2]=trazado(m_trans,centro_trans,"b-*");
delete(P1);
delete(P2);

for i=1:1:10

    delete(P1);
    delete(P2);

    [minX,maxX]=bounds(m_trans(:,1));
    [minY,maxY]=bounds(m_trans(:,2));

    if maxX <= maxX_limite || maxY <= maxY_limite
        
        [m_trans,centro_trans]=transformacion(m_trans,pose(1)+i,pose(2)+i,pose(3),centro_trans);  %% lo dezplazamos %% 
        [P1,P2]=trazado(m_trans,centro_trans,"b-*");

    else  maxX <= maxX_limite || maxY <= maxY_limite

   [m_trans,centro_trans]=transformacion(m_trans,0,0,pose(3),[0 0]); %% lo llevamos nuevamente al centro %% 
        [P1,P2]=trazado(m_trans,centro_trans,"b-*");
        i=1;

    end 
    pause(0.5); %% frecuencia de actulizacion %% 
end
%% ampliarla %%  
% hacer que nos se salga de un cuadrado mas grande del que ya genera y siga dibujando %% 