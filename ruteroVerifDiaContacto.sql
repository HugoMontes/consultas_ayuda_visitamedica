/* - - - - - - - - - - - - RUTEROS CON DIA CONTACTO NULO - - - - - - - - - - - -*/
select DISTINCT rc.*, l.nombre_linea
from rutero_maestro_cab_aprobado rc
inner join rutero_maestro_aprobado r on rc.cod_rutero=r.cod_rutero
inner join lineas l on l.codigo_linea=rc.codigo_linea
where r.cod_ciclo_dia_contacto is null
and rc.codigo_ciclo='2' and rc.codigo_gestion='1015';

/* - - - - - - - - - - - - RUTEROS-CONTACTOS CON DIA CONTACTO NULO - - - - - - - - - - - -*/
select r.* 
from rutero_maestro_aprobado r
INNER JOIN ( select * from ciclo_dia_contacto where cod_ciclo='2' and cod_gestion='1015') d on r.dia_contacto=d.dia_contacto
INNER JOIN rutero_maestro_cab_aprobado rc on rc.cod_rutero=r.cod_rutero
WHERE rc.codigo_ciclo='2' and rc.codigo_gestion='1015' 
and r.cod_ciclo_dia_contacto is null
order by r.cod_rutero;

/* - - - - - - - - - - - - UPDATE RUTEROS-CONTACTOS CON DIA CONTACTO NULO - - - - - - - - - - - -*/
UPDATE rutero_maestro_aprobado r 
INNER JOIN (select * from ciclo_dia_contacto where cod_ciclo='2' and cod_gestion='1015') d on r.dia_contacto=d.dia_contacto
INNER JOIN rutero_maestro_cab_aprobado rc on rc.cod_rutero=r.cod_rutero
set r.cod_ciclo_dia_contacto= d.cod_ciclo_dia_contacto
WHERE rc.codigo_ciclo='2' and rc.codigo_gestion='1015'
and r.cod_ciclo_dia_contacto is null
;

SELECT cod_rutero, nombre_rutero, cod_visitador, estado_aprobado, codigo_linea, codigo_ciclo, codigo_gestion,fecha_aprobacion,cvs 
	from rutero_maestro_cab where cod_rutero='';
