SELECT p.cabin_code, subquery.satisfaction_type, subquery.planned_entree_count, subquery.consumed_entree_count
FROM pre_order1 p
INNER JOIN (
    SELECT s.flight_number, s.satisfaction_type, i.planned_entree_count, i.consumed_entree_count
    FROM satisfaction s
    INNER JOIN inventory i ON s.flight_number = i.flight_number1
    WHERE s.satisfaction_type IS NOT NULL AND i.planned_entree_count < i.consumed_entree_count
    ORDER BY s.satisfaction_type
) subquery ON p.flight_number = subquery.flight_number
order by p.cabin_code;

SELECT p.cabin_code, COUNT(DISTINCT p.flight_number) AS row_count
FROM pre_order1 p
INNER JOIN (
    SELECT s.flight_number, s.satisfaction_type, i.planned_entree_count, i.consumed_entree_count
    FROM satisfaction s
    INNER JOIN inventory i ON s.flight_number = i.flight_number1
    WHERE s.satisfaction_type IS NOT NULL AND i.planned_entree_count > i.consumed_entree_count
    ORDER BY s.satisfaction_type
) subquery ON p.flight_number = subquery.flight_number
GROUP BY p.cabin_code;

