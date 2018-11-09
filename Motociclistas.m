%Funcion para ver la animacion del numero de motociclistas muertos en siniestros
%cada mes en los años 2005 a 2016. 
%Comparando la cantidad de estos que eran mujeres u hombres.
%vel, es la velocidad a la que se quiere reproducir la animacion.
%tabla, es la tabla que se genera a partir de los datos en excel.

function Motociclistas(vel,tabla)
    color = {[245 130 48];[145 30 180];[0 128 128];[136 48 188];[170 110 40];[152 145 46];[128 0 0];[52 169 87];[128 128 0];[183 101 30];[0 0 128];[20 102 102]};
    aaaa = 2005:1:2016;
    meses = categorical({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'});
    hold on
    set(gcf, 'Position', get(0, 'Screensize'));
    xlim([30, 320]);
    ylim([0, 290]);
    xlabel('Hombres')
    ylabel('Mujeres')
    cont = 1;
    for i = 1:length(aaaa)
        nom = {'Comaparacion Motociclistas Hombres vs Mujeres muertos',num2str(aaaa(i))};
        nom = strjoin(nom,' ');
        title(nom);
        moto = tabla(and(tabla.(1)==aaaa(i),tabla.(2)=='Motociclista'),:);
        for j = 1:length(meses)
            dia = height(moto(moto.(6)==meses(j),:));
            hom = moto(and(moto.(6)==meses(j),moto.(8)=='Hombre'),:);
            muj = moto(and(moto.(6)==meses(j),moto.(8)=='Mujer'),:);
            x = height(hom);
            y = height(muj) * 10;
            cont = cont + 1;
            scatter(x, y, dia,'MarkerEdgeColor',color{i}/255);
            pause(vel);
        end
        cla
    end
    clear 
    close all;
 