select *
from (
		select 'MM' as tipo,c.descripcion as regional, f.cod_zeus, d.cod_visitador, CONCAT(f.paterno,' ',f.materno,' ',f.nombres) as nombre_visitador, d.codigo_linea, l.nombre_linea
		, d.codigo_producto, mm.descripcion as nombre_producto, sum(d.cantidad_planificada) as cantidad_planificada, SUM(d.cantidad_sacadaalmacen) as cantidad_sacalmacen
		from distribucion_productos_visitadores d
		INNER JOIN muestras_medicas mm on mm.codigo=d.codigo_producto and d.grupo_salida=1
		INNER JOIN funcionarios f on f.codigo_funcionario=d.cod_visitador
		INNER JOIN ciudades c on c.cod_ciudad=f.cod_ciudad
		INNER JOIN lineas l on l.codigo_linea=d.codigo_linea
		where d.codigo_gestion='1015' and d.cod_ciclo='2'
		group by d.cod_visitador, d.codigo_producto, d.grupo_salida
		UNION
		select 'MA' as tipo,c.descripcion as regional, f.cod_zeus, d.cod_visitador, CONCAT(f.paterno,' ',f.materno,' ',f.nombres) as nombre_visitador, d.codigo_linea, l.nombre_linea
		, d.codigo_producto, ma.descripcion_material as nombre_producto, sum(d.cantidad_planificada) as cantidad_planificada, SUM(d.cantidad_sacadaalmacen) as cantidad_sacalmacen
		from distribucion_productos_visitadores d
		INNER JOIN material_apoyo ma on ma.codigo_material=d.codigo_producto and d.grupo_salida=2
		inner JOIN funcionarios f on f.codigo_funcionario=d.cod_visitador
		INNER JOIN ciudades c on c.cod_ciudad=f.cod_ciudad
		INNER JOIN lineas l on l.codigo_linea=d.codigo_linea
		where d.codigo_gestion='1015' and d.cod_ciclo='2'
		group by d.cod_visitador, d.codigo_producto, d.grupo_salida
) x
order by x.regional,x.cod_zeus, x.cod_visitador, x.nombre_producto
;

select 'MM' as tipo,c.descripcion as regional, f.cod_zeus, d.cod_visitador, CONCAT(f.paterno,' ',f.materno,' ',f.nombres) as nombre_visitador, d.codigo_linea, l.nombre_linea
		, d.codigo_producto, mm.descripcion as nombre_producto, sum(d.cantidad_planificada) as cantidad_planificada, SUM(d.cantidad_sacadaalmacen) as cantidad_sacalmacen
from distribucion_banco_muestras d  /**/
INNER JOIN muestras_medicas mm on mm.codigo=d.codigo_producto and d.grupo_salida=1
INNER JOIN funcionarios f on f.codigo_funcionario=d.cod_visitador
INNER JOIN ciudades c on c.cod_ciudad=f.cod_ciudad
INNER JOIN lineas l on l.codigo_linea=d.codigo_linea
where d.codigo_gestion='1014' and d.cod_ciclo='5'
group by d.cod_visitador, d.codigo_producto, d.grupo_salida
UNION
select 'MA' as tipo,c.descripcion as regional, f.cod_zeus, d.cod_visitador, CONCAT(f.paterno,' ',f.materno,' ',f.nombres) as nombre_visitador, d.codigo_linea, l.nombre_linea
, d.codigo_producto, ma.descripcion_material as nombre_producto, sum(d.cantidad_planificada) as cantidad_planificada, SUM(d.cantidad_sacadaalmacen) as cantidad_sacalmacen
from distribucion_banco_muestras d
INNER JOIN material_apoyo ma on ma.codigo_material=d.codigo_producto and d.grupo_salida=2
inner JOIN funcionarios f on f.codigo_funcionario=d.cod_visitador
INNER JOIN ciudades c on c.cod_ciudad=f.cod_ciudad
INNER JOIN lineas l on l.codigo_linea=d.codigo_linea
where d.codigo_gestion='1014' and d.cod_ciclo='5'
group by d.cod_visitador, d.codigo_producto, d.grupo_salida
;

select * 
from distribucion_grupos_especiales d
where d.cod_ciclo='2' and d.codigo_gestion='1015';

