/*QUERY QUE LISTA MATERIAL DE APOYO CON CODIGO DUPLICADO*/
select ma.codigo_material, ma.descripcion_material,ma.estado /*,mm.codigo, mm.descripcion,mm.estado, */
from (
               select CONVERT(codigo_material,CHAR(12)) as codigo_material, descripcion_material,estado
               from material_apoyo     where estado='Activo'
) ma 
inner join muestras_medicas mm on mm.codigo=ma.codigo_material
where mm.estado='1'
order by mm.codigo