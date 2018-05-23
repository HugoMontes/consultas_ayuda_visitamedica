
/* - - - - - - - - - - -MUESTRAS MEDICAS- - - - - -  -- -  -*/  /*and mm.estado=1 */
SELECT * from (
	SELECT mm.codigo_linea, l.nombre_linea, mm.codigo, CONCAT(descripcion,' ',presentacion) nombre_mm 
	, mm.cod_tipo_muestra, tm.nombre_tipo_muestra, mm.codigo_anterior, mm.estado
	, (IFNULL(cant_ingreso,0) - IFNULL(cant_salida,0)) as existencia
	from muestras_medicas mm
	inner join lineas l on l.codigo_linea = mm.codigo_linea
	inner join tipos_muestra tm on tm.cod_tipo_muestra = mm.cod_tipo_muestra
	inner join (
		SELECT id.cod_material, IFNULL(sum(id.cantidad_unitaria),0) as cant_ingreso 
		from ingreso_almacenes i, ingreso_detalle_almacenes id 
		where i.cod_ingreso_almacen=id.cod_ingreso_almacen and i.fecha<='2018/03/29' 
				and i.cod_almacen='1000' and i.ingreso_anulado=0 and i.grupo_ingreso='1'
		group by id.cod_material
	) ci on ci.cod_material = mm.codigo
	LEFT join (
		SELECT sd.cod_material, IFNULL(sum(sd.cantidad_unitaria),0) as cant_salida
		from salida_almacenes s, salida_detalle_almacenes sd 
		where s.cod_salida_almacenes=sd.cod_salida_almacen and s.fecha<='2018/03/29' 
		and s.cod_almacen='1000' and s.salida_anulada=0 and s.grupo_salida='1'
		group by sd.cod_material
	) cs on cs.cod_material = mm.codigo
	where 1=1
	and mm.codigo!='0'
	and ci.cant_ingreso!=0
	order by mm.descripcion, mm.presentacion
) x where existencia>0
;

/* - - - - - - - - - - -MATERIAL DE APOYO- - - - - -  -- -  -*/
SELECT * from (
	SELECT mm.codigo_linea, l.nombre_linea, mm.codigo_material, mm.descripcion_material
	, mm.cod_tipo_material, tm.nombre_tipomaterial, mm.estado
	, (IFNULL(cant_ingreso,0) - IFNULL(cant_salida,0)) as existencia
	from material_apoyo mm
	inner join lineas l on l.codigo_linea = mm.codigo_linea
	inner join tipos_material tm on tm.cod_tipomaterial = mm.cod_tipo_material
	inner join (
		SELECT id.cod_material, IFNULL(sum(id.cantidad_unitaria),0) as cant_ingreso 
		from ingreso_almacenes i, ingreso_detalle_almacenes id 
		where i.cod_ingreso_almacen=id.cod_ingreso_almacen and i.fecha<='2018/03/29' 
				and i.cod_almacen='1000' and i.ingreso_anulado=0 and i.grupo_ingreso='2'
		group by id.cod_material
	) ci on ci.cod_material = mm.codigo_material
	LEFT join (
		SELECT sd.cod_material, IFNULL(sum(sd.cantidad_unitaria),0) as cant_salida
		from salida_almacenes s, salida_detalle_almacenes sd 
		where s.cod_salida_almacenes=sd.cod_salida_almacen and s.fecha<='2018/03/29' 
		and s.cod_almacen='1000' and s.salida_anulada=0 and s.grupo_salida='2'
		group by sd.cod_material
	) cs on cs.cod_material = mm.codigo_material
	where 1=1
	and mm.codigo_material!=0
	and ci.cant_ingreso!=0
	order by mm.descripcion_material
) x where existencia>0;


select * from material_apoyo limit 1000

select * from tipos_muestra

SELECT mm.*
from muestras_medicas mm 
where mm.descripcion like '%FIXIM%';

select g.*
from gestiones g
where g.codigo_gestion='1014' and g.estado='Activo'
;
update gestiones set estado='Inactivo' where estado='Activo'
update gestiones set estado='Activo' where codigo_gestion='1014'

select max(codigo_material) from material_apoyo; /*23452*/
select * from muestras_medicas where codigo='23452'; 
select * from material_apoyo where codigo_material='22996'; 
SELECT * from tipos_material;

insert into material_apoyo(codigo_material,descripcion_material,estado,cod_tipo_material,codigo_linea,fecha_expiracion)
values('23453','KETOFLEX DUO RESALTADOR DUO JUN-18','Activo','1011','1025','0000-00-00');

select * /*delete d.*  */
from ciclo_dia_contacto d
where d.cod_ciclo='2'
and d.cod_gestion='1015'
order by cod_ciclo_dia_contacto;

select * 
from rutero_maestro_cab r 
where r.codigo_ciclo='2' and r.codigo_gestion='1015';

select nombre_gestion
from gestiones
where codigo_gestion='';



