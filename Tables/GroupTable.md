# GroupTable

## Purpose

Holds data on Person Groups created in RootsMagic. Group names are elsewhere.

## Table DDL

``` SQL
CREATE TABLE GroupTable (RecID INTEGER PRIMARY KEY, GroupID INTEGER, StartID INTEGER, EndID INTEGER, UTCModDate FLOAT );
```

## Columns List

| #   | Name       | Type    |
| --- | ---------- | ------- |
| 1   | RecID      | INTEGER |
| 2   | GroupID    | INTEGER |
| 3   | StartID    | INTEGER |
| 4   | EndID      | INTEGER |
| 5   | UTCModDate | FLOAT   |

## Notes

| #   | Name       | Note                         |
| --- | ---------- | ---------------------------- |
| 1   | RecID      | _PK                          |
| 2   | GroupID    | _FK ==> TagTable.TagValue    |
| 3   | StartID    | _FK ==> PersonTable.PersonID |
| 4   | EndID      | _FK ==> PersonTable.PersonID |
| 5   | UTCModDate | _STD                         |

## Notes

If the groups are only witten by code, then one can always use StartID == EndID
The table will be bigger, but who cares.

Example code to read a group.\
from Jerry Bryan

Note the join that takes into account of the possible
range of IDs in each group table row.

```SQL

SELECT P.PersonID
FROM PersonTable AS P
JOIN GroupTable AS G ON G.StartID <= P.PersonID AND P.PersonID <= G.EndID
JOIN TagTable AS T ON T.TagType = 0 AND T.TagValue = G.GroupID
AND T.TagName LIKE 'descendants of g grandparents'
```