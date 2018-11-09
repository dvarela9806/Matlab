%Funcion para ver la animacion del numero de conductores muertos en siniestros
%cada mes en los años 2005 a 2016. 
%El parametro que recibe es vel, y es la velocidad a la que se quiere
%reproducir la animacion.
function Conductores(vel)
    meses = categorical({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'});
    aux_mes = {'Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'};
    color = {[230 25 75]; [60 180 75]; [255 225 25]; [0 130 200]; [245 130 48]; [145 30 180]; [70 240 240]; [240 50 230]; [210 245 60]; [250 190 190]; [0 128 128]; [230 190 255]};
    aaaa = 2005:1:2016;
    figure
    hold on
    ax = gca;
    mes_ax = [0 13];
    ax.XLim = mes_ax;
    ax.YLim = [0 70];
    set(ax,'XTick',1:12,'XTickLabel',aux_mes);
    tabla = LeerDatos();
    for j = 1:length(aaaa)
        condu = tabla(and(tabla.(1)==aaaa(j),tabla.(2)=='Conductor'),:);
        nom = {'Conductores Muertos en Siniestros',num2str(aaaa(i))};
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
