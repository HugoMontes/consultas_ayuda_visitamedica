select *
from rutero_maestro_cab r
where r.cod_visitador='1488' and r.codigo_gestion='1015';

SELECT r.COD_CONTACTO, r.nombre_medico, r.COD_ESPE, r.COD_CAT, r.FECHA_REGISTRO,r.HORA_REGISTRO,r.FECHA_VISITA
			, r.COD_MUESTRA, cant_mm, r.COD_MATERIAL, cant_ma
			, b.cod_contacto, b.id_medico, b.fecha,b.fecha_visita, b.id_boleta, b.codigo_muestra,b.cantidad_muestra, b.especialidad
			from (select rs.COD_CONTACTO, rs.COD_ESPE, rs.COD_CAT, rs.COD_DIA_CONTACTO,rs.FECHA_REGISTRO,rs.HORA_REGISTRO,rs.FECHA_VISITA, rs.COD_MED
					, CONCAT(m.ap_pat_med,' ',m.ap_mat_med,' ',m.nom_med) as nombre_medico
					, rd.COD_MUESTRA, mm.descripcion,(ifnull(rd.CANT_MM_ENT,0) + ifnull(rd.CANT_MM_EXTENT,0)) as cant_mm
					, rd.COD_MATERIAL, ma.descripcion_material,(IFNULL(rd.CANT_MAT_ENT,0) + IFNULL(rd.CANT_MAT_EXTENT,0)) cant_ma
					from reg_visita_cab rs
					INNER JOIN reg_visita_detalle rd ON rs.COD_REG_VISITA = rd.COD_REG_VISITA
					LEFT JOIN medicos m on m.cod_med=rs.COD_MED
					LEFT JOIN muestras_medicas mm on mm.codigo=rd.COD_MUESTRA
					LEFT JOIN material_apoyo ma on ma.codigo_material=rd.COD_MATERIAL
					where rs.COD_CICLO = '1'  
					and rs.COD_GESTION = '1015' 
					and rs.COD_VISITADOR='1431' 
			) r
			left join (
						select bs.*, CONCAT(bd.codigo_muestra,'-',bd.muestra) as bo_muestra, bd.cantidad_muestra, bd.material as bo_material,bd.cantidad_material 
						from (select id_boleta, cod_contacto, id_medico, especialidad, fecha, fecha_visita
								from boletas_visita_cabXXX 
								where id_ciclo='1' and id_gestion='1015' and id_visitador_hermes='1431'
						) bs
						inner join boletas_visita_detalleXXX bd on bd.id_boleta=bs.id_boleta
			) b on b.cod_contacto=r.COD_CONTACTO and b.id_medico=r.COD_MED and b.codigo_muestra=r.COD_MUESTRA

			order by r.cod_contacto, r.cod_med, r.COD_MUESTRA;
