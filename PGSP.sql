CREATE OR REPLACE FUNCTION get_departments_without_employees()
RETURNS TABLE(deptno INT, deptname VARCHAR, location VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM dept d
    WHERE NOT EXISTS (
        SELECT 1
        FROM emp e
        WHERE d.deptno = e.deptno
    );
END; 
$$
 LANGUAGE plpgsql;

SELECT * FROM get_departments_without_employees();