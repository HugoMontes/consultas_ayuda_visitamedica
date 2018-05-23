select DISTINCT(m.cod_med), m.ap_pat_med, m.ap_mat_med, m.nom_med 
from medicos m, categorias_lineas c, medico_asignado_visitador v
where c.cod_med=m.cod_med and c.codigo_linea='1042' and c.cod_med=v.cod_med and v.codigo_visitador='1472' 
/*and m.cod_med = '1623582'*/
order by m.ap_pat_med;
/* j_contacto=737179  rutero=21673 */

select dia_contacto, turno 
from rutero_maestro 
where cod_contacto=737179 
and cod_visitador='1472';

select orden_visita,cod_med,cod_especialidad,categoria_med,cod_zona
from rutero_maestro_detalle 
where cod_contacto=737179 and cod_visitador='1472' order by orden_visita;

select orden_visita,rd.cod_visitador,rd.cod_med,cod_especialidad,categoria_med,cod_zona, m.ap_pat_med, m.ap_mat_med, m.nom_med, m.cod_ciudad
from rutero_maestro_detalle rd
LEFT JOIN medicos m on m.cod_med = rd.cod_med
where rd.cod_contacto in(
	select cod_contacto
	from rutero_maestro r
	where r.cod_rutero = 21673
)
and rd.cod_visitador='1472' order by orden_visita;

/*UPDATE rutero_maestro_detalle rd, medicos mn, medicos ma
set rd.cod_med = mn.cod_med*/
SELECT DISTINCT rd.cod_contacto, rd.cod_med as cod_ant, mn.cod_med as cod_nue
from rutero_maestro_detalle rd, medicos ma, medicos mn
where rd.cod_contacto in(
	select cod_contacto
	from rutero_maestro r
	where r.cod_rutero = 21673
)
and rd.cod_visitador='1472'
and rd.cod_med = ma.cod_med
and mn.cod_ciudad = 116
and mn.ap_pat_med = ma.ap_pat_med
and mn.ap_mat_med = ma.ap_mat_med
and mn.nom_med = ma.nom_med
and mn.cod_closeup = ma.cod_closeup
and mn.estado_registro = 1
/*and mn.cod_med > 1629400*/

;
/*SELECT DISTINCT rd.cod_contacto, rd.cod_med, ma.cod_med, ma.ap_pat_med,ma.ap_mat_med, mn.cod_med, mn.ap_pat_med, mn.ap_mat_med
from rutero_maestro_detalle rd, medicos ma, medicos mn */    /*and mn.cod_med > 1629400*/

/*-- - - - - - -  cod_med que se repite = 1622774 ----- dos codigos de un mismo doctor cod_ciudad=116, 1621857 y 1629665*/
select  x.cod_med,count(x.cod_med) as cant from (
SELECT DISTINCT rd.cod_med , mn.cod_med as cod_med_nuevo
from rutero_maestro_detalle rd
LEFT OUTER JOIN medicos ma on rd.cod_med = ma.cod_med
LEFT OUTER JOIN medicos mn on mn.ap_pat_med = ma.ap_pat_med and mn.ap_mat_med = ma.ap_mat_med and mn.nom_med = ma.nom_med and mn.cod_closeup = ma.cod_closeup 
where rd.cod_contacto in(
	select cod_contacto
	from rutero_maestro r
	where r.cod_rutero = 21673
  and r.cod_visitador='1472'
)
and mn.cod_ciudad = 116
and rd.cod_visitador='1472'
and mn.estado_registro = 1
/*and mn.cod_med > 1629400*/
order by ma.cod_med asc) x
group by x.cod_med
;

SELECT * from medicos m 
where m.ap_pat_med LIKE '%TICONA%'
AND m.nom_med LIKE '%ELIZABETH%'
AND m.ap_mat_med LIKE '%COAQUIRA%'
AND m.cod_med = 1625915;
/*-- - - - - - -  cod_med que se repite = 1622774 ----- dos codigos de un mismo doctor cod_ciudad=116, 1621857 y 1629665*/
SELECT rd.*
from rutero_maestro_detalle rd
LEFT OUTER JOIN medicos ma on rd.cod_med = ma.cod_med
where rd.cod_contacto in(
	select cod_contacto
	from rutero_maestro r
	where r.cod_rutero = 21673
  and r.cod_visitador='1472'
)
and ma.cod_ciudad != 116
