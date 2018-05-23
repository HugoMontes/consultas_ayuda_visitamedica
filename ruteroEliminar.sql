/*VERIFICAR LÍNEA*/
select rc.*
from rutero_maestro_cab_aprobado rc
where rc.cod_visitador='1373' and rc.codigo_ciclo='3' and rc.codigo_gestion='1015' and rc.codigo_linea='1043'; 

/*PARA ELIMINAR*/
select rd.* /*delete rd.* */
from rutero_maestro_detalle_aprobado rd 
INNER JOIN rutero_maestro_aprobado r on rd.cod_contacto=r.cod_contacto 
INNER JOIN rutero_maestro_cab_aprobado rc on r.cod_rutero=rc.cod_rutero
where rc.cod_visitador='1373' and rc.codigo_ciclo='3' and rc.codigo_gestion='1015' and rc.codigo_linea='1043';

select rc.codigo_linea,r.*  /*delete r.* */
from rutero_maestro_aprobado r 
INNER JOIN rutero_maestro_cab_aprobado rc on r.cod_rutero=rc.cod_rutero
where rc.cod_visitador='1373' and rc.codigo_ciclo='3' and rc.codigo_gestion='1015' and rc.codigo_linea='1043'; 

select rc.*  /*delete rc.* */
from rutero_maestro_cab_aprobado rc
where rc.cod_visitador='1373' and rc.codigo_ciclo='3' and rc.codigo_gestion='1015' and rc.codigo_linea='1043';  /*22560, 22561, 22559*/

/* PARA COPIAR DE CORRADOR A APROBADO */
/* 
INSERT into rutero_maestro_aprobado (cod_contacto, cod_rutero, cod_visitador, dia_contacto, turno, zona_viaje, cod_ciclo_dia_contacto ) 
	SELECT cod_contacto, cod_rutero, cod_visitador, dia_contacto, turno, zona_viaje, cod_ciclo_dia_contacto 
	from rutero_maestro where cod_rutero in (22560, 22561, 22559)

INSERT into rutero_maestro_detalle_aprobado(cod_contacto, orden_visita, cod_visitador, cod_med, cod_especialidad, categoria_med, cod_zona, estado, tipo) 
	SELECT r.cod_contacto, r.orden_visita, r.cod_visitador, r.cod_med, r.cod_especialidad, r.categoria_med, r.cod_zona, r.estado, r.tipo 
	from rutero_maestro_detalle r where r.cod_contacto in (SELECT rm.cod_contacto from rutero_maestro rm where rm.cod_rutero in (22560, 22561, 22559))*/



