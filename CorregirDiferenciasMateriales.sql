-- CORRECCION ALMACENES --- ---  MUESTRAS MEDICAS-----
SELECT id.*
from ingreso_detalle_almacenes id 
INNER JOIN ingreso_almacenes i on i.cod_ingreso_almacen=id.cod_ingreso_almacen 
where i.cod_almacen='1000' 
and i.grupo_ingreso=2 
and i.ingreso_anulado=0 
and id.cod_material = '21640'
and id.cantidad_restante != 0
order by id.fecha_vencimiento asc;
;

SELECT * from lineas; /*1047*/



