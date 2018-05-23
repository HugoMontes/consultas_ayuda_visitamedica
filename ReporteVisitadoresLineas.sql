/*REPORTE QUE SOLICITA MARIA RENE MENSUALMENTE*/
select z.*,c.descripcion,f.cod_zeus
from(
		SELECT x.cod_visitador, x.nombre_completo, lineas_9, y.lineas_10, x.cod_ciudad
		FROM (
		select concat(f.paterno,' ',f.materno,' ',f.nombres) as nombre_completo, GROUP_CONCAT(l.nombre_linea,' ,') as lineas_9, rc.cod_visitador, f.cod_ciudad
		from rutero_maestro_cab_aprobado rc
		inner join funcionarios f on rc.cod_visitador = f.codigo_funcionario
		left join lineas l on l.codigo_linea = rc.codigo_linea
		where rc.codigo_gestion = 1014 and rc.codigo_ciclo = 9
		GROUP BY rc.cod_visitador 
		) x
		LEFT OUTER JOIN (
		select GROUP_CONCAT(l.nombre_linea,' ,') as lineas_10, rc.cod_visitador
		from rutero_maestro_cab_aprobado rc
		inner join funcionarios f on rc.cod_visitador = f.codigo_funcionario
		left join lineas l on l.codigo_linea = rc.codigo_linea
		where rc.codigo_gestion = 1014 and rc.codigo_ciclo = 10
		GROUP BY rc.cod_visitador 
		) y ON  x.cod_visitador = y.cod_visitador

		UNION

		SELECT x.cod_visitador, x.nombre_completo, lineas_9, y.lineas_10, x.cod_ciudad 
		FROM (
		select concat(f.paterno,' ',f.materno,' ',f.nombres) as nombre_completo, GROUP_CONCAT(l.nombre_linea,' ,') as lineas_9, rc.cod_visitador, f.cod_ciudad
		from rutero_maestro_cab_aprobado rc
		inner join funcionarios f on rc.cod_visitador = f.codigo_funcionario
		left join lineas l on l.codigo_linea = rc.codigo_linea
		where rc.codigo_gestion = 1014 and rc.codigo_ciclo = 9
		GROUP BY rc.cod_visitador 
		) x
		RIGHT OUTER JOIN (
		select GROUP_CONCAT(l.nombre_linea,' ,') as lineas_10, rc.cod_visitador
		from rutero_maestro_cab_aprobado rc
		inner join funcionarios f on rc.cod_visitador = f.codigo_funcionario
		left join lineas l on l.codigo_linea = rc.codigo_linea
		where rc.codigo_gestion = 1014 and rc.codigo_ciclo = 10
		GROUP BY rc.cod_visitador 
		) y ON x.cod_visitador = y.cod_visitador
		WHERE x.cod_visitador IS NULL

) z 
left join ciudades c on c.cod_ciudad = z.cod_ciudad
LEFT JOIN funcionarios f on z.cod_visitador = f.codigo_funcionario
WHERE z.cod_visitador IS not NULL
order by nombre_completo
;
