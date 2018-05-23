SELECT * from (SELECT distinct (d.codigo_producto), concat(m.`descripcion`,' ',m.presentacion),
        d.grupo_salida from distribucion_productos_visitadores d, `muestras_medicas` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        d.codigo_linea in (1043,1009,1022,1021,1023,1041,1032,1046,1033,1035,1042,1050,1047) and m.`codigo`=d.`codigo_producto` and d.grupo_salida=1 
			union 
        SELECT distinct (d.codigo_producto), concat(m.`descripcion`,' ',m.presentacion),
        d.grupo_salida from distribucion_grupos_especiales d, `muestras_medicas` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        m.`codigo`=d.`codigo_producto` and d.grupo_salida=1
     union
        SELECT distinct (d.codigo_producto), concat(m.`descripcion`,' ',m.presentacion),
        d.grupo_salida from distribucion_banco_muestras d, `muestras_medicas` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        m.`codigo`=d.`codigo_producto` and d.grupo_salida=1) as tabla order by 2;

SELECT territorio,sum(cantidad_planificada), sum(cantidad_distribuida), SUM(cantidad_sacadaalmacen) 
				from distribucion_productos_visitadores
				where codigo_gestion='1015' and cod_ciclo in ('2') and codigo_producto='M99' 
				and codigo_linea in (1043,1009,1022,1021,1023,1041,1032,1046,1033,1035,1042,1050,1047) and grupo_salida='1'
				group by territorio;

select id.cod_ingreso_almacen, id.cantidad_restante, id.nro_lote, i.grupo_ingreso from ingreso_detalle_almacenes id,
				ingreso_almacenes i
				where i.cod_ingreso_almacen=id.cod_ingreso_almacen and i.cod_almacen='1000' and id.cod_material='23064' and i.grupo_ingreso=1
				and id.cantidad_restante> 0 and i.`ingreso_anulado`=0 order by id.fecha_vencimiento
select id.cod_ingreso_almacen, id.cantidad_restante, id.nro_lote from ingreso_detalle_almacenes id,
				ingreso_almacenes i
				where i.cod_ingreso_almacen=id.cod_ingreso_almacen and i.cod_almacen='1000' and id.cod_material='23064'
				and id.cantidad_restante> 0 and i.`ingreso_anulado`=0 and i.grupo_ingreso='1' order by id.fecha_vencimiento

SELECT * from (SELECT distinct (d.codigo_producto), m.`descripcion_material`,
        d.grupo_salida from distribucion_productos_visitadores d, `material_apoyo` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        d.codigo_linea in (1043) and m.`codigo_material`=d.`codigo_producto`
        and m.codigo_material<>0 and d.grupo_salida=2
			union 
		SELECT distinct (d.codigo_producto), m.`descripcion_material`,
        d.grupo_salida from `distribucion_grupos_especiales` d, `material_apoyo` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        m.`codigo_material`=d.`codigo_producto`
        and m.codigo_material<>0 and d.grupo_salida=2
                                                    union
		SELECT distinct (d.codigo_producto), m.`descripcion_material`,
        d.grupo_salida from `distribucion_banco_muestras` d, `material_apoyo` m
        where d.cod_ciclo in (2) and d.codigo_gestion = 1015 and
        m.`codigo_material`=d.`codigo_producto`
        and m.codigo_material<>0 and d.grupo_salida=2) as tabla order by 2
;
SELECT distinct (d.codigo_producto), concat(m.`descripcion`,' ',m.presentacion),
d.grupo_salida from distribucion_productos_visitadores d, `muestras_medicas` m
where d.cod_ciclo in ('2') and d.codigo_gestion = '1015' and
d.codigo_linea in ($rpt_linea) and m.`codigo`=d.`codigo_producto` and d.grupo_salida=1

SELECT mm.codigo, mm.descripcion, sum(cantidad_planificada), sum(cantidad_distribuida), SUM(cantidad_sacadaalmacen) 
from distribucion_productos_visitadores d
inner join muestras_medicas mm on mm.codigo=d.codigo_producto
where d.codigo_gestion='1015' and d.cod_ciclo='2' and d.grupo_salida=1
group by d.codigo_producto
ORDER BY mm.descripcion;

SELECT ma.codigo_material, ma.descripcion_material, sum(cantidad_planificada), sum(cantidad_distribuida), SUM(cantidad_sacadaalmacen) 
from distribucion_productos_visitadores d
inner join material_apoyo ma on ma.codigo_material=d.codigo_producto
where d.codigo_gestion='1015' and d.cod_ciclo='2' and d.grupo_salida='2'
group by d.codigo_producto
ORDER BY ma.descripcion_material;

SELECT mm.codigo, mm.descripcion, l.nombre_linea,d.codigo_linea, sum(cantidad_planificada)
from distribucion_productos_visitadores d
inner join muestras_medicas mm on mm.codigo=d.codigo_producto
inner join lineas l on l.codigo_linea=d.codigo_linea
where d.codigo_gestion='1015' and d.cod_ciclo='2' and d.grupo_salida=1 and d.codigo_producto='M99'
group by d.codigo_linea
ORDER BY mm.descripcion;

SELECT DISTINCT(rmd.cod_med) 
from rutero_maestro_cab_aprobado rmc, rutero_maestro_aprobado rm, rutero_maestro_detalle_aprobado rmd, medicos m
where rmc.cod_rutero=rm.cod_rutero and rm.cod_contacto = rmd.cod_contacto and m.cod_med = rmd.cod_med  
and rmc.estado_aprobado = '1' and rmc.codigo_linea = '1043' and rmc.codigo_ciclo = '2' and 
rmc.codigo_gestion = '1015' and rmc.cod_visitador = '1054';

SELECT fl.codigo_funcionario, f.cod_ciudad, f.codigo_lineaclave 
from funcionarios f,funcionarios_lineas fl 
where f.codigo_funcionario = fl.codigo_funcionario and fl.codigo_linea = '1043' and f.cod_cargo = '1011' 
and f.estado = 1  
order by fl.codigo_funcionario;

