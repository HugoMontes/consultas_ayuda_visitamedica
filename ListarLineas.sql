SELECT * FROM lineas l where l.estado=1 and l.linea_promocion=1 ORDER BY l.nombre_linea ASC;
SELECT r.cod_contacto, r.dia_contacto, r.turno, r.zona_viaje, d.cod_ciclo_dia_contacto from rutero_maestro r 
left join ciclo_dia_contacto d on (d.dia_contacto = r.dia_contacto and d.cod_ciclo = '1' and d.cod_gestion = '1015') 
where cod_rutero='21849' and cod_visitador=1406;

SELECT r.cod_contacto, r.dia_contacto, r.turno, r.zona_viaje, d.cod_ciclo_dia_contacto 
from rutero_maestro r 
left join ciclo_dia_contacto d on (d.dia_contacto = r.dia_contacto and d.cod_ciclo = '1' and d.cod_gestion = '1015') 
where cod_rutero='21849' and cod_visitador='1406'

SELECT rd.* 
FROM rutero_maestro_detalle rd 
LEFT JOIN medico_asignado_visitador mv on rd.cod_med = mv.cod_med and mv.codigo_visitador = rd.cod_visitador and mv.codigo_linea = '1032' 
where cod_contacto='748169' and mv.cod_med is not null 

SELECT rd.* FROM rutero_maestro_detalle rd 
LEFT JOIN medico_asignado_visitador mv on rd.cod_med = mv.cod_med and mv.codigo_visitador = rd.cod_visitador and mv.codigo_linea = '1032' 
where cod_contacto='748168' and mv.cod_med is not null

SELECT f.cod_ciudad, count(*) 
from ( select * FROM rutero_maestro_cab_aprobado where codigo_ciclo='10' and codigo_gestion='1014' and rc.estado_aprobado=1) rc
inner join rutero_maestro_aprobado r on rc.cod_rutero=r.cod_rutero and rc.cod_visitador=r.cod_visitador
inner join rutero_maestro_detalle_aprobado rd on rd.cod_contacto=r.cod_contacto
inner JOIN funcionarios f on rc.cod_visitador = f.codigo_funcionario
where f.cod_ciudad in (123,102,114,113,122,104,119,120,121,125,116,124,109,118,117)  
and r.dia_contacto like '%1'
GROUP BY f.cod_ciudad