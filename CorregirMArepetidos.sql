insert into material_apoyo (codigo_material,descripcion_material,estado,cod_tipo_material,codigo_linea,url_imagen)
values('M23064','DINOXAN TRAM PERCHERO MAY-18','Activo','1010','1025','');					
insert into material_apoyo values(23036	NOVADOL 75 BOTON RAIDS REFRIGERIO JUN-18	Activo	1011	1025	0000-00-00)

select max(codigo_material) from material_apoyo;

select ma.codigo_material, ma.descripcion_material,ma.estado /*,mm.codigo, mm.descripcion,mm.estado, */
from (
	select CONVERT(codigo_material,CHAR(12)) as codigo_material, descripcion_material,estado
	from material_apoyo	where estado='Activo'
) ma 
inner join muestras_medicas mm on mm.codigo=ma.codigo_material
where mm.estado='1'
order by mm.codigo

UPDATE material_apoyo
set codigo_material = 'XXX'
where codigo_material = 'YYY'
