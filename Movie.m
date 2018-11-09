
%Funcion que recibe 0 o 1 parametro
%Si no recibe parametros muestra los datos de muertes por habitantes contra vehículos ordenados de la region con mejores estadisticas a la de peores.
%En caso de recibir parametro, es el nombre de un Pais. Dicho pais se mantiene en la animacion y el comportamiento es igual a cuando recibe 1 parametro.
function Movie(varargin)

tabla = readtable('DataSetMuertesTransito.xlsx');
celda = table2cell(tabla);
celda = Organizar(celda);
Tam=size(celda);
Nvar=nargin;
fig=figure;
set(gcf, 'Position', get(0, 'Screensize'));
%Pais resaltado
Resaltar={};
PaisRes=varargin(1);
if(Nvar==1)
    for i=1:Tam(1)
        if(strcmp(cell2mat(celda(i,1)),PaisRes))
            Resaltar=celda(i,:);
            mhRes = cell2mat(celda(i,3)); %x 
            mtrRes = cell2mat(celda(i,4));%y 
            mtRes = (log(cell2mat(celda(i,5)))*100)+1;%diametro
        end
    end
end

if(isempty(Resaltar)==1)
    Nvar=0;
end

current_conti='';
for i=1:Tam(1)
    aux = celda(i,:);
    conti = cell2mat(aux(2));

    if strcmp(current_conti,conti) == 1
        hold on
    else
        disp(current_conti);
        current_conti = conti;
        reset(gcf);
        hold off
        if(Nvar==1)
            ac=gca;
            ax.XLim = [0 80];
            ax.YLim = [0 10020];
        end
    end
    
    current_conti = conti;
     
    mh = cell2mat(aux(3)); %x 
    mtr = cell2mat(aux(4));%y 
    mt = (log(cell2mat(aux(5)))*100)+1;%diametro

    switch conti
        case 'Asia'

        if(Nvar==0)

            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Asia  ' aux{1}],'Location','west')
        
        else
            scatter(mhRes, mtrRes, mtRes,'filled','MarkerFaceColor',[0 1 1]);
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Asia  ' aux{1}],Resaltar{1},'Location','west')
        end
        ax = gca;
        scatter(mh, mtr, mt,'MarkerEdgeColor',[1 0 0]);
        ax.XLim = [0 60];
        ax.YLim = [0 1050];

        case 'Africa'

        if(Nvar==0)

            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Africa  ' aux{1}],'Location','west')
        else
            scatter(mhRes, mtrRes, mtRes,'filled','MarkerFaceColor',[0 1 1]);
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Africa  ' aux{1}],Resaltar{1},'Location','west')
        end
        ax = gca;
        scatter(mh, mtr, mt,'MarkerEdgeColor',[0 1 0]);
        ax.XLim = [0 80];
        ax.YLim = [0 10020];
        case 'America'

        if(Nvar==0)

            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['America  ' aux{1}],'Location','west')
        else
            scatter(mhRes, mtrRes, mtRes,'filled','MarkerFaceColor',[0 1 1]);
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['America  ' aux{1}],Resaltar{1},'Location','west')
        end

        ax = gca;
        scatter(mh, mtr, mt,'MarkerEdgeColor',[0 0 1]);
        ax.XLim = [0 60];
        ax.YLim = [0 1100];
        case 'Europa'
        ax = gca;
        if(Nvar==0)

            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Europa  ' aux{1}],'Location','west')
        else
            scatter(mhRes, mtrRes, mtRes,'filled','MarkerFaceColor',[0 1 1]);
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
            legend(['Europa  ' aux{1}],Resaltar{1},'Location','west')
        end
        scatter(mh, mtr, mt,'MarkerEdgeColor',[1 1 0]);
        ax.XLim = [0 60];
        ax.YLim = [0 180];
    
        case 'Oceania'

        if(Nvar==0)
            legend(['Oceania  ' aux{1}],'Location','west')
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
        else
            scatter(mhRes, mtrRes, mtRes,'filled','MarkerFaceColor',[0 1 1]);
            legend(['Oceania  ' aux{1}],Resaltar{1},'Location','west')
            xlabel('Muertes por habitante')
            ylabel('Muertes por vehículos')
        end
        ax = gca;
        scatter(mh, mtr, mt,'MarkerEdgeColor',[1 0 1]);
        ax.XLim = [0 35];
        ax.YLim = [0 320];
    end
    
    frames(i) = getframe(fig);
end

movie(fig,frames,1)