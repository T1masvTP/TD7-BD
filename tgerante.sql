--Connexion 
psql -h database-etudiants -d tgerante

CREATE TABLE T1 (id INT, A INT);
CREATE TABLE T2 (id INT, B INT);
INSERT INTO T1 SELECT generate_series(1, 20000) AS id, (1000 * random())::INT AS A;
INSERT INTO T2 SELECT generate_series(1,  1000) AS id, (1000 * random())::INT AS B;
SELECT * FROM T1, T2 WHERE T1.A = T2.B; 


CREATE INDEX indexA ON T1 (A);
CREATE INDEX indexB ON T2 (B);

DROP INDEX indexA;
--6
--C'est plus long, index A est utiliser en premier car T1 a plus de données
DROP INDEX indexB;
--7
--C'est encore plus long 

--Hash c'est le plus mieux 18.020s au compteur


