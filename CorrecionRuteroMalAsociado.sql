/* - - - - - -  CORRECCION RUTERO MAL ASOCIADO  - - - - - - - -*/
select *
FROM rutero_maestro_cab r
where r.cod_visitador = 1345
and r.codigo_linea = 1046
;


select *
FROM rutero_maestro_cab_aprobado ra 
where ra.cod_visitador = 1345
and ra.codigo_linea = 1046
ORDER BY ra.cod_rutero desc
;


select *
from rutero_maestro_aprobado r
where r.cod_visitador = 1345
and r. = 1046
;