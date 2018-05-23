select distinct(ad.codigo_ma) from asignacion_ma_excel a, asignacion_ma_excel_detalle ad
where a.id=ad.id_asignacion_ma order by 1;

