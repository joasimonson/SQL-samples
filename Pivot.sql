SELECT  CUSTOMERID, HOME AS HOMECITY, OFFICE AS OFFICECITY 
FROM
(
	SELECT CUSTOMERID, FIRSTNAME, ADDRESSTYPE, CITY
	FROM
	(
	VALUES
		(1, 'TESTE1')
		,(2, 'TESTE2')
	) AS #CUSTOMER (CUSTOMERID, FIRSTNAME)
	LEFT JOIN
	(
		VALUES
		(1, 1, 'HOME', 'CITY1')
		,(2, 1, 'OFFICE', 'CITY2')
		,(3, 2, 'HOME', 'CITY3')
	) AS #ADDRESS (ADDRESSID, CUSTOMERID_LINK, ADDRESSTYPE, CITY) ON CUSTOMERID_LINK = CUSTOMERID
) AS P
PIVOT 
(
	MAX(CITY) 
    FOR ADDRESSTYPE IN ([HOME],[OFFICE])
) AS  PVT