/* DISTRIBUCION DE MM A VISITADOR */

select max(id_boleta) /*3626236*/
from boletas_visita_cabXXX_ant b
where b.id_ciclo='10' and b.id_gestion='1014';

select min(id_boleta) /*3700000*/
from boletas_visita_cabXXX_ant b
where b.id_ciclo='11' and b.id_gestion='1014';

select *
from muestras_medicas mm
where mm.descripcion like '%TRASSIL 1 g MM x 1 sobre%'; /*codMM=CFCO0121; CFC00139*/

SELECT r.COD_REG_VISITA, r.COD_CONTACTO, r.COD_MED, COD_ESPE, r.COD_CAT, b.especialidad, COD_DIA_CONTACTO,r.FECHA_REGISTRO,b.fecha,r.HORA_REGISTRO,r.FECHA_VISITA,b.fecha_visita
, rd.COD_MUESTRA, rd.CANT_MM_ENT,rd.CANT_MM_EXTENT, rd.COD_MATERIAL,rd.CANT_MAT_ENT, rd.CANT_MAT_EXTENT
from reg_visita_cab r
INNER JOIN reg_visita_detalle rd ON r.COD_REG_VISITA = rd.COD_REG_VISITA
inner join (
			select bs.* 
			from (select id_boleta, cod_contacto, id_medico, especialidad, fecha, fecha_visita
					from boletas_visita_cabXXX_ant 
					where id_ciclo='11' and id_gestion='1014' and id_visitador_hermes='1204'
			) bs
			inner join boletas_visita_detalleXXX_ant bd on bd.id_boleta=bs.id_boleta
			where bd.codigo_muestra='CFCO0121'
) b on b.cod_contacto=r.COD_CONTACTO and b.id_medico=r.COD_MED 
where r.COD_CICLO = '11'  
and r.COD_GESTION = '1014' 
and r.COD_VISITADOR='1204' 
and rd.COD_MUESTRA='CFCO0121' 
and r.FECHA_REGISTRO=DATE(b.fecha_visita)
order by r.cod_contacto, r.cod_med
;
select mm.descripcion, x.*
from (
		SELECT rd.COD_MUESTRA,cant_ent, (sum(rd.CANT_MM_ENT)+sum(rd.CANT_MM_EXTENT)) as cant_dist
		from (
					select *
					from reg_visita_cab
					where COD_CICLO = '11'  
						and COD_GESTION = '1014' 
						and COD_VISITADOR='1204'
		) r
		INNER JOIN reg_visita_detalle rd ON r.COD_REG_VISITA = rd.COD_REG_VISITA
		inner join (
					select DISTINCT bs.*,bd.codigo_muestra 
					from (select DISTINCT id_boleta, cod_contacto, id_medico, especialidad, fecha, fecha_visita
							from boletas_visita_cabXXX_ant 
							where id_ciclo='11' and id_gestion='1014' and id_visitador_hermes='1204' and estado=1
					) bs
					inner join boletas_visita_detalleXXX_ant bd on bd.id_boleta=bs.id_boleta 			
		) b on b.cod_contacto=r.COD_CONTACTO and b.id_medico=r.COD_MED and rd.COD_MUESTRA=b.codigo_muestra
		inner join (SELECT m.codigo, sum(sd.cantidad_unitaria) as cant_ent
								from salida_detalle_visitador sv, salida_detalle_almacenes sd, muestras_medicas m, salida_almacenes s
								where sv.cod_salida_almacen = sd.cod_salida_almacen and s.salida_anulada=0 and s.cod_salida_almacenes=sv.cod_salida_almacen
								and s.cod_salida_almacenes=sd.cod_salida_almacen and
								m.codigo=sd.cod_material and sv.codigo_ciclo = '11' and sv.codigo_gestion ='1014' and 
								sv.codigo_funcionario='1204' group by sd.cod_material
		) s on s.codigo=rd.COD_MUESTRA
		where 1=1 /*r.FECHA_REGISTRO=DATE(b.fecha_visita)*/
		group by rd.COD_MUESTRA
) x
inner join muestras_medicas mm on mm.codigo=x.COD_MUESTRA
order by mm.descripcion;

SELECT mm.descripcion, rd.COD_MUESTRA, (sum(rd.CANT_MM_ENT)+sum(rd.CANT_MM_EXTENT)) as cantidad 
from reg_visita_cab r
inner JOIN reg_visita_detalle rd on r.COD_REG_VISITA = rd.COD_REG_VISITA
inner join muestras_medicas mm on mm.codigo=rd.COD_MUESTRA
where r.COD_CICLO = '7' and 
r.COD_GESTION = '1014' and r.COD_VISITADOR='1204'
group by rd.COD_MUESTRA
order by 

select DISTINCT b.id_ciclo, b.id_gestion
from boletas_visita_cabXXX b

select DISTINCT COD_CICLO, COD_GESTION
from reg_visita_cab


SELECT r.COD_REG_VISITA, r.COD_CONTACTO, r.COD_MED, r.COD_CAT, COD_DIA_CONTACTO,r.FECHA_REGISTRO,HORA_REGISTRO,FECHA_VISITA
, rd.COD_MUESTRA, rd.CANT_MM_ENT,rd.CANT_MM_EXTENT, rd.COD_MATERIAL,rd.CANT_MAT_ENT, rd.CANT_MAT_EXTENT
from reg_visita_cab r
INNER JOIN reg_visita_detalle rd ON r.COD_REG_VISITA = rd.COD_REG_VISITA
where r.COD_CICLO = '11'  
and r.COD_GESTION = '1014' 
and r.COD_VISITADOR='1204' 
and rd.COD_MUESTRA='CFCO0121' 
order by r.cod_contacto, r.cod_med
group by rd.COD_MUESTRA;

select b.id_boleta, b.cod_contacto, b.id_medico, b.fecha, bd.muestra, bd.cantidad_muestra
from (select * from boletas_visita_cabXXX_ant where id_ciclo='11' and id_gestion='1014' and id_visitador_hermes='1204') b
inner join boletas_visita_detalleXXX_ant bd on bd.id_boleta=b.id_boleta
where bd.codigo_muestra='CFCO0121'
order by b.cod_contacto, b.id_medico;

select rc.codigo_gestion, rc.codigo_ciclo, rm.cod_visitador, rd.cod_med, rd.cod_especialidad, rd.categoria_med, o.nro_dia
from rutero_maestro_detalle_aprobado rd, rutero_maestro_aprobado rm, ciclo_dia_contacto o, rutero_maestro_cab_aprobado rc
where rc.cod_rutero=rm.cod_rutero and rd.cod_contacto=rm.cod_contacto and rd.cod_visitador=rm.cod_visitador
				and rc.cod_visitador=rm.cod_visitador and o.dia_contacto=rm.dia_contacto and o.cod_ciclo='11' and o.cod_gestion='1014'
				and rd.cod_contacto='747577' and rd.cod_med='5224';

select * 
FROM funcionarios f
where f.cod_zeus='1238'
and f.codigo_funcionario='1204'

