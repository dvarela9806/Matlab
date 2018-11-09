%Funcion para ver la animacion del numero de conductores muertos en siniestros
%cada mes en los años 2005 a 2016. 
%vel, es la velocidad a la que se quiere reproducir la animacion.
%tabla, es la tabla que se genera a partir de los datos en excel.
function Conductores(vel,tabla)
    meses = categorical({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'});
    aux_mes = {'Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'};
    color = {[245 130 48];[145 30 180];[0 128 128];[136 48 188];[170 110 40];[152 145 46];[128 0 0];[52 169 87];[128 128 0];[183 101 30];[0 0 128];[20 102 102]};
    aaaa = 2005:1:2016;
    figure
    set(gcf, 'Position', get(0, 'Screensize'));
    hold on
    ax = gca;
    mes_ax = [0 13];
    ax.XLim = mes_ax;
    ax.YLim = [0 70];
    xlabel('Mes')
    ylabel('Num. Conductores Muertos')
    set(ax,'XTick',1:12,'XTickLabel',aux_mes);
    for j = 1:length(aaaa)
        condu = tabla(and(tabla.(1)==aaaa(j),tabla.(2)=='Conductor'),:);
        nom = {'Conductores Muertos en Siniestros',num2str(aaaa(j))};
        nom = strjoin(nom,' ');
        title(nom);
        h = animatedline;
        h.Color = color{j}/255;
        for i = 1:12
            num = height(condu(condu.(6)==meses(i),:));
            addpoints(h,i,num)
            drawnow
            pause(vel);
        end
        cla
    end
    clear 
    close all;
