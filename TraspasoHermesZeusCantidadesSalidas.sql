select s.cod_tiposalida, ts.nombre_tiposalida, count(*) cant
from salida_almacenes s
inner join salida_detalle_almacenes sd on s.cod_salida_almacenes=sd.cod_salida_almacen
left join tipos_salida ts on ts.cod_tiposalida = s.cod_tiposalida
where s.cod_almacen=1000 and s.fecha BETWEEN '2018-04-01' and '2018-04-30' and s.salida_anulada=0 and s.grupo_salida=1 
group by s.cod_tiposalida;


SELECT id.*
from `ingreso_almacenes` i, `ingreso_detalle_almacenes`  id 
where i.`cod_almacen`=1000 and i.`cod_tipoingreso` in (1009,1010) and i.`cod_ingreso_almacen`=id.`cod_ingreso_almacen` and 
i.`fecha` BETWEEN '2018-04-01' and '2018-04-30' and i.`grupo_ingreso`=1 and i.ingreso_anulado=0 and id.cod_material='23025'
group by id.cod_material, id.nro_lote, id.fecha_vencimiento order by 2;





