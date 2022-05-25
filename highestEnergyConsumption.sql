select
date, total_energy

FROM

(select
date,Sum(consumption) AS total_energy,
RANK() OVER (ORDER BY sum(consumption) DESC) as r

FROM

(select * from fb_eu_energy
UNION ALL
select * from fb_asia_energy
UNION ALL
select * from fb_na_energy) fb_energy
GROUP BY date) fb_energy_ranked
WHERE r=1