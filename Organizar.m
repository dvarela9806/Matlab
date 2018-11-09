%Funcion que organiza los datos del dataset de muertes por accidentes de transito de la mejor region a la peor.
%Recibe una celda en la que se han leido dichos datos.
%Retorna una celda con los datos organizados por paises y contienetes de acuerdo a la media de accidentes de transito fatales.

function MejorCont=Organizar(Datos)

Tam = size(Datos);
Row= Tam(1);
PaisesOrg=sortrows(Datos(:,1:5),3);

Counter=ones(1,5);

for i=1:Row

Conti=PaisesOrg(i,:);
Conti=cell2mat(Conti(2))

switch  Conti
    
    case 'Asia'
    Asia(Counter(1),1:5)=   PaisesOrg(i,:);
    Counter(1)=Counter(1)+1;

    case 'America'
    America(Counter(2),1:5)=PaisesOrg(i,:);
    Counter(2)=Counter(2)+1;

    case 'Africa'
    Africa(Counter(3),1:5)= PaisesOrg(i, :);
    Counter(3)=Counter(3)+1;

    case 'Europa'
    Europa(Counter(4),1:5)= PaisesOrg(i, :);
    Counter(4)=Counter(4)+1;

    case 'Oceania'
    Oceania(Counter(5),1:5)=PaisesOrg(i,:);
    Counter(5)=Counter(5)+1;
end
end
Conts={Asia; America; Africa; Europa; Oceania}

PromAsia=mean(cell2mat(Asia(:,3)));
PromAmerica= mean(cell2mat(America(:,3)));
PromAfrica=  mean(cell2mat(Africa(:,3)));
PromEuropa=  mean(cell2mat(Europa(:,3)));
PromOceania= mean(cell2mat(Oceania(:,3)));

Proms=[PromAsia PromAmerica PromAfrica PromEuropa PromOceania];

[Org,IndProm]=sort(Proms);
%MejorCont={};

for i=1:5
    MejorCont(i,1)=Conts(IndProm(i));
end
MejorCont=[MejorCont{1,:};MejorCont{2,:};MejorCont{3,:};MejorCont{4,:};MejorCont{5,:}];



