
select *
from rutero_maestro_cab rc
where rc.codigo_gestion = 1014
and rc.cod_visitador = 1452
and rc.codigo_ciclo = 9

select *
from rutero_maestro_cab_aprobado rc
where rc.codigo_gestion = 1014
and rc.cod_visitador = 1450
and rc.codigo_ciclo = 10

select rd.*
from rutero_maestro_cab rc
LEFT JOIN rutero_maestro r on r.cod_rutero = rc.cod_rutero
LEFT JOIN rutero_maestro_detalle rd on r.cod_contacto = rd.cod_contacto and r.cod_visitador = rd.cod_visitador
where rc.codigo_gestion = 1014
and rc.codigo_ciclo = 9
and rc.cod_visitador = 1452

select rd.*
from rutero_maestro_cab_aprobado rc
LEFT JOIN rutero_maestro_aprobado r on r.cod_rutero = rc.cod_rutero
LEFT JOIN rutero_maestro_detalle_aprobado rd on r.cod_contacto = rd.cod_contacto and r.cod_visitador = rd.cod_visitador
where rc.codigo_gestion = 1014
and rc.codigo_ciclo = 9
and rc.cod_visitador = 1452

select *
from rutero_maestro_cab_aprobado r
where r.codigo_gestion = 1014
and r.codigo_ciclo = 10
and r.cod_visitador = 1472



SELECT r.cod_contacto, r.cod_rutero, r.cod_visitador, r.dia_contacto, r.turno, r.zona_viaje 
from rutero_maestro r, orden_dias o 
where  r.cod_rutero='21673' and r.cod_visitador=1450 and r.dia_contacto = o.dia_contacto 
order by o.id, r.turno;

SELECT nombre_rutero from rutero_maestro_cab where cod_rutero=21673 and cod_visitador=1450;


/* UPDATE */
UPDATE rutero_maestro
set cod_visitador = '1472'
where cod_rutero='21673';

UPDATE rutero_maestro_detalle
set cod_visitador = '1472'
where cod_contacto in (
	Select cod_contacto
	from rutero_maestro
	where cod_visitador = '1472'
	and cod_rutero='21673'
)

