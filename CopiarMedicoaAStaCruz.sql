/* copiar medicos periferia a sta cruz*/
select (select max(cod_med)+1 from medicos), ap_pat_med, ap_mat_med, nom_med, fecha_nac_med, telf_med, telf_celular_med, email_med, hobbie_med, hobbie_med2, estado_civil_med, nombre_secre_med, perfil_psicografico_med, cod_ciudad, cod_catcloseup, cod_closeup, estado_registro, cod_visitador, categorizacion_medico, SYSDATE()  
from medicos m
where m.cod_med in (5702,6055);

insert into medicos (cod_med, ap_pat_med, ap_mat_med, nom_med, fecha_nac_med, telf_med, telf_celular_med, email_med, hobbie_med, hobbie_med2, estado_civil_med, nombre_secre_med, perfil_psicografico_med, cod_ciudad, cod_catcloseup, cod_closeup, estado_registro, cod_visitador, categorizacion_medico, fecha_registro)  

from medicos m
where m.cod_med in (5702,6055);

select *
from medicos m
where m.cod_med in (5702,6055);

select max(cod_med)+1 from medicos;  /*  1629491  */

insert into medicos 
SELECT (select max(cod_med)+1 from medicos), ap_pat_med, ap_mat_med, nom_med, fecha_nac_med, telf_med, telf_celular_med, email_med, hobbie_med, hobbie_med2, estado_civil_med, nombre_secre_med, perfil_psicografico_med, 116, cod_catcloseup, cod_closeup, estado_registro, cod_visitador, categorizacion_medico, SYSDATE(), null,null,cod_med 
FROM medicos 
WHERE cod_med = 1625915;  /*1629973*/

select * from medicos where cod_ant_med is not null;
select count(*) from medicos where cod_ant_med is not null;  /* 449 */
select cod_med from medicos where cod_ant_med = ; 

/* - - - - - - - - - - - - - DIRECCIONES_MEDICOS - - - - - - - - - - - - - - - - - - - - - - - - */
select * FROM direcciones_medicos dm where cod_med = 1629965;

select * from  distritos d where d.cod_ciudad = 116;

select * from zonas z where z.cod_dist = 110;

/* INSERT direcciones_medicos - - - - - - 449 filas insertadas*/
insert into direcciones_medicos
SELECT m.cod_med, 64, direccion, direccionvial, num_casa, numero_direccion, cod_tipo_consultorio, cod_centro_medico 
FROM direcciones_medicos dm
inner join medicos m on m.cod_ant_med = dm.cod_med
WHERE cod_ant_med is not null;

insert into direcciones_medicos
SELECT m.cod_med, 64, direccion, direccionvial, num_casa, numero_direccion, cod_tipo_consultorio, cod_centro_medico 
FROM direcciones_medicos dm
inner join medicos m on m.cod_ant_med = dm.cod_med
where m.cod_ant_med = 1625915


/* - - - - - - - - - - - - - ESPECIALIDADES - - - - - - - - - - - - - - - - - - - - - - - - */
/* INSERT especialidades_medicos - - - - - - 497 filas insertadas*/
insert into especialidades_medicos
SELECT m.cod_med, cod_especialidad, cod_tipo_especialidad
from especialidades_medicos em
inner join medicos m on em.cod_med = m.cod_ant_med

insert into especialidades_medicos
SELECT m.cod_med, cod_especialidad, cod_tipo_especialidad
from especialidades_medicos em
inner join medicos m on em.cod_med = m.cod_ant_med
where m.cod_ant_med = 1625915

/*  MEDICOS REPETIDOS */

SELECT * 
FROM  medicos m
WHERE m.cod_ciudad = 116
and cod_med in (1621857,1629665);

select count(*) as cant
from rutero_maestro_detalle rd
where rd.cod_med = 1621857;

select count(*) as cant
from rutero_maestro_detalle_aprobado rd
where rd.cod_med = 1629665;


/* j_contacto=737191&rutero=21673 */
select DISTINCT(m.cod_med), m.ap_pat_med, m.ap_mat_med, m.nom_med 
from medicos m, categorias_lineas c, medico_asignado_visitador v
where c.cod_med=m.cod_med and c.codigo_linea='1042' 
and c.cod_med=v.cod_med and v.codigo_visitador='1472' 
and m.ap_pat_med like '%mercado%'
order by m.ap_pat_med


/*-- - - - - - -  cod_med que se repite = 1622774 ----- dos codigos de un mismo doctor cod_ciudad=116, 1621857 y 1629665*/








