-- CARGADO DE PARRILLAS CICLO 11 - GESTION 1014

select count(*) as cant /*15083/48271/232826/213205*/
from parrilla_personalizada p
where p.cod_gestion = '1014'
and p.cod_ciclo = '11';

select count(*) as cant /*3072*/
from medicos_parrillapersonalizada p
where p.cod_gestion = '1014'
and p.cod_ciclo = '11';

select count(*) as cant /*5784*/
from parrillaconjunta p;

select *
from ciclos c
order by c.codigo_gestion desc, c.cod_ciclo desc

delete p.*
from parrilla_personalizada p
where p.cod_gestion = '1014'
and p.cod_ciclo = '11'
and p.cod_linea = '1047'

delete select * from asignacion_ma_excel;
delete select * from asignacion_ma_excel_detalle;
delete select * from asignacion_ma_excel_detalle_copy;
delete select * from asignacion_ma_excel_posiciones;
