select * from lineas where codigo_linea  in (1026,1027); select * from ciudades;

select * from rutero

select m.cod_med, m.ap_pat_med, m.ap_mat_med, m.nom_med, m.categorizacion_medico, m.estado_registro, m.cod_ciudad, c.descripcion
from medicos m
inner join ciudades c on c.cod_ciudad=m.cod_ciudad
where m.cod_ciudad='102' and (m.ap_pat_med LIKE '%torrejon%' OR m.ap_mat_med LIKE '%valdez%')  AND m.nom_med like '%F%'

select * from medicos_nuevos where cod_med > 1631409
order by ap_pat_med, ap_mat_med;

update medicos set cod_closeup = '', estado_registro = '1', fecha_aprobado = date(SYSDATE()) where cod_med = '1627548' 

select *
from medicos m
where m.cod_med='1631217';

select *
from muestras_medicas mm
where mm.codigo_linea = '1050'
and mm.descripcion like '%TERADOL 500 mg/1 ml gts orales fco MM x 5 ml%'

select cod_med, ap_pat_med, ap_mat_med, nom_med, hobbie_med, hobbie_med2, estado_civil_med, estado_civil_med, perfil_psicografico_med
, cod_ciudad, cod_catcloseup, cod_closeup, estado_registro, cod_visitador, categorizacion_medico, fecha_registro, fecha_pre_aprobado, fecha_aprobado
from medicos;

select max(cod_med) from medicos; /* 1630185 - 1631068 / 1631409 - 1631505 */ 
update medicos set estado_registro = '1' , cod_closeup = '' where cod_med = '1627210' 

select count(*) /*trinidad=91; elAto=58; QLL=4*/
from medicos_nuevos mn
where mn.ap_pat_med like '%VELASCO%'; 

select m.cod_med, m.ap_pat_med, m.ap_mat_med, m.nom_med, m.cod_ciudad, m.estado_registro, m.cod_closeup
		from medicos m;

/* - - - - - - - - - VERIFICACION MEDICOS REPETIDOS*/
select * from(
select m.ap_pat_med, m.ap_mat_med, m.nom_med, count(*) as cant
from medicos_nuevos m
group by m.ap_pat_med, m.ap_mat_med, m.nom_med) x
where cant>1;
select * from(
select cod_closeup, count(*) as cant
from medicos_nuevos m
group by m.cod_closeup) x
where cant>1;
update medicos_nuevos set cod_closeup=''
where cod_closeup='0'

/*delete from medicos where cod_med > 1630185;*/
select m.cod_med, m.ap_pat_med, m.ap_mat_med, m.nom_med, m.estado_civil_med, m.cod_ciudad
, m.cod_catcloseup, m.cod_closeup, m.categorizacion_medico, m.especialidad, m.cod_visitador
from medicos_nuevos m;

select *
from medicos m
where ( CONCAT('%',REPLACE(TRIM(m.ap_pat_med),' ','%'),'%') like CONCAT('%',REPLACE(TRIM('MAIDA'),' ','%'),'%')
	OR CONCAT('%',REPLACE(TRIM('MAIDA'),' ','%'),'%') like CONCAT('%',REPLACE(TRIM(m.ap_pat_med),' ','%'),'%') )
and ( CONCAT('%',REPLACE(TRIM(m.ap_mat_med),' ','%'),'%') like CONCAT('%',REPLACE(TRIM('TERCEROS'),' ','%'),'%')
	OR CONCAT('%',REPLACE(TRIM('TERCEROS'),' ','%'),'%') like CONCAT('%',REPLACE(TRIM(m.ap_mat_med),' ','%'),'%') )
and ( CONCAT('%',REPLACE(TRIM(m.nom_med),' ','%'),'%') like CONCAT('%',REPLACE(TRIM('ARTURO '),' ','%'),'%')
	OR CONCAT('%',REPLACE(TRIM('ARTURO '),' ','%'),'%') like CONCAT('%',REPLACE(TRIM(m.nom_med),' ','%'),'%') );


select cod_med,cod_especialidad,cod_tipo_especialidad from especialidades_medicos limit 10;
insert into especialidades_medicos(cod_med,cod_especialidad,cod_tipo_especialidad) values();

select cod_med,codigo_visitador,codigo_linea from medico_asignado_visitador limit 10;
insert into medico_asignado_visitador(cod_med,codigo_visitador,codigo_linea) values();

select * from lineas where estado=1 and linea_promocion=1;

select * from (
select m.cod_closeup, m.ap_pat_med, m.ap_mat_med, m.nom_med, count(*) as cant
from medicos_nuevos m
group by m.cod_closeup
) x
where cant >1;

select *
from medicos_nuevos m where cod_closeup in (38077055,46739541,33945859,1279,36513956,70137120,44716089,793,71852466)
or (ap_pat_med ='MAIRANA' and ap_mat_med='BUTRON DE GUIAZADA' and nom_med='RUTH')
order by m.ap_pat_med, m.ap_mat_med, m.nom_med;

update /*select * from*/ medicos_nuevos set cod_closeup='71852466', cod_ciudad='116'
where ap_pat_med ='PE#ARRIETA' and ap_mat_med='CARDONA' and nom_med='VANIA LUCIA '
and cod_visitador = '1491,1489';

select * from medicos 
where ap_pat_med ='PE#ARRIETA' and ap_mat_med='CARDONA' and nom_med='VANIA LUCIA ';

select * from ciudades; 

/** - - - - -- - - -DESASIGNAR - - - - - - - - - - - **/
select * /* delete em.* */
from especialidades_medicos em
where em.cod_med in (
	select m.cod_med 
	from medicos m
	where m.cod_med>1630185 and m.cod_med<1631069 and m.cod_ciudad ='113'
)
em.cod_med > 1630185 ;

select * /* delete cl.* */
from categorias_lineas cl
where cl.cod_med in (
	select m.cod_med 
	from medicos m
	where m.cod_med>1630185 and m.cod_med<1631069 and m.cod_ciudad ='113'
)
cl.cod_med > 1630185;

select * /* delete dm.* */
from direcciones_medicos dm
where dm.cod_med in (
	select m.cod_med 
	from medicos m
	where m.cod_med>1630185 and m.cod_med<1631069 and m.cod_ciudad ='113'
)
dm.cod_med > 1630185 ;

select * /* delete mv.* */
from medico_asignado_visitador mv
where mv.cod_med in (
	select m.cod_med 
	from medicos m
	where m.cod_med>1630185 and m.cod_med<1631069 and m.cod_ciudad ='113'
)
and codigo_linea='1050' and mv.cod_med > 1630185 ;

/*33 trinidad*/
select m.cod_med delete m.* 
from medicos m
where m.cod_med>1630185 and m.cod_med<1631069 and m.cod_ciudad ='113';
 
