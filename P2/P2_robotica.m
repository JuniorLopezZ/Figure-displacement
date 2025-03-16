clf

U_Porg_0=[0.275 ; 
        0;
        0.225]


v_ini_U=[0.1 0 0 ; 0 0.1 0 ; 0 0 0.1]
phi=pi/2;
ang=-pi/2+phi;
        %% VX VY VZ %%
U_MAT_0 = [0.1*cos(ang) -0.1*sin(ang) 0 ; %% X
          0.1*sin(ang) 0.1*cos(ang) 0 ; %% Y
           0 0 0.1 ] %% Z
            %% VX VY VZ %% SOLO SE VERA EL EFECTO DEL VECTOR X %%                  
        %% VX VY VZ %% SOLO SE VERA EL EFECTO DEL VECTOR X %%             

U_T_0 = [ U_MAT_0 U_Porg_0 ; 
        0 0 0 1]

P_U = U_T_0 * [0.1; -0.1 ; 0; 1]

hold on

%% esta parte del codigo sirve para cuando tomemos las medidas dle angulo , podamos usar estas ecuaciones %%
%% alfa=pi/2;
%% plot3([0 1],[0 0],[0 0],'r-^')
%% plot3([0 0],[0 1*cos(alfa)],[0 1*sin(alfa)],'b-^')
%% plot3([0 0],[0 1*cos(alfa+pi/2)],[0 1*sin(alfa+pi/2)],'g-^')
xlim([-1 1]); % Ajustar el rango del eje X
ylim([-1 1]);
zlim([-1 1]);
%% VECTORES DE SISTEMA UNIVERSAL %% 
plot3([0 v_ini_U(1,1)],[0 0],[0 0],'r-^',[0 0],[0 v_ini_U(2,2)],[0 0],'b-^',[0 0],[0 0],[0 v_ini_U(3,3)],'g-^')
%% VECTORES DEL SISTEMA DEL UNIVERSAL AL CERO %% NO USAR !!!!!! %% 
%%plot3([0+U_Porg_0(1)' 0+U_Porg_0(1)'],[0+U_Porg_0(2)' prueba(2,1)+U_Porg_0(2)'],[0+U_Porg_0(3)' 0+U_Porg_0(3)'],'r-o')
%%plot3([0+U_Porg_0(1)' prueba(1,2)+U_Porg_0(1)' ],[0+U_Porg_0(2)' 0+U_Porg_0(2)'],[0+U_Porg_0(3)' 0+U_Porg_0(3)'],'b-o')
%%plot3([0+U_Porg_0(1)' 0+U_Porg_0(1)'],[0+U_Porg_0(2)' 0+U_Porg_0(2)'],[0+U_Porg_0(3)' prueba(3,3)+U_Porg_0(3)'],'g-o')
grid on 
%% VECTOR X %% 
plot3([0+U_Porg_0(1)' 0+U_MAT_0(1,1)+U_Porg_0(1)'],[0+U_Porg_0(2)' U_MAT_0(2,1)+U_Porg_0(2)'],[0+U_Porg_0(3)' 0+0+U_Porg_0(3)'],'r-o')
%% VECTOR Y %% 
plot3([0+U_Porg_0(1)' U_MAT_0(1,2)+U_Porg_0(1)' ],[0+U_Porg_0(2)' U_MAT_0(2,2)+U_Porg_0(2)'],[0+U_Porg_0(3)' 0+U_Porg_0(3)'],'b-o')
%% VECTOR Z %% 
plot3([0+U_Porg_0(1)' 0+U_Porg_0(1)'],[0+U_Porg_0(2)' 0+U_Porg_0(2)'],[0+U_Porg_0(3)' U_MAT_0(3,3)+U_Porg_0(3)'],'g-o')


CERO_Porg_UNO = [U_Porg_0(1)+0.165;  %% x
            U_Porg_0(2)+0;  %% y
            U_Porg_0(3)+0.35;] %% z
grad_est=pi/4; %% 45 grados %% 
grad_est=-grad_est;
 R_y = [1 0  0 ; 
          0 cos(grad_est) -sin(grad_est);
          0  sin(grad_est) cos(grad_est)] %% 

 UNO_MAT_CERO = [0 -.1 0; 
          -.1 0 0 ;
         0 0 -.1] 
         
% Aplicar rotación a cada vector columna
UNO_MAT_0 = R_y * UNO_MAT_CERO
% Construcción de la matriz de cambio de base


%% VECTORES DEL SISTEMA CERO A UNO  %% 
%% VECTOR Y %% 
plot3([0+CERO_Porg_UNO(1)' 0+UNO_MAT_0(1,1)+CERO_Porg_UNO(1)'],[0+CERO_Porg_UNO(2)' UNO_MAT_0(2,1)+CERO_Porg_UNO(2)'],[0+CERO_Porg_UNO(3)' 0+UNO_MAT_0(3,1)+CERO_Porg_UNO(3)'],'r-o')
%% VECTOR X %% 
plot3([0+CERO_Porg_UNO(1)' UNO_MAT_0(1,2)+CERO_Porg_UNO(1)' ],[0+CERO_Porg_UNO(2)' UNO_MAT_0(2,2)+CERO_Porg_UNO(2)'],[0+CERO_Porg_UNO(3)' 0+UNO_MAT_0(3,2)+CERO_Porg_UNO(3)'],'b-o')
%% VECTOR Z %% 
plot3([0+CERO_Porg_UNO(1)' 0+UNO_MAT_0(1,3)+CERO_Porg_UNO(1)'],[0+CERO_Porg_UNO(2)' 0+UNO_MAT_0(2,3)+CERO_Porg_UNO(2)'],[0+CERO_Porg_UNO(3)' UNO_MAT_0(3,3)+CERO_Porg_UNO(3)'],'g-o')

%% hay que calcular alfa con la regla ya que es la que hace que el vector z/x varie  %% 
         %% VX VY VZ %% 

CERO_T_UNO = [UNO_MAT_0 CERO_Porg_UNO ; 0 0 0 1]

O_Porg_1 = CERO_T_UNO * [0 ; -0.05 ; 0.1 ; 1] %% hacia la derecha de la punta de la pinza %% 

U_T_1= U_T_0 * CERO_T_UNO %% apartado C %%

P1_U= U_T_1*[0 ; -0.05 ; 0.1 ; 1];
P1_U = P1_U'
%% APARTADO D EL A) %%
%% plot3([0 P1_U(1)],[0 P1_U(2)],[0 P1_U(3)],'b-^')
%% APARTADO D EL B) %%
U_Porg_UNO=[0,0,0]'

UNO_T_U = inv(U_T_1);
%% ME FALTA CALCULAR ESE PUNTO %% 
UNO_T_U_RAPIDA = [U_T_1(1:3,1:3)' -U_T_1(1:3,1:3)'*U_Porg_UNO; 0 0 0 1 ]

%% PU_1= UNO_T_U*[MEDIR PUNTO];
xlabel("Eje x")
ylabel("Eje y")
zlabel("Eje z")
