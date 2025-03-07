function [m_t,centro]= transformacion(M,x,y,theta,centro_in)

% usamos valores simbolicos para poder definir la matriz % 

% matriz de transformacion 
T = [cos(theta) -sin(theta) 0 x ; 
    sin(theta) cos(theta) 0 y ;
    0 0 1 0 ; 
    0 0 0 1 ];

[vertices,columnas] = size(M); 
% inicializamos una matriz de vectores % 
%tendremos siempre cuatro filas -> 4 
%tendremos tantas columnas como vertices tenga el poligono
matriz_vertices=zeros(4,vertices); 

    for i=1:vertices
        matriz_vertices(:,i) = [M(i,:) 0 1 ];
    end 
% hasta este punto tendriamos ya la matriz de vertices bien formada.
matriz_vertices;
% hacemos la multiplicacion % 
res_matriz = T*matriz_vertices;

% extraemos los vertices transformados 

% 1-creamos con el mismo formato inicial
 m_t=zeros(vertices,columnas);

    for i=1:vertices
        m_t(i,:)=[res_matriz(1,i) res_matriz(2,i)];
    end 
    c_oper = T*[centro_in(1); centro_in(2); 0 ; 1];

    centro = [ c_oper(1,1) c_oper(2,1) ];
end
