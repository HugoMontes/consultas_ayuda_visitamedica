SELECT f.codigo_funcionario, f.paterno, f.materno, f.nombres from funcionarios f  
where f.codigo_funcionario in (1425) order by f.paterno, f.materno
;

SELECT * from rutero_maestro_cab_aprobado rc, rutero_maestro_aprobado r, 
	rutero_maestro_detalle_aprobado rd where rc.cod_rutero=r.cod_rutero and rd.cod_contacto=r.cod_contacto and 
	rc.cod_visitador=1425 and rc.codigo_ciclo='8' and rc.codigo_gestion='1014' and 
	rd.categoria_med='A' and rc.estado_aprobado=1
;

SELECT * from rutero_maestro_cab rc, rutero_maestro r, 
	rutero_maestro_detalle rd where rc.cod_rutero=r.cod_rutero and rd.cod_contacto=r.cod_contacto and 
	rc.cod_visitador=1425 and rc.codigo_ciclo='8' and rc.codigo_gestion='1014' and 
	rd.categoria_med='C' and rc.estado_aprobado=1
;

select * from rutero_maestro_cab rc
where rc.cod_visitador=1425 and rc.codigo_ciclo='8' and rc.codigo_gestion='1014';

select rd.cod_contacto
from rutero_maestro_aprobado r
inner join rutero_maestro_detalle_aprobado rd on r.cod_contacto= rd.cod_contacto
where r.cod_rutero in (21102,21098) and r.cod_visitador = 1425 ;

select r.cod_contacto
from rutero_maestro_aprobado r
where r.cod_rutero in (21102,21098) and r.cod_visitador = 1425 ;

SELECT * from rutero_maestro_cab_aprobado rc
where rc.cod_visitador = 1425 and rc.codigo_gestion=1014 and rc.codigo_ciclo=8
/*------------------------*/
DELETE from rutero_maestro_detalle_aprobado
SELECT * from rutero_maestro_detalle_aprobado
where cod_contacto in (
	select cod_contacto
	from rutero_maestro_aprobado	
	where cod_rutero = 21098 and cod_visitador = 1425
) 

delete from rutero_maestro_aprobado
where cod_rutero = 21102 and cod_visitador = 1425 ;

/*   inserts*/
insert into rutero_maestro_aprobado
select * 
from rutero_maestro
where cod_rutero = 21098 and cod_visitador = 1425 ;
 
insert into rutero_maestro_detalle_aprobado
select *
from rutero_maestro_detalle
where cod_contacto in (
select cod_contacto
from rutero_maestro
where cod_rutero = 21098 and cod_visitador = 1425
);

insert into rutero_maestro_cab_aprobado
SELECT * 
from rutero_maestro_cab
where cod_rutero =21098



select *
from  rutero_maestro_detalle_aprobado rd
where rd.

SELECT count(*)
from rutero_maestro_cab rc, rutero_maestro r, 
	rutero_maestro_detalle rd where rc.cod_rutero=r.cod_rutero and rd.cod_contacto=r.cod_contacto and 
	rc.cod_visitador=1425 and rc.codigo_ciclo='8' and rc.codigo_gestion='1014' and 
	rd.categoria_med in ('A','B','C') 
;

SELECT count(*)
FROM boletas_visita_cabXXX8 b
where b.id_visitador_hermes = 1425
and 
