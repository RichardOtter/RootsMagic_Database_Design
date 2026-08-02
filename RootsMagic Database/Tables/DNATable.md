# DNATable

## Purpose

Stores DNA match information

## Table DDL

``` SQL
CREATE TABLE DNATable (RecID INTEGER PRIMARY KEY, ID1 INTEGER, ID2 INTEGER, Label1 TEXT, Label2 TEXT, DNAProvider INTEGER, SharedCM FLOAT, SharedPercent FLOAT, LargeSeg FLOAT, SharedSegs INTEGER, Date TEXT, Relate1 INTEGER, Relate2 INTEGER, CommonAnc INTEGER, CommonAncType INTEGER, Verified INTEGER, Note TEXT, UTCModDate FLOAT );

CREATE INDEX idxDnaId1 ON DNATable (ID1);

CREATE INDEX idxDnaId2 ON DNATable (ID2);
```

## Columns List

| #   | Name          | Type    |
| --- | ------------- | ------- |
| 1   | RecID         | INTEGER |
| 2   | ID1           | INTEGER |
| 3   | ID2           | INTEGER |
| 4   | Label1        | TEXT    |
| 5   | Label2        | TEXT    |
| 6   | DNAProvider   | INTEGER |
| 7   | SharedCM      | FLOAT   |
| 8   | SharedPercent | FLOAT   |
| 9   | LargeSeg      | FLOAT   |
| 10  | SharedSegs    | INTEGER |
| 11  | Date          | TEXT    |
| 12  | Relate1       | INTEGER |
| 13  | Relate2       | INTEGER |
| 14  | CommonAnc     | INTEGER |
| 15  | CommonAncType | INTEGER |
| 16  | Verified      | INTEGER |
| 17  | Note          | TEXT    |
| 18  | UTCModDate    | FLOAT   |
|     |               |         |

## Notes

| #   | Name          | Note                         |
| --- | ------------- | ---------------------------- |
| 1   | RecID         | _PK                          |
| 2   | ID1           | _FK ==> PersonTable.PersonID |
| 3   | ID2           | _FK ==> PersonTable.PersonID |
| 4   | Label1        | _TEXT-SL                     |
| 5   | Label2        | _TEXT-SL                     |
| 6   | DNAProvider   | _LOOKUP                      |
| 7   | SharedCM      |                              |
| 8   | SharedPercent |                              |
| 9   | LargeSeg      |                              |
| 10  | SharedSegs    |                              |
| 11  | Date          | _STD                         |
| 12  | Relate1       |                              |
| 13  | Relate2       |                              |
| 14  | CommonAnc     | _FK ==> PersonTable.PersonID |
| 15  | CommonAncType | _LOOKUP                      |
| 16  | Verified      | _LOOKUP                      |
| 17  | Note          | _STD                         |
| 18  | UTCModDate    | _STD                         |


Lookup Tables

| DNAProvider    |     |
| -------------- | --- |
| not specified  | 0   |
| 23andme        | 1   |
| Ancestry       | 2   |
| FamilyTree DNA | 3   |
| Living DNA     | 4   |
| MyHeritage     | 5   |
| GEDmatch       | 6   |
| Unknown        | 998 |
| Other          | 999 |


| Verified       |     |
| -------------- | --- |
|  TODO              | 0   |
