select * from ciudades;/*LP:113, SC:116 ,TR:117, MT:122 , SCZ-PE:124, CBBA:102*/
SELECT * FROM lineas L WHERE L.estado=1 AND L.linea_promocion=1;

select f.paterno, f.materno, f.nombres, c.descripcion
from funcionarios_agencias fa 
left join funcionarios f on fa.codigo_funcionario = f.codigo_funcionario
left join ciudades c on c.cod_ciudad = fa.cod_ciudad
where fa.codigo_funcionario >= 1480;

select * 
from funcionarios_agencias fa where fa.codigo_funcionario
inner join funcionarios f on f.codigo_funcionario=fa.codigo_funcionario
where fa.cod_ciudad='124' and f.estado=1;

select * from funcionarios_lineas fl WHERE fl.codigo_funcionario='1054'

insert into funcionarios_agencias values ('1506','102');
insert into funcionarios_agencias values ('1481','116');
insert into funcionarios_agencias values ('1482','113');
insert into funcionarios_agencias values ('1483','117');
insert into funcionarios_agencias values ('1484','122');

insert into funcionarios_lineas values ('1373','1009');
insert into funcionarios_lineas values ('1498','1023');
insert into funcionarios_lineas values ('1498','1022');
insert into funcionarios_lineas values ('1498','1021');
insert into funcionarios_lineas values ('1498','1032');
insert into funcionarios_lineas values ('1498','1033');
insert into funcionarios_lineas values ('1498','1035');
insert into funcionarios_lineas values ('1498','1041');
insert into funcionarios_lineas values ('1498','1042');
insert into funcionarios_lineas values ('1498','1043');
insert into funcionarios_lineas values ('1054','1046');
insert into funcionarios_lineas values ('1498','1047');
insert into funcionarios_lineas values ('1373','1050');
