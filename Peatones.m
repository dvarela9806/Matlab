%Funcion para ver la animacion del numero de peatones muertos en siniestros
%cada mes en los años 2005 a 2016. 
%vel, es la velocidad a la que se quiere reproducir la animacion.
%tabla, es la tabla que se genera a partir de los datos en excel.
function Peatones(vel,tabla)
    color = {[245 130 48];[145 30 180];[0 128 128];[136 48 188];[170 110 40];[152 145 46];[128 0 0];[52 169 87];[128 128 0];[183 101 30];[0 0 128];[20 102 102]};
    aaaa = 2005:1:2016;
    meses = categorical({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'});
    aux_mes = categorical({'01-Enero','02-Febrero','03-Marzo','04-Abril','05-Mayo','06-Junio','07-Julio','08-Agosto','09-Septiembre','10-Octubre','11-Noviembre','12-Diciembre'});
    hold on
    set(gcf, 'Position', get(0, 'Screensize'));
    xlabel('Mes')
    ylabel('Num. Peatones Muertos')
    ylim([0, 201]);
    for i = 1:length(aaaa)
        nom = {'Peatones Muertos en Siniestros',num2str(aaaa(i))};
        nom = strjoin(nom,' ');
        title(nom);
        peatones = tabla(and(tabla.(1)==aaaa(i),tabla.(2)=='Peaton'),:);
        for j = 1:length(meses)
            pea_mes(j) = height(peatones(peatones.(6)==meses(j),:));
            h = bar(aux_mes(j),pea_mes(j));
            h.FaceColor = color{i}/255;
            pause(vel);
        end
        cla
    end
    clear 
    close all;
    

