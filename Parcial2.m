%Proyecto 
% Equipo 4
% Juan Pablo Suástegui | A01066742
% Fernando Arrieta | A01336257
% Jorge Axel Correa | A01636607
% Nicolás Gamboa | A01336257
% Javier Tena Estrada | A01067470

clc, clear
format long
%Introducir valores de la matriz
A=input('ingrese la matriz 1 \n'); %% entrada de
B=input('ingrese la matriz 2 \n'); %  datos     %%
fprintf('Seleccione el método por el cual desea resolver:\n1.-Cramer\t2.-Gauss Jordan\t3.-Eliminacion\n');
o = input('Método deseado = ');

while ( o == 1)
    fprintf('Método de Cramer\n'); 
           disp('D= ')
        det (A)
        xa= A;
        xa(:,1)=B;
        x1=xa;
        x1
        disp('D= ')
        det (x1)
        x1= det (x1)/det (A);
        x2= A;
        x2(:,2)=B;
        det (x2);
        x2
        disp('D= ')
        det (x2)
        x2= det (x2)/det (A);
        x3= A;
        x3(:,3)=B;
        det (x3);
        x3
        disp('D= ')
        det (x3)
        x3= det (x3)/det (A);
        x1
        x2
        x3
    break
end

while ( o == 2)
    fprintf('Método de Gauss Jordan\n'); 
    C=[A B]; %%unión de los datos en una solo matriz
for i=1:length(C(:,1)) %%para i desde la primera fila  hasta el número de filas existentes 
if C(i,i)~=1 %%si el elemento i,i de la diagonal es diferente de 1 
    C(i,:)= C(i,:)./C(i,i);  %entonces se convierte a 1  dividiendo toda la fila por dicho elemento
    disp(C)   %salida de datos
end
%además el resto de elementos de la columna deben convertirse a 0 :  
%es decir si  n es diferente de i ya que si i y n son iguales entonces el
%elemento se encuentra en la diagonal 
    for n=1:length(C(:,1)) %para n desde la primera fila hasta el número de filas existentes
      if n~=i % si n en la columna i no está en la diagonal es decir si i no es igual a n
          C(n,:)=-C(n,i).*C(i,:)+C(n,:); %entonces se convierte a 0 
           disp(C) 
      end              
    end     
end
break
end

while ( o == 3)
    fprintf('Método de Eliminacion\n'); 
    %permite obtener el tama�o de la matriz A
[n,m]=size(A);
C=[A,B];
% la matriz C, representa la forma de la matriz aumentada [Ab]

fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
disp(C); % la funcion disp nos permite imprimir una variable en el espacio de trabajo

if n==m 
    for k=1:(n-1)%instruccion iterativa que permite repetir pasos un numero
                 %determinado de veces
         fprintf('\n ETAPA %g=\n\n',k)
         fprintf('\nLa matriz correspondiente a esta etapa antes del proceso:\n')
         disp(C)
         fprintf('\nLos Multiplicadores correpondientes a esta etapa son:\n')
        for i=(k+1):n
            m(i,k)=C(i,k)/C(k,k); %formula para hallar los multiplicadores
            fprintf('\nm(%g,%g)=',i,k)
            disp(m(i,k));
            for j=k:(n+1)
                C(i,j)= C(i,j) - m(i,k)*C(k,j); %formula de la nueva fila
            end
        end
        fprintf('\nLa matriz correspondiente a esta etapa despues del proceso:\n')
         disp(C)
    end
    for i=n:-1:1
        suma=0;
        for p=(i+1):n
            suma = suma + C(i,p)*X(p);
        end
        X(i)=(C(i,n+1)-suma)/C(i,i);
        %formula de la susticion regresiva y solucion de las variables
    end
else %funcion asignada del if, en caso de que este sea falso
    fprintf('\nERROR: La matriz NO es cuadrada\n');
end
fprintf('\n\n\nSOLUCION:\n');
fprintf('\n\nLa matriz Ab final:\n');
disp(C)
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');
%a continuacion de utiliza una instruccion for, para mostrar el usuario, 
%los resultados de una manera mas ordena
for i=1:n
    Xi=X(1,i);
    fprintf('\nX%g=',i)
    disp(Xi);
end
    break
end