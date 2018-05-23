SELECT * from (
select p.cod_ma, m.descripcion_material, sum(p.cantidad_ma) from parrilla_personalizada p, material_apoyo m
where p.cod_ma=m.codigo_material and p.cod_gestion=1014 and p.cod_ciclo=10 group by p.cod_ma, m.descripcion_material) x
order by descripcion_material

