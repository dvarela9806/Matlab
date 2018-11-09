%Funcion para ver la animacion del numero de peatones muertos en siniestros
%cada mes en los años 2005 a 2016. 
%El parametro que recibe es vel, y es la velocidad a la que se quiere
%reproducir la animacion.
function Peatones(vel)
    tabla = LeerDatos();
    color = {[245 130 48];[145 30 180];[0 128 128];[230 190 255];[170 110 40];[255 250 200];[128 0 0];[170 255 195];[128 128 0];[255 215 180];[0 0 128];[28 128 128]};
    aaaa = 2005:1:2016;
    meses = categorical({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'});
    aux_mes = categorical({'01-Enero','02-Febrero','03-Marzo','04-Abril','05-Mayo','06-Junio','07-Julio','08-Agosto','09-Septiembre','10-Octubre','11-Noviembre','12-Diciembre'});
    hold on
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
    

