function [P1,P2] = trazado(M,V,texto)

% v : localizacion del centro del robot 
% M : matriz ( poligono ) con los datos ya ordenados 
% texto : nos indica el color y que tipo de trazado haremos % r- % 
arguments
    M double
    V double 
    texto string % valida que "texto" sea un string
end 

M=[M ; M(1,:)]; % nos aseguramos que el ultimo vector conecte con el primero 
% indicamos el centro del robot con un aspa % 
P1 = plot(V(1),V(2),"x");
%extraemos los valores de las columnas X,Y 
% hacemos su transpuesta ya que necesitamos en formato vector 
x=M(:,1)';
y=M(:,2)';
hold on % para matener el plot de antes con la aspa indicando el centro % 
P2 = plot(x,y,texto);
legend("centro del robot","trazado")
xlabel("x")
ylabel("y")
axis equal % para mantener las proporciones reales % 
end