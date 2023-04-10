-- SELECT *  FROM "users"

SELECT "id", "firstName","lastName","isMale"
FROM "users"
-- WHERE "firstName" IN ('Don', 'Mary', 'Sara')
-- WHERE "id" 300 AND "id" 305
-- WHERE "id" >300 AND "id" <305
-- WHERE "id" BETWEEN SYMMETRIC 300 AND 305

SELECT "id", "firstName","lastName","isMale","height"
FROM "users"
WHERE "height" >=1.80 AND "height" <=1.95 "isMale"=TRUE;

SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age" ,extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"


--витягти усіх молодше 28 років
SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"
WHERE extract("years" FROM age("birthday")) < 28;

--витягти усіх жінок від 25 до 29 включно
SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"
WHERE extract("years" FROM age("birthday")) BETWEEN 25 AND 29 AND "isMaile"=FALSE;


--витягти усіх, хто народився 1998 році
SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"
WHERE extract("years" FROM age("birthday")) =1998


--витягти усі, хто народився 13 числа
SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday", extract("days" FROM age("birthday"))  AS "day of bday"
FROM "users"
WHERE extract("days" FROM age("birthday")) =13


--витягти усіх чоловіків, чкі народилися влітку
SELECT "id", "firstName","lastName","isMale", "birthday", 
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday", extract("months" FROM age("birthday"))  AS "day of bday"
FROM "users"
WHERE extract("months" FROM "birthday") BETWEEN 6 AND 7 AND "isMale" = TRUE


--витягти усіх чоловіків віком старше 45 зі зростом менше 1.75
SELECT "id", "firstName","lastName","isMale", "birthday", "height",
extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"
WHERE extract("years" FROM age("birthday")) > 45 AND "height" <1.75 AND "isMale" = TRUE;


--дістати пошту всію чоловікі старше 35 і зі зростом вище 1.65
SELECT "id","email", "firstName","lastName","isMale", "birthday", "height" , extract("years" FROM age("birthday")) AS "age", extract("years" FROM age("birthday"))  AS "year of bday"
FROM "users"
WHERE extract("years" FROM age("birthday")) > 35 AND "height" <1.65 AND "isMale" = TRUE
LIMIT 10 OFFSET 0;


--вибрати всіч юзерів з довжиною повного імені ві 15(вкл) до 20 символів [15,20}
SELECT "firstName" || ' ' || "lastName" AS "fullName"
-- SELECT concat("firstName", ' ' ,"lastName" ) AS "fullName"
FROM "users";
WHERE length("firstName" || ' ' || "lastName") BETWEEN 15 AND 20;