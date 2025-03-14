select s1.item_name, 
s1.ing_id,
s1.ing_name,
s1.ing_weight,
s1.ing_price,
s1.order_quantity,
s1.recipe_quantity,
s1.order_quantity*s1.recipe_quantity as ordered_weight,
s1.ing_price/s1.ing_weight as unit_cost,
(s1.order_quantity*s1.recipe_quantity)*(s1.ing_price/s1.ing_weight) as ingredient_cost
from (select o.item_id,
i.sku,
i.item_name,
r.ing_id,
r.quantity recipe_quantity,
ing.ing_name,
sum(o.quantity) order_quantity,
ing.ing_weight,
ing.ing_price
from Orders o
left join item i on o.item_id=i.item_id
left join recipe r on i.sku = r.recipe_id
left join ingredient ing on r.ing_id = ing.ing_id
group by o.item_id, i.sku,i.item_name,r.ing_id,r.quantity,ing.ing_name) s1;