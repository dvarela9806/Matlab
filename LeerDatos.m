%Funcion para leer los datos del archivo de base de datos. Generado por
%MATLAB
function Tabla=LeerDatos()
    [~, ~, raw] = xlsread('Mes_data.xlsx','Hoja1','A2:H70675');
    raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
    stringVectors = string(raw(:,[2,3,4,5,6,8]));
    stringVectors(ismissing(stringVectors)) = '';
    raw = raw(:,[1,7]);
    R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); 
    raw(R) = {NaN};
    data = reshape([raw{:}],size(raw));
    Mesdata = table;
    Mesdata.AoHecho = data(:,1);
    Mesdata.CondicinDeLaVictima = categorical(stringVectors(:,1));
    Mesdata.DepartamentodelHecho = categorical(stringVectors(:,2));
    Mesdata.RangodeEdad = categorical(stringVectors(:,3));
    Mesdata.Manera = categorical(stringVectors(:,4));
    Mesdata.MesHecho = categorical(stringVectors(:,5));
    Mesdata.Nmeroderegistros = data(:,2);
    Mesdata.Sexo = categorical(stringVectors(:,6));
    clearvars data raw stringVectors R;
    Tabla = Mesdata;