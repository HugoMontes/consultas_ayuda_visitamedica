select * /*delete d.*  */
FROM ciclo_dia_contacto d
where d.cod_ciclo='3'
and d.cod_gestion='1015';

Select * 
from ciclos c
ORDER BY c.codigo_gestion desc, c.cod_ciclo desc;

SELECT fecha_ini,fecha_fin from ciclos where cod_ciclo='2' and codigo_gestion='1015';
insert into ciclos values('1','2018-04-01','2018-04-30','Inactivo','1032','1015');
insert into ciclos values('2','2018-05-01','2018-05-31','Inactivo','1032','1015');
insert into ciclos values('3','2018-06-01','2018-06-30','Inactivo','1032','1015');