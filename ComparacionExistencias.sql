/*COMPARACION EXISTENCIAS*/
SELECT codigo, descripcion, presentacion, cantidad_ingreso, cantidad_salida, (cantidad_ingreso-cantidad_salida) kardex ,cantidad_existencia
from muestras_medicas mat
LEFT JOIN (
	SELECT ifnull(SUM(id.cantidad_unitaria),0) cantidad_ingreso, id.cod_material
	from ingreso_almacenes i
	INNER JOIN ingreso_detalle_almacenes id on i.cod_ingreso_almacen=id.cod_ingreso_almacen 
	where i.cod_almacen='1000' and i.grupo_ingreso=1 and i.ingreso_anulado=0 
	group by id.cod_material
) ing on mat.codigo = ing.cod_material
LEFT JOIN (
	SELECT SUM(sd.cantidad_unitaria) cantidad_salida, sd.cod_material
	from salida_almacenes s, salida_detalle_almacenes sd 
	where s.cod_salida_almacenes=sd.cod_salida_almacen 
	and s.cod_almacen='1000' and s.grupo_salida=1 and s.salida_anulada=0 
	group by sd.cod_material
) sal on mat.codigo = sal.cod_material
LEFT JOIN (
	SELECT SUM(id.cantidad_restante) cantidad_existencia, id.cod_material
	from ingreso_detalle_almacenes id
	INNER JOIN ingreso_almacenes i on i.cod_ingreso_almacen=id.cod_ingreso_almacen
	where i.cod_almacen='1000' and i.grupo_ingreso=1 and i.ingreso_anulado=0 
	group by id.cod_material
) exi on mat.codigo = exi.cod_material
order by descripcion;

/*COMPARACION SALIDAS*/
Select * from (
	SELECT s.cod_salida_almacenes,s.cod_tiposalida, s.fecha, cantidad_salida ,cantidad_existencia
	from salida_almacenes s
	INNER JOIN (
		SELECT IFNULL(SUM(sd.cantidad_unitaria),0) cantidad_salida, sd.cod_salida_almacen
		from salida_almacenes sa1
		INNER JOIN salida_detalle_almacenes sd on sa1.cod_salida_almacenes=sd.cod_salida_almacen 
		where sa1.cod_almacen='1000' and sa1.grupo_salida=1 and sa1.salida_anulada=0 and sd.cod_material = 'M78'
		group by sd.cod_salida_almacen 
	) sal on s.cod_salida_almacenes = sal.cod_salida_almacen
	INNER JOIN (
		SELECT IFNULL(SUM(sdi.cantidad_unitaria),0) cantidad_existencia, sdi.cod_salida_almacen
		from salida_detalle_ingreso sdi
		INNER JOIN salida_almacenes sa on sdi.cod_salida_almacen=sa.cod_salida_almacenes
		where sa.cod_almacen='1000' and sa.grupo_salida=1 and sa.salida_anulada=0 and sdi.material = 'M78'
		group by sdi.cod_salida_almacen
	) exi on s.cod_salida_almacenes = exi.cod_salida_almacen
)x
where cantidad_salida != cantidad_existencia
order by fecha;

/*COMPARACION INGRESOS*/
Select * from (
	SELECT ia.cod_ingreso_almacen,ia.cod_tipoingreso,ida.nro_lote, ia.fecha, cantidad_ingreso ,cantidad_restante_i, cantidad_salida
	from ingreso_almacenes ia
	INNER JOIN ingreso_detalle_almacenes ida on ia.cod_ingreso_almacen = ida.cod_ingreso_almacen
	INNER JOIN (
		SELECT SUM(ifnull(id.cantidad_unitaria,0)) cantidad_ingreso, SUM(ifnull(id.cantidad_restante,0)) cantidad_restante_i, id.cod_ingreso_almacen, id.nro_lote 
		from ingreso_detalle_almacenes id 
		INNER JOIN ingreso_almacenes i on i.cod_ingreso_almacen=id.cod_ingreso_almacen 
		where i.cod_almacen='1000' and i.grupo_ingreso=1 and i.ingreso_anulado=0 and id.cod_material = 'M78'
		group by id.cod_ingreso_almacen,id.cod_material, id.nro_lote 
	) ing on ia.cod_ingreso_almacen = ing.cod_ingreso_almacen and ing.nro_lote = ida.nro_lote
	INNER JOIN (
		SELECT SUM(IFNULL(sdi.cantidad_unitaria,0)) cantidad_salida, sdi.cod_ingreso_almacen, sdi.nro_lote 
		from salida_detalle_ingreso sdi
		INNER JOIN ingreso_almacenes i on i.cod_ingreso_almacen=sdi.cod_ingreso_almacen
		where i.cod_almacen='1000' and i.grupo_ingreso=1 and i.ingreso_anulado=0 and sdi.grupo_salida_ingreso=1 and sdi.material = 'M78' 
		group by sdi.cod_ingreso_almacen,sdi.material, sdi.nro_lote 
	) exi on ia.cod_ingreso_almacen = exi.cod_ingreso_almacen and exi.nro_lote = ida.nro_lote
)x
where  cantidad_restante_i != (cantidad_ingreso - cantidad_salida)
order by fecha;

