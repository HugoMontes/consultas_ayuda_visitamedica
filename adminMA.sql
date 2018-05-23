SELECT * FROM tipos_material;

select mm.*, l.nombre_linea, tm.nombre_tipomaterial
from material_apoyo mm
left join lineas l on l.codigo_linea=mm.codigo_linea
left join tipos_material tm on tm.cod_tipomaterial=mm.cod_tipo_material
where mm.descripcion_material like '%NOVADOL%';

select MAX(codigo_material) from material_apoyo;/* 23605 */

insert into material_apoyo(codigo_material,descripcion_material,estado,cod_tipo_material,codigo_linea) 
values('23605','Marco de fotos ABR-18','Activo','0','0');

insert into material_apoyo(codigo_material,descripcion_material,estado,cod_tipo_material,codigo_linea) 
values('23604','NOVADOL 50 BOLSA ECOLOGICA JUN-18','Activo','0','0'); 