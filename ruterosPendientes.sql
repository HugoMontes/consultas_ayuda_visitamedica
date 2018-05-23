/* - - - - - - - - - - - - - - - - - - RUTEROS PENDIENTES - - - - - - - - - - - - - - - - - - */
/* - - - - - - - - - - - - - - - - - - POR CICLO X GESTION X LINEA - - - - - - - - - - - - - - - - - - */
SELECT DISTINCT f.codigo_funcionario, CONCAT(f.paterno,' ', f.materno,' ', f.nombres) as nom, c.descripcion, l.nombre_linea, rc.estado_aprobado, x.codigo_funcionario as aprobado, x.estado_aprobado
from funcionarios f
inner JOIN funcionarios_lineas fl on fl.codigo_funcionario=f.codigo_funcionario
left join rutero_maestro_cab rc on rc.cod_visitador = f.codigo_funcionario and rc.codigo_linea=fl.codigo_linea
inner join ciudades c on c.cod_ciudad = f.cod_ciudad
inner join lineas l on l.codigo_linea=rc.codigo_linea
left join (
		SELECT DISTINCT f.codigo_funcionario, CONCAT(f.paterno,' ', f.materno,' ', f.nombres) as nom, c.descripcion, l.nombre_linea, rc.estado_aprobado
		from funcionarios f
			inner join rutero_maestro_cab_aprobado rc on rc.cod_visitador = f.codigo_funcionario 
			inner join ciudades c on c.cod_ciudad = f.cod_ciudad
			inner join lineas l on l.codigo_linea=rc.codigo_linea
		where rc.codigo_ciclo = '2' 
		and rc.codigo_gestion = '1015' and rc.codigo_linea = '1050'
) x on x.codigo_funcionario=f.codigo_funcionario
	where rc.codigo_ciclo = '2' 
	and rc.codigo_gestion = '1015' and fl.codigo_linea = '1050'
and f.estado=1
order by f.cod_ciudad;

/* - - - - - - - - - - - - - - - - - - POR CICLO X GESTION X LINEA - - - - - - - - - - - - - - - - - - */
SELECT * FROM (
	SELECT DISTINCT f.codigo_funcionario, CONCAT(f.paterno,' ', f.materno,' ', f.nombres) as nom, c.descripcion, l.nombre_linea, rc.estado_aprobado as aprobado1, x.cod_visitador as aprobado, x.estado_aprobado as aprobado2
	from funcionarios f
	inner JOIN funcionarios_lineas fl on fl.codigo_funcionario=f.codigo_funcionario
	left join rutero_maestro_cab rc on rc.cod_visitador = f.codigo_funcionario and rc.codigo_linea=fl.codigo_linea
	inner join ciudades c on c.cod_ciudad = f.cod_ciudad
	inner join lineas l on l.codigo_linea=rc.codigo_linea
	left join (
			SELECT DISTINCT rc.cod_visitador, rc.codigo_linea, rc.estado_aprobado
			from funcionarios f
				inner join rutero_maestro_cab_aprobado rc on rc.cod_visitador = f.codigo_funcionario 
			where rc.codigo_ciclo = '2' 
			and rc.codigo_gestion = '1015' 
	) x on x.cod_visitador=f.codigo_funcionario and x.codigo_linea=rc.codigo_linea
		where rc.codigo_ciclo = '2' 
		and rc.codigo_gestion = '1015'  
	and f.estado=1
	order by f.cod_ciudad
)z where aprobado1!=1
;

/* - - - - - - - - - - - - - - - - - - PARA MODIFICAR - - - - - - - - - - - - - - - - - - */
SELECT rc.*
	from rutero_maestro_cab rc
	inner JOIN funcionarios f on rc.cod_visitador = f.codigo_funcionario	
	where rc.codigo_ciclo = '2' 
	and rc.codigo_gestion = '1015'  
	and f.estado=1 and rc.estado_aprobado!=1 and rc.cod_visitador!='1233'
	order by f.cod_ciudad;

