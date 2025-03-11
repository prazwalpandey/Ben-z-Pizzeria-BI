select r.rota_id,
s.first_name,
s.last_name,
s.hourly_rate,
sh.start_time,
sh.end_time,
 TIMESTAMPDIFF(MINUTE, sh.start_time, sh.end_time) / 60 AS hours_in_shift, 
(TIMESTAMPDIFF(MINUTE, sh.start_time, sh.end_time) / 60) * s.hourly_rate AS staff_co
from rota r
left join staff s on r.staff_id = s.staff_id
left join shift sh on r.shift_id = sh.shift_id;