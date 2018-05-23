UPDATE registro_no_visita rnv
INNER JOIN rutero_detalle r on  r.cod_contacto = rnv.cod_contacto and r.orden_visita = rnv.orden_visita
inner JOIN funcionarios f on f.codigo_funcionario = r.cod_visitador
LEFT JOIN rutero rr on rr.cod_contacto=r.cod_contacto
set rnv.estado = 1 
where f.cod_ciudad = 113 and r.estado = 3 and rr.codigo_gestion =1014 and rr.cod_ciclo = 9;

select * from rutero_detalle rd
INNER JOIN rutero_detalle r on r.cod_contacto = rd.cod_contacto and r.orden_visita=rd.orden_visita
INNER JOIN funcionarios f on f.codigo_funcionario = r.cod_visitador
INNER JOIN rutero rr on rr.cod_contacto=r.cod_contacto
set rd.estado = 2
where f.cod_ciudad = 113 and r.estado = 3 and rr.codigo_gestion =1014 and rr.cod_ciclo = 9;



SELECT * from ciclos where estado = 'Activo';

SELECT * from ciclos where cod_ciclo='10' and 
codigo_gestion='1014' and codigo_linea='1032';


SELECT f.codigo_funcionario, f.paterno, f.materno, f.nombres, rc.codigo_linea, rc.codigo_linea, f.cod_zeus, f.cod_ciudad, rc.codigo_ciclo, rc.codigo_gestion
	from rutero_maestro_cab_aprobado rc, funcionarios f
	where f.codigo_funcionario=rc.cod_visitador /*and f.cod_zeus<>0  */
	/*and rc.codigo_ciclo='10'*/ and rc.codigo_gestion='1014' 
	/*and f.estado = 1*/
and f.codigo_funcionario in (1466,1391,1360,1324)
	order by f.codigo_funcionario,rc.codigo_ciclo ;

select max(id_boleta) from boletas_visita_cabXXX;
select IFNULL(max(id_boleta+1),3600000) from boletas_visita_cabXXX9;

select * from boletas_visita_cabXXX b where b.id_visitador_hermes = 1093;

SELECT * FROM funcionarios f where f.codigo_funcionario =1466;
SELECT * FROM funcionarios f where f.estado=1 and f.cod_zeus = 0
/*and f.codigo_funcionario in (1473,1453,1476,1429,1441,1442,1470,1443,1417,1430,1475,1419) */
ORDER BY f.paterno ;

SELECT f.codigo_funcionario, f.paterno, f.materno, f.nombres, rc.codigo_linea, rc.codigo_linea, f.cod_zeus, f.cod_ciudad, c.descripcion, rc.codigo_ciclo, rc.codigo_gestion
	from rutero_maestro_cab_aprobado rc
  LEFT JOIN funcionarios f ON f.codigo_funcionario=rc.cod_visitador
LEFT JOIN ciudades c ON c.cod_ciudad = f.cod_ciudad
	where  f.cod_zeus<>0 and rc.codigo_ciclo='10' and rc.codigo_gestion='1014' 
	and f.estado = 1 
and f.codigo_funcionario in (1466,1468,1473,1474,1477,1453,1461,1476,1471,1429,1441,1442,1470,1443,1462,1472,1465,1469,1464,1417,1467,1430,1475,1419,1460)
	order by f.cod_ciudad ; 

select b.id_visitador_hermes,b.visitador, count(*)
from boletas_visita_cabXXX b 
where  b.id_visitador_hermes in (1466,1468,1473,1474,1477,1453,1461,1476,1471,1429,1441,1442,1470,1443,1462,1472,1465,1469,1464,1417,1467,1430,1475,1419,1460)
GROUP BY b.id_visitador_hermes
order by b.id_visitador_hermes asc


SELECT cod_ciclo
					from ciclos c 
					INNER JOIN gestiones g on c.codigo_gestion = g.codigo_gestion
					where c.estado != 'Cerrado'
					and g.estado = 'Activo'
					order by c.cod_ciclo asc
					

SELECT r.*
from rutero_maestro_cab_aprobado rc, rutero_maestro_aprobado r, rutero_maestro_detalle_aprobado rd 
where rc.cod_rutero=r.cod_rutero 
and rd.cod_contacto=r.cod_contacto 
and rc.cod_visitador=r.cod_visitador 
and r.cod_visitador=rd.cod_visitador 
and rc.estado_aprobado=1 
and rc.cod_visitador in (select codigo_funcionario from funcionarios where cod_ciudad in (102)) 
and rc.codigo_ciclo='9' and rc.codigo_gestion='1014' ;


SELECT rc.*
from rutero_maestro_cab_aprobado rc, rutero_maestro_aprobado r, rutero_maestro_detalle_aprobado rd 
where rc.cod_rutero=r.cod_rutero 
and rd.cod_contacto=r.cod_contacto 
and rc.cod_visitador=r.cod_visitador 
and r.cod_visitador=rd.cod_visitador 
and rc.estado_aprobado=1 
and rc.cod_visitador in (select codigo_funcionario from funcionarios where cod_ciudad in (102)) 
and rc.codigo_ciclo='9' and rc.codigo_gestion='1014' ;


SELECT DISTINCT CAST(r.dia_contacto AS UNSIGNED)
FROM rutero_maestro_cab_aprobado rc
LEFT JOIN rutero_maestro_aprobado r on r.cod_rutero = rc.cod_rutero and rc.cod_visitador = rc.cod_visitador 
and rc.estado_aprobado=1 
and rc.codigo_ciclo='9' and rc.codigo_gestion='1014' ;


SELECT DISTINCT CAST(r.dia_contacto AS UNSIGNED)
SELECT DISTINCT r.dia_contacto
FROM rutero_maestro_cab_aprobado rc
LEFT JOIN rutero_maestro_aprobado r on r.cod_rutero = rc.cod_rutero and rc.cod_visitador = rc.cod_visitador 
and rc.estado_aprobado=1 
and rc.codigo_ciclo='9' and rc.codigo_gestion='1014' 
LIMIT 0,100
;

SELECT r.dia_contacto from rutero_maestro_cab_aprobado rc, rutero_maestro_aprobado r, 
		rutero_maestro_detalle_aprobado rd where rc.cod_rutero=r.cod_rutero and rd.cod_contacto=r.cod_contacto and
		rc.cod_visitador=r.cod_visitador and r.cod_visitador=rd.cod_visitador and rc.estado_aprobado=1 and
		rc.cod_visitador in (select codigo_funcionario from funcionarios where cod_ciudad in (113)) and rc.codigo_ciclo='9' and 
		rc.codigo_gestion='1014' and rd.categoria_med in ('A') and r.dia_contacto like '%10%'