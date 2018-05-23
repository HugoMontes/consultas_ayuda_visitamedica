select * 
from ingreso_almacenes ia
where ia.cod_ingreso_almacen in (90264,90263,90262); /*90264,90263,90262*/

select * 
from ingreso_detalle_almacenes iad
where iad.cod_ingreso_almacen in (90264,90263,90262);


select *
from muestras_medicas mm
where mm.codigo = '23060';

select i.nro_correlativo, id.cantidad_unitaria, i.observaciones, ti.nombre_tipoingreso
		from ingreso_almacenes i, ingreso_detalle_almacenes id, tipos_ingreso ti
		where i.cod_tipoingreso=ti.cod_tipoingreso and i.cod_ingreso_almacen=id.cod_ingreso_almacen and i.cod_almacen='1000' and
		i.grupo_ingreso=1 and i.ingreso_anulado=0 and id.cod_material='23060' and i.fecha='12/01/2018';

/*sa.nro_correlativo in (41942,41945,41955,41961,41966,41969,41971,41975,41979,41981,41983,41984,41994,41996,41997,41998,42001,42002,42005,42007,42009,42011,42012,42013,42014)
and sa.fecha BETWEEN '2018/01/01' and '2018/12/01'*/
/*Nro: 41942=161244,*/
select sad.*
from salida_almacenes sa
inner join salida_detalle_almacenes sad on sa.cod_salida_almacenes = sad.cod_salida_almacen
where sa.cod_salida_almacenes in (161244,161247,161257,161263,161268,161271,161273,161277,161281,161283,161285,161286,161296,161298,161299,161300,161303,161304,161307,161309,161311,161313,161314,161315,161316)
and sad.cod_material = '23060'
order by sad.cod_salida_almacen asc;

/*   consulta salidas detalle    */
select sad.*
from salida_detalle_almacenes sad 
where sad.cod_salida_almacen in (161244,161247,161257,161263,161268,161271,161273,161277,161281,161283,161285,161286,161296,161298,161299,161300,161303,161304,161307,161309,161311,161313,161314,161315,161316)
and sad.cod_material = '23060'
order by sad.cod_salida_almacen asc;

select * /**cod_ingreso_almacen = 90262*/
from salida_detalle_ingreso si 
where si.cod_salida_almacen in (161244,161247,161257,161263,161268,161271,161273,161277,161281,161283,161285,161286,161296,161298,161299,161300,161303,161304,161307,161309,161311,161313,161314,161315,161316)
and si.material in (23060)
order by cod_salida_almacen asc;

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

/* - - -  - - - - -- - - -- - - - - - UPDATE */
select d.*
from distribucion_productos_visitadores d
/*update distribucion_productos_visitadores
set cantidad_sacadaalmacen = 0*/
where codigo_gestion = 1014
and cod_ciclo = 11

GROUP BY d.cod_visitador
;

/* - - -  - - - - -- - - -- - - - - - DELETE */
select si.*
/*delete si.* */
from salida_detalle_ingreso si
INNER JOIN salida_almacenes sa on sa.cod_salida_almacenes = si.cod_salida_almacen
where sa.cod_almacen = 1000 
and sa.grupo_salida in (1,2)
and sa.cod_salida_almacenes >= 162120 and sa.cod_salida_almacenes <= 162308
;

/* - - -  - - - - -- - - -- - - - - - DELETE */
select sv.*
/*delete sv.* */
from salida_detalle_visitador sv
INNER JOIN salida_almacenes sa on sa.cod_salida_almacenes = sv.cod_salida_almacen
where sa.cod_almacen = 1000 
and sa.grupo_salida in (1,2)
and sa.cod_salida_almacenes >= 162120 and sa.cod_salida_almacenes <= 162308
;

/* - - -  - - - - -- - - -- - - - - - DELETE */
select sa.*
/*delete sa.* */
from salida_almacenes sa 
where sa.cod_almacen = 1000 
and sa.grupo_salida in (1,2)
and sa.cod_salida_almacenes >= 162120 and sa.cod_salida_almacenes <= 162308
;



select sa.cod_salida_almacenes
from salida_almacenes sa
where sa.cod_almacen = 1000 
and sa.grupo_salida in (1,2)
and sa.cod_salida_almacenes >= 162120 and sa.cod_salida_almacenes <= 162308
order by cod_salida_almacenes desc;


select r.cod_visitador, count(*)
from rutero_maestro_cab r 
where r.codigo_ciclo=11 and r.codigo_gestion=1014 and r.estado_aprobado=1
group by r.cod_visitador;

select * from tipos_salida;


select distinct sa.*
from salida_almacenes sa
inner join salida_detalle_almacenes sad on sa.cod_salida_almacenes = sad.cod_salida_almacen
where sa.nro_correlativo > 42171
and sa.cod_almacen = 1000
and sa.salida_anulada = 0
order by sad.cod_salida_almacen asc;

}
/* - - - -- - - - -- - - */

select DISTINCT r.cod_visitador, f.paterno, f.materno, f.nombres, f.estado, f.cod_ciudad, f.cod_cargo, r.codigo_linea
from rutero_maestro_cab r 
inner join funcionarios f on f.codigo_funcionario = r.cod_visitador
where r.codigo_ciclo=11 and r.codigo_gestion=1014 and r.estado_aprobado=1
and r.cod_visitador not in (
	select DISTINCT cod_visitador
	from distribucion_productos_visitadores
	where codigo_gestion='1014' and cod_ciclo='11'
)
group by r.cod_visitador;

select DISTINCT r.cod_visitador, f.paterno, f.materno, f.nombres, f.estado, f.cod_ciudad, f.cod_cargo, count(*)
from rutero_maestro_cab r 
inner join funcionarios f on f.codigo_funcionario = r.cod_visitador
where r.codigo_ciclo=11 and r.codigo_gestion=1014 and r.estado_aprobado=1
group by f.paterno, f.materno, f.nombres;

select *
/*delete d.* */
from distribucion_grupos_especiales d
where d.cod_ciclo = 11
and d.codigo_gestion = 1014;

select f.cod_zeus, f.codigo_funcionario, f.cod_ciudad, count(*) 
from funcionarios f
inner join (select DISTINCT ru.cod_visitador from rutero_maestro_cab_aprobado ru
where ru.codigo_ciclo = 11 and ru.codigo_gestion=1014 and ru.estado_aprobado = 1	
)r on r.cod_visitador = f.codigo_funcionario
where f.estado=1 
group by f.cod_zeus
order by f.cod_zeus, f.codigo_funcionario;


select mm.descripcion, mm.presentacion ,d.*
from distribucion_grupos_especiales d
INNER JOIN muestras_medicas mm on mm.codigo = d.codigo_producto
where d.cod_ciclo = 11
and d.codigo_gestion = 1014
order by mm.descripcion;













