/*INGRESOS OFICIAL SOLO HERMES*/
/*UTILIZAR ESTE QUERY*/
SELECT id.cod_material, 
(select concat(m.descripcion,' ',m.presentacion) from muestras_medicas m where m.codigo=id.cod_material)mm,
id.nro_lote, id.fecha_vencimiento, sum(id.cantidad_unitaria) from `ingreso_almacenes` i, `ingreso_detalle_almacenes`  id 
where i.`cod_almacen`=1000 and i.`cod_tipoingreso` in (1009,1010) and i.`cod_ingreso_almacen`=id.`cod_ingreso_almacen` and 
i.`fecha` BETWEEN '2018-04-01' and '2018-04-30' and i.`grupo_ingreso`=1 and i.ingreso_anulado=0 
group by id.cod_material, id.nro_lote, id.fecha_vencimiento order by 2;

/*INGRESOS REVISION ZEUS*/
SELECT id.cod_material, 
id.nro_lote, id.fecha_vencimiento, sum(id.cantidad_unitaria)cant, 
(select max(p.cod_presentacion) from presentaciones_producto p where p.cod_mm_asociado=id.cod_material)codZeus
 from `ingreso_almacenes` i, `ingreso_detalle_almacenes` id 
where i.`cod_almacen`=1000 and i.`cod_tipoingreso` in (1009) and i.`cod_ingreso_almacen`=id.`cod_ingreso_almacen` and 
i.`fecha` BETWEEN '2017-08-01' and '2017-08-31' and i.`grupo_ingreso`=1 and i.ingreso_anulado=0 
group by id.cod_material, id.nro_lote, id.fecha_vencimiento order by codZeus;

/*TOTALES*/
SELECT sum(id.cantidad_unitaria)cant
 from `ingreso_almacenes` i, `ingreso_detalle_almacenes` id 
where i.`cod_almacen`=1000 and i.`cod_tipoingreso` in (1009,1010) and i.`cod_ingreso_almacen`=id.`cod_ingreso_almacen` and 
i.`fecha` BETWEEN '2017-05-01' and '2017-05-31' and i.`grupo_ingreso`=1 and i.ingreso_anulado=0;

/*salidas OFICIAL HERMES*/
/*UTILIZAR ESTE*/
select s.almacen_destino, sd.cod_material, sum(sd.cantidad_unitaria), s.cod_tiposalida, ts.nombre_tiposalida
from salida_almacenes s
inner join salida_detalle_almacenes sd on s.cod_salida_almacenes=sd.cod_salida_almacen
left join tipos_salida ts on ts.cod_tiposalida = s.cod_tiposalida
where s.cod_almacen=1000 and s.fecha BETWEEN '2018-04-01' and '2018-04-30' and s.salida_anulada=0 and s.grupo_salida=1 
group by s.almacen_destino, sd.cod_material;

/*ZEUS*/
select s.almacen_destino, sd.cod_material, sum(sd.cantidad_unitaria),
(select max(p.cod_presentacion) from presentaciones_producto p where p.cod_mm_asociado=sd.cod_material)codZeus,
(select a.nombre_almacen from almacenes a where a.cod_almacen=s.almacen_destino limit 0,1)almacen, s.almacen_destino
from salida_almacenes s, salida_detalle_almacenes sd where s.cod_salida_almacenes=sd.cod_salida_almacen 
and s.cod_almacen=1000 and s.fecha BETWEEN '2017-06-01' and '2017-06-30' and s.salida_anulada=0 and s.grupo_salida=1 
group by s.almacen_destino, sd.cod_material ORDER BY codzeus;

/*con tipo de salida ZEUS*/
select s.almacen_destino, sd.cod_material, sum(sd.cantidad_unitaria),
(select max(p.cod_presentacion) from presentaciones_producto p where p.cod_mm_asociado=sd.cod_material)codZeus,
(select a.nombre_almacen from almacenes a where a.cod_almacen=s.almacen_destino limit 0,1)almacen, s.cod_tiposalida
from salida_almacenes s, salida_detalle_almacenes sd where s.cod_salida_almacenes=sd.cod_salida_almacen 
and s.cod_almacen=1000 and s.fecha BETWEEN '2016-08-01' and '2016-08-31' and s.salida_anulada=0 and s.grupo_salida=1 
group by s.almacen_destino, sd.cod_material order by codZeus, cod_material, s.cod_tiposalida;

/*TOTALES*/

select * from presentaciones_producto p where p.cod_presentacion=23060;
