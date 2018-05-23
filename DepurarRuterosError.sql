select * from lineas l where l.estado=1 and l.linea_promocion=1; /* 1032=DOLOR-NEURO; 1046=GASTRO-LU; 1035=OSTEO-2; 1043=ANTIBIOTICOS; 1047=VIDILINE-LU */

select rda.*
from rutero_maestro_cab_aprobado r
INNER JOIN rutero_maestro_aprobado ra on ra.cod_rutero = r.cod_rutero /*and ra.cod_visitador = r.cod_visitador*/
INNER JOIN rutero_maestro_detalle_aprobado rda on rda.cod_contacto = ra.cod_contacto /*and rda.cod_visitador = ra.cod_visitador*/
where r.codigo_linea = '1046'
and r.codigo_gestion = '1015'
and r.codigo_ciclo = '1'
and rda.cod_med in (4442,4458,1620706);





