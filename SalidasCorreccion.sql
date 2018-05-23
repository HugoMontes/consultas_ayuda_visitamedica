/* - - - - -  CORRECCION DUPLICIDAD LLAVES SALIDAS - - - - - */
SELECT f.codigo_funcionario, f.paterno, f.materno, f.nombres, rc.codigo_linea, rc.codigo_linea, f.cod_zeus, f.cod_ciudad
	from rutero_maestro_cab_aprobado rc, funcionarios f
	where f.codigo_funcionario=rc.cod_visitador and f.cod_zeus<>0 and 
	rc.codigo_ciclo=9 and rc.codigo_gestion=1014
	and rc.cod_visitador = 1345
  and rc.codigo_linea = 1046 
	order by f.cod_ciudad;


select * from boletas_visita_cabXXX b order by b.id_boleta desc limit 0,100;

select max(s.cod_salida_almacenes) from salida_almacenes s;

select * from salida_almacenes s 
where s.cod_salida_almacenes=159852;

SELECT * from salida_detalle_almacenes sd where sd.cod_salida_almacen = 159852;
SELECT * from salida_detalle_almacenes sd where sd.cod_salida_almacen = 160453;

select * from salida_detalle_ingreso si where si.cod_salida_almacen = 160453 and si.material in (21222,21223);

select * from muestras_medicas;

select * 
from ingreso_almacenes ia
where ia.cod_almacen='1000'
and ia.nro_correlativo='1115'