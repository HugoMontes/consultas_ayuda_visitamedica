/*--------------- cantidad de datos ------------------  185947*/
/*select *
from funcionarios f
where f.cod_zeus is null and f.estado=1 
order by f.codigo_funcionario desc;*/
 /*226777/*/
select count(*) as cant
from parrilla_personalizada p
where p.cod_gestion = '1015'
and p.cod_ciclo = '3'
and cod_ma!='0' and cantidad_ma!=0;

select count(*) as cant /*4334*/
from medicos_parrillapersonalizada p
where p.cod_gestion = '1015'
and p.cod_ciclo = '3';

select count(*) as cant 
from parrillaconjunta p; /*5394*/
/*-------------------------*/
/*---2625 LINEA VIDILINE*/
/*select count(*) as cant  
from parrilla_personalizada
where cod_gestion = '1015'
and cod_ciclo = '2'
and cod_linea = '1047';*/

/*delete from parrilla_personalizada
where cod_gestion = '1015'
and cod_ciclo = '3';

delete from parrillaconjunta;

delete from medicos_parrillapersonalizada
where cod_gestion = '1015'
and cod_ciclo = '3';*/

/*update parrilla_personalizada set cod_ma='0', cantidad_ma=0
where cod_gestion='1014' 
and cod_ciclo='10'*/

select * from lineas l where l.estado=1 and l.linea_promocion=1; /*VIDILINE=1047;ANTIBIOTICOS=1043;DOLOR-NEURO=1032*/

select count(*) as cant 
from parrilla_personalizada p
where p.cod_gestion = '1015'
and p.cod_ciclo = '3'
and p.cod_linea='1047';

/*- - - - - - - - - - - - CONTAR CONTACTOS RUTEROS POR CICLO - QUERY SUPER SPEED!!!! XD JUST TRY IT!!!*/
/*RUTEROS APROBADOS*/   /*153/4663/32839 */
/*select cod_rutero,rd.cod_contacto, rd.cod_med, rd.cod_especialidad, rd.orden_visita  */
select count(*)
from (
	select cod_contacto, rcs.cod_rutero  
	from ( 
		select cod_rutero 
		from rutero_maestro_cab_aprobado
		where codigo_ciclo='3' and codigo_gestion='1015'
	) rcs
	INNER JOIN rutero_maestro_aprobado rms on rcs.cod_rutero=rms.cod_rutero
	/*where rms.cod_ciclo_dia_contacto is null*/
) rm
INNER JOIN rutero_maestro_detalle_aprobado rd on rm.cod_contacto=rd.cod_contacto 
where rd.cod_med='4641' and rd.cod_especialidad='OFT'; /*rd.cod_visitador is null*/ ; 

/*RUTEROS BORRADORES*/   /*156/4535/33338*/

select count(*)
select rd.cod_contacto, rd.cod_med, rd.cod_especialidad, rd.orden_visita   
from (
	select cod_contacto  
	from ( 
		select cod_rutero 
		from rutero_maestro_cab
		where codigo_ciclo='2' and codigo_gestion='1014' 
	) rcs
	INNER JOIN rutero_maestro rms on rcs.cod_rutero=rms.cod_rutero
	/*where rms.cod_visitador='0'*/
) rm
INNER JOIN rutero_maestro_detalle rd on rm.cod_contacto=rd.cod_contacto
where rd.cod_med='1743'; 

select *
from medicos m
where m.cod_med='1743'

select p.*
from parrilla_personalizada p
where p.cod_gestion = '1015'
and p.cod_ciclo = '2' 
and p.cod_med = '0';

/*VERIFICACION PARRILLAS MATERIAL DE APOYO y LINEAS DE RUTERO*/
SELECT ru.descripcion, ru.nombre_linea, ru.cant_ruteros, ifnull(dis.suma_ma,0) as cant_ma
FROM (
	select c.cod_ciudad, c.descripcion, l.codigo_linea, l.nombre_linea, count(*) as cant_ruteros
	from rutero_maestro_cab_aprobado rc
	inner join lineas l on l.codigo_linea=rc.codigo_linea
	inner join funcionarios f on f.codigo_funcionario=rc.cod_visitador
	inner join ciudades c on c.cod_ciudad=f.cod_ciudad
	where rc.codigo_gestion='1015'
	and rc.codigo_ciclo='2'
	GROUP BY f.cod_ciudad, rc.codigo_linea
)ru
left join (
	select m.cod_ciudad, p.cod_linea, p.cod_med, sum(cantidad_ma) as suma_ma
	from parrilla_personalizada p
	inner join medicos m on m.cod_med = p.cod_med
	where p.cod_gestion = '1015'
	and p.cod_ciclo = '2' 
	and cod_ma!='0' and cantidad_ma!=0
	group by m.cod_ciudad,p.cod_linea,p.cod_med
) dis on dis.cod_ciudad=ru.cod_ciudad and dis.cod_linea=ru.codigo_linea

/*- - - - - - - BOLETAS - MATERIAL DE APOYO - - - - - - - */
select b.territorio,b.linea,b.visitador, bd.*
from boletas_visita_cabXXX b
inner join boletas_visita_detalleXXX bd on bd.id_boleta=b.id_boleta
where b.id_ciclo='11'
and id_gestion='1014'
and b.linea='ANTIBIOTICOS'
and bd.cantidad_material !=0
and b.territorio='Potosi'

/*- - - - - - - CIUDADES - - - LINEAS  - - - - - - - */
select * from ciudades;
select * from lineas where estado=1 and linea_promocion=1;}

/* COMPARA RUTEROS Y PARRILLAS*/ /*3429*/
select *
from(
	select rm.codigo_linea, rd.cod_med, count(*) cant_con
	from (
		select cod_contacto, rcs.cod_rutero, codigo_linea  
		from ( 
			select cod_rutero, codigo_linea 
			from rutero_maestro_cab_aprobado
			where codigo_ciclo='2' and codigo_gestion='1015' and estado_aprobado=1
		) rcs
		INNER JOIN rutero_maestro_aprobado rms on rcs.cod_rutero=rms.cod_rutero
	) rm
	INNER JOIN rutero_maestro_detalle_aprobado rd on rm.cod_contacto=rd.cod_contacto
	group by rm.codigo_linea, rd.cod_med
)r
LEFT JOIN (
	SELECT cod_linea, cod_med, count(*) as cant_parr
	from (
		select cod_linea, cod_med, numero_visita
		from parrilla_personalizada p 
		where p.cod_ciclo='2' and  p.cod_gestion='1015' 
		group by cod_linea, cod_med, numero_visita
	) ps
	group by cod_linea, cod_med
) p on p.cod_linea=r.codigo_linea and p.cod_med=r.cod_med
where r.cant_con!=p.cant_parr
;

select count(*) 
from rutero_maestro_cab_aprobado rc, rutero_maestro_aprobado rm, rutero_maestro_detalle_aprobado rd
where rc.cod_rutero=rm.cod_rutero and rm.cod_contacto=rd.cod_contacto and rc.cod_visitador=rm.cod_visitador  
and rm.cod_visitador=rd.cod_visitador and rc.codigo_gestion='1015' 
and rc.codigo_ciclo='2' and rd.
;

select rm.codigo_linea, rd.cod_med, count(*) cant_con
	from (
		select cod_contacto, rcs.cod_rutero, codigo_linea  
		from ( 
			select cod_rutero, codigo_linea 
			from rutero_maestro_cab_aprobado
			where codigo_ciclo='2' and codigo_gestion='1015' and estado_aprobado=1
		) rcs
		INNER JOIN rutero_maestro_aprobado rms on rcs.cod_rutero=rms.cod_rutero
	) rm
	INNER JOIN rutero_maestro_detalle_aprobado rd on rm.cod_contacto=rd.cod_contacto
	group by rm.codigo_linea, rd.cod_med
;



