select 
  s2.ing_name,
  s2.ordered_weight,
    ing.ing_weight * inv.quantity as total_inv_weight,
    (ing.ing_weight * inv.quantity)-(s2.ordered_weight) as remaining_weight
from (select ing_id,
ing_name,
sum(ordered_weight) ordered_weight
from stock1
group by ing_id,ing_name) s2
left join inventory inv on s2.ing_id = inv.item_id
left join ingredient ing on ing.ing_id=s2.ing_id;