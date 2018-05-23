select max(id_boleta) /*3626236; 6=2012135; copy=264906*/
from boletas_visita_cabXXX
;
select min(id_boleta) /*7=2200000; */
from boletas_visita_cabXXX8
;
select count(*) /*28584/32537/30766/43968/26237/30191*/
from boletas_visita_cabXXX11
;
select DISTINCT id_ciclo, id_gestion
from boletas_visita_cabXXX_copy1
;
select *
from boletas_visita_cabXXX11
where id_ciclo is null
;
insert into boletas_visita_cabXXX_ant
select *
from boletas_visita_cabXXX_ant
where id_ciclo=6

select * from ciudades;

select *
from lineas l
/*where l.estado=1 and l.linea_promocion=1*/
ORDER BY l.codigo_linea;

select count(*) 
from boletas_visita_cabXXX_ant b
where b.id_ciclo='5' and bd.id_boleta is null;

select count(*) 
from boletas_visita_cabXXX_ant b
left join boletas_visita_detalleXXX_ant bd on b.id_boleta=bd.id_boleta
where b.id_ciclo='6' and bd.id_boleta is null;


/* - - - - - - - - - - - - - - - - */
select count(*) from boletas_visita_detalleXXX11; /* 219667 */

/*NRO DETALLE NULO*/ 
select count(*)
from boletas_visita_cabXXX_copy1 b
left join boletas_visita_detalleXXX_copy1 bd on b.id_boleta=bd.id_boleta
where bd.id_boleta is null;

/*NRO DETALLE NO NULO*/ 
select count(*)
from boletas_visita_cabXXX11 b
left join boletas_visita_detalleXXX11 bd on b.id_boleta=bd.id_boleta
where bd.id_boleta is not null;

/*NRO DETALLE NO ASOCIADO A CABECERA*/ 
select count(*)
from boletas_visita_detalleXXX11 bd 
left join boletas_visita_cabXXX11 b on b.id_boleta=bd.id_boleta
where b.id_boleta is null;

insert into boletas_visita_detalleXXX_ant
select *
from boletas_visita_detalleXXX_copy1


