select * 
from funcionarios f
where 1=1
/*and f.paterno like '%paz%'*/
and f.codigo_funcionario=1450
and estado = 1;
/*- - - - - - - - Cofar.2018 - - - - - - -*/
select * 
from usuarios_sistema u
where 1=1
and u.codigo_funcionario = 1114
; 
/*and u.contrasena like '%edu%' */  /*1346 salvador*/


select * FROM ciudades c
where c.cod_ciudad=124;

select *
from funcionarios_agencias f
where f.codigo_funcionario = 1390;

select * from cargos c where c.cod_cargo = 1016;
