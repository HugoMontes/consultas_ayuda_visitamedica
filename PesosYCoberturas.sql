select * from ciclos c where c.codigo_gestion=1014;

SELECT * from funcionarios;

select * from ruteros

SELECT f.codigo_funcionario, f.paterno, f.materno, f.nombres, c.descripcion, f.cod_zeus from funcionarios f, ciudades c  
where f.cod_ciudad=c.cod_ciudad and f.cod_ciudad in (116) and f.codigo_funcionario in 
(select rc.cod_visitador from rutero_maestro_cab_aprobado rc where rc.codigo_ciclo='10' and rc.codigo_gestion='1014')
order by c.descripcion, f.paterno, f.materno

SELECT count(rd.cod_contacto) from rutero_detalle rd, rutero r where 
	r.cod_ciclo='10' and r.codigo_gestion='1014' and r.cod_visitador='1458' and 
	r.cod_contacto=rd.cod_contacto and rd.estado='1' and rd.categoria_med='A'
