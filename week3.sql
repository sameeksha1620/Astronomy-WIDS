#week3
#task1
SELECT radius, t_eff
FROM Star
WHERE radius>1;

#task2
SELECT kepler_id, t_eff
FROM Star
WHERE t_eff BETWEEN 5000 and 6000;

#task3
SELECT kepler_name, radius
FROM Planet
WHERE 
  radius BETWEEN 1 AND 3 AND
  kepler_name IS NOT NULL;
  
#task4
SELECT MIN(radius), MAX(radius), AVG(radius), STDDEV(radius)
FROM Planet
WHERE kepler_name IS NULL;

#task5
SELECT kepler_id, COUNT(koi_name)
FROM Planet
GROUP BY kepler_id
HAVING COUNT(koi_name)>1
ORDER BY COUNT(koi_name) DESC;

#task6
SELECT s.radius AS sun_radius, p.radius AS planet_radius
FROM Star AS s, PLanet AS p
WHERE s.kepler_id = p.kepler_id AND s.radius > p.radius
ORDER BY S.radius DESC;

#task7
SELECT Star.radius, COUNT(Planet.koi_name)
FROM Star
JOIN Planet USING (kepler_id)
WHERE Star.radius >=1
GROUP BY Star.kepler_id
HAVING COUNT(Planet.koi_name)>1
ORDER BY Star.radius DESC;

#task8
SELECT s.kepler_id, s.t_eff, s.radius
FROM Star AS s
LEFT OUTER JOIN Planet AS p USING (kepler_id)
WHERE p.koi_name IS NULL
ORDER BY t_eff DESC;

#task9
SELECT ROUND(AVG(P.t_eq), 1), MIN(S.t_eff), MAX(S.t_eff)
FROM STAR AS s
JOIN Planet AS p USING (kepler_id)
WHERE S.t_eff>(
 SELECT AVG(t_eff) FROM Star
 );
 
#task10
SELECT p.koi_name, p.radius, s.radius 
FROM Star AS s
JOIN Planet AS p USING (kepLer_id)
WHERE s.kepler_id IN (
   SELECT kepler_id
   FROM Star
   ORDER BY radius DESC
   LIMIT 5
  );