--max
--min
--sum
--avg
--count
SELECT max ("height");
FROM "users";

SELECT min ("height");
FROM "users";

SELECT avg ("height");
FROM "users";

SELECT avg ("isMail")
FROM "users"
WHERE "isMail"=false;

SELECT min("weight"), "isMail"
FROM "users"
GROUP BY "isMail"

SELECT sum("weight"), "isMail"
FROM "users"
GROUP BY "isMail";

-- SELECT sum("height"), "isMale"
-- FROM "users"
-- GROUP BY "isMale"

SELECT count(*), "firstName"
FROM "users"
WHERE "isMail"=false
GROUP BY "firstName";

-- кількість чоловіків , жінок
SELECT count("id"), "isMail"
FROM "users"
GROUP BY "isMail";

-- середній зріст чоловіків, старше 35 років
SELECT avg("height"), "isMail"
FROM "users"
WHERE "isMail"=TRUE AND extract("years" FROM age("birthday")) > 35 
GROUP BY "isMail";

-- кількість юзерів, які народилися з 1982 по 1985 включно
SELECT count("id"), extract("years" FROM age("birthday"))
FROM "users"
WHERE  extract("years" FROM age("birthday")) BETWEEN 1982 AND 1985
GROUP BY extract("years" FROM age("birthday")); 


-- кількість людей з прізвищами: Carlson, Reed, Horton
SELECT count("id"), "lastName"
FROM "users"
WHERE "lastName" IN ('Carlson',' Reed', 'Horton')
GROUP BY "lastName";

-- кількість людей, які народилися 08 08 будь якого року
-- SELECT * 
-- FROM (
--   SELECT count("id"), extract("months" FROM age("birthday")) AS "months" ,extract("days" FROM age("birthday")) AS "days"
-- FROM "users"
-- GROUP BY "months","days"
-- ) AS "usersBD"
-- WHERE "usersBD", "month"=9 AND "days"=23;


-- кількість чоловіків зі зростом менше 1.6
SELECT count("id"), "isMail"
FROM "users"
WHERE "height"<1.6 AND "isMail"=TRUE
GROUP BY "isMail";

-- кількість жінок з вагою більше 100
SELECT sum("weight"), "isMail"
FROM "users"
WHERE "isMail"=false AND "weight">100
GROUP BY "isMail";