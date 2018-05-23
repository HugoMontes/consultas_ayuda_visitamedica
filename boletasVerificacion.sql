SELECT *
from medicos m
where m.ap_pat_med like'%CAMPOS%'
AND m.nom_med LIKE '%RENE%';

select * from lineas l where l.estado=1 and l.linea_promocion=1; /*ANTIBIO=1043;OSTEO-MIX=1042;GASTRO-LU=1046*/

select b.id_boleta,b.fecha, b.*
from boletas_visita_cabXXX b
/*LEFT JOIN boletas_visita_detalleXXX bd on bd.id_boleta = b.id_boleta*/
where b.id_visitador_hermes = '1290' /*and b.fecha='2018-03-09'*/
and b.id_medico = '4442';
/*CONTAR BOLETAS*/
SELECT count(*) from boletas_visita_cabXXX b 
where b.id_ciclo='1' and b.id_gestion='1015' ;

SELECT count(*) 
from rutero_maestro_aprobado r, rutero_maestro_cab_aprobado rmc, 
	rutero_maestro_detalle_aprobado rd 
where rmc.cod_rutero=r.cod_rutero and r.cod_contacto=rd.cod_contacto and rmc.estado_aprobado=1 
	and r.cod_visitador='1290' and rmc.cod_visitador=r.cod_visitador and r.cod_visitador=rd.cod_visitador 
	and rmc.codigo_linea='1046' and r.cod_contacto=rd.cod_contacto and rmc.codigo_ciclo='11' 
	and rmc.codigo_gestion='1014';

/*LISTA BOLETAS VACIAS*/
select b.territorio,b.id_boleta,b.cod_contacto,b.fecha,b.id_visitador_hermes,b.visitador,b.linea, b.id_medico, b.medico, bd.*
from boletas_visita_cabXXX b
LEFT JOIN boletas_visita_detalleXXX bd on bd.id_boleta = b.id_boleta
INNER JOIN (select nombre_linea, codigo_linea from lineas where estado='1' and linea_promocion='1') l on l.nombre_linea = b.linea
where bd.id_boleta is null
and b.id_ciclo='1' and b.id_gestion='1015'
and b.linea != 'VIDILINE LU' and b.id_visitador_hermes!='1458'
order by b.territorio,b.visitador
;
/*POR USUARIO*/
select b.id_boleta,b.cod_contacto,b.fecha,b.id_visitador_hermes,b.visitador,b.linea, b.id_medico, b.medico, bd.*
from boletas_visita_cabXXX b
LEFT JOIN boletas_visita_detalleXXX bd on bd.id_boleta = b.id_boleta
INNER JOIN (select nombre_linea from lineas where codigo_linea='1046') l on l.nombre_linea = b.linea
where bd.id_boleta is null
and b.id_visitador_hermes='1387'
order by fecha
;


/*LOGS - -- - -- - - -- - -*/
update boletas_visita_detalleXXX set material='--', cantidad_material='0' 
	where material='Sin Material Apoyo'