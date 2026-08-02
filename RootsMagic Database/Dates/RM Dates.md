# RM Date format

## Date information goes though several stages

A text date is entered by the user into the GUI in a Date field. As the user types, the text is validated. The field is highlighted with an error color as the user types until the text can be interpreted as a valid RM date. Input date format is specified in the RM Preferences.

The data that is stored in the database in a RM date field. (Database TEXT field) and a Sort date is created and stored in a RM SortDate field (database INTEGER BIGINT field).

When the date is displayed by the GUI, the text is generated from the database date. The output is in the canonical date format as specified by in the preferences. (the last is also displayed immediately after leaving the entry field before database update.)

If we call the database data the "stored date"
There may be more than one set of characters that can be entered into the RM GUI that generate the same stored date. That text in the GUI is converted to the canonical form.\
There are several ways to display the saved date depending on the format selected in preferences.

## Database RM Date format

Most RM database format dates are 24 bytes long, except '.' type dates which are one character and 'T' dates which can be length >=1.

``` text
schematic of an RM Date
origin 0 based indexing

0123456789A123456789B123
TS+YYYYMMDDJC+YYYYMMDDJC


examples
D.+19620100..+00000000..
D.+19550925..+00000000..
D.+19890800..+00000000..
D.+19690000.A+00000000..
DS+19870925..+20190100..
D.+19590204..+00000000..
.
DS+19360000..+19440000..
D.+19270422..+00000000..
DR+19530000..+19550000..
DS+19440000..+19470000..
D.+19290716..+00000000..
DS+19491108..+19500330..
Tunknown
D.+18840203..+00000000..
D.+19450525..+00000000..
DS+19130614..+19130627..
D.+19250101..+00000000..
DR+19250000..+19300000..
D.+19510810..+00000000..
D.+19061103..+00000000..
```

(range is shown using Python style string slicing)

|        | char  | range  | meaning                         |
| ------ | :---- | :----- | :------------------------------ |
| Part 0 | ===== | ====== | =============================== |
|        | T     | 0:1    | Type                            |
|        | S     | 1:2    | Structure (see pos. 2 below)    |
| Part 1 | ===== | ====== | =============================== |
|        | +     | 2:3    | BC/AD -/+                       |
|        | YYYY  | 3:7    |                                 |
|        | MM    | 7:9    |                                 |
|        | DD    | 9:11   |                                 |
|        | J     | 11:12  | Julian/Gregorian                |
|        | C     | 12:13  | certainty                       |
| Part 2 | ===== | ====== | =============================== |
|        | +     | 13:14  | BC/AD -/+                       |
|        | YYY   | 14:18  |                                 |
|        | MM    | 18:20  |                                 |
|        | DD    | 20:22  |                                 |
|        | J     | 22:23  | Julian/Gregorian                |
|        | C     | 23:24  | certainty                       |

from 
<https://docs.google.com/spreadsheets/d/1yOb8klovt6UXStcD_S2g7wkkKh4S12AZJ9zSo1Dz_-g/edit#gid=2014317360>\
accessed: 2021-04-17\
and investigations by RJ Otter

### Full date type
The position 1 character describes the entire date.
other modifiers affect ony the first or second date.
Even JG double date flag (positions 12 & 23) affects only its own part of the date

This section uses origin 1 indexing (as in SQLite substr function)

| Position 1 | function      |
| :--------: | ------------- |
|     .      | Empty Date    |
|     D      | Standard Date |
|     Q      | Quaker Date   |
|     R      | Quarter Date  |
|     T      | Text Date     |
|            |               |

D, Q, and R dates may be One Part or Two Part Dates.

The second character indicates how the 2 parts of a date are interpreted.
Each character specifies whether the second date is used or not (+00000000..)

| Position 2 | meaning     | number of date parts |
| :--------: | :---------- | :------------------: |
|     .      | On          |        1 part        |
|     B      | Bef         |        1 part        |
|     Y      | By          |        1 part        |
|     T      | To          |        1 part        |
|     U      | Until       |        1 part        |
|     R      | Bet/And     |        2 part        |
|     S      | From/To     |        2 part        |
|     -      | – (em dash) |        2 part        |
|     O      | Or          |        2 part        |
|     F      | From        |        1 part        |
|     I      | Since       |        1 part        |
|     A      | After       |        1 part        |

### Part One date

| Position 3 | meaning   |
| :--------: | :-------- |
|     -      | BC or BCE |
|     +      | AD or CE  |

| Position 4-7 | meaning                                   |
| :----------: | ----------------------------------------- |
|     YYYY     | 4 digit Year or 0000 if no year specified |


|           | Position 8-9 | meaning                                    |
| --------- | :----------: | ------------------------------------------ |
| if D date |              |                                            |
|           |      MM      | 2 digit month, or 00 if no month specified |
| if R date |              |                                            |
|           |      01      | Q1                                         |
|           |      02      | Q2                                         |
|           |      03      | Q3                                         |
|           |      04      | Q4                                         |

|           | Position 10-11 | meaning                                       |
| --------- | -------------- | --------------------------------------------- |
| if D date |                |                                               |
|           | DD             | 2 digit day of month, 00 if day not specified |
| if R date |                | -                                             |
|           | 00             | always                                        |

| Position 12 | meaning                        |
| :---------: | ------------------------------ |
|      /      | Double date (Julian/Gregorian) |
|      .      | otherwise                      |

| Position 13 | meaning   |
| ----------- | --------- |
| ?           | Maybe     |
| 1           | Prhps     |
| 2           | Appar     |
| 3           | Lkly      |
| 4           | Poss      |
| 5           | Prob      |
| 6           | Cert      |
| A           | Abt       |
| C           | Ca        |
| E           | Est       |
| L           | Calc      |
| S           | Say       |
| .           | otherwise |

### Part Two Date

| Position 14 | meaning                   |
| :---------- | :------------------------ |
| -           | BC or BCE for second date |
| +           | AD or CE for second date  |


| Position 15-18 | meaning                                   |
| -------------- | ----------------------------------------- |
| YYYY           | 4 digit Year or 0000 if no year specified |


|           | Position 19-20 | meaning                                    |
| --------- | -------------- | ------------------------------------------ |
| if D date |                |                                            |
|           | MM             | 2 digit month, or 00 if no month specified |
| if R date |                |                                            |
|           | 01             | Q1                                         |
|           | 02             | Q2                                         |
|           | 03             | Q3                                         |
|           | 04             | Q4                                         |


|           | Position 21-22 | meaning                                       |
| --------- | -------------- | --------------------------------------------- |
| if D date |                |                                               |
|           | DD             | 2 digit day of month, 00 if day not specified |
| if R date |                |                                               |
|           | 00             | always                                        |

| Position 23 | meaning                         |
| :---------: | ------------------------------- |
|      /      | Double date  (Julian/Gregorian) |
|      .      | otherwise                       |


| Position 24 | meaning   |
| :---------: | --------- |
|      ?      | Maybe     |
|      1      | Prhps     |
|      2      | Appar     |
|      3      | Lkly      |
|      4      | Poss      |
|      5      | Prob      |
|      6      | Cert      |
|      A      | Abt       |
|      C      | Ca        |
|      E      | Est       |
|      L      | Calc      |
|      S      | Say       |
|      .      | otherwise |


## Double Date has two meanings

Most commonly a date is a single date, Jan 1 1970, herein called a "One Part Date".
A date can also indicate a range or interval, e.g.

``` text
From Jan 1 1970 to Feb 4 1975
or
Between 8 May 1973 and 8 Jun 1975 
```

herein named a "Two Part Date" since the RM Date has to encode both the start and end dates.\
A second use of the term Double Dates regards the formatting of a date that occurred in the
transition between Julian and Gregorian calendars in the West. This doc calls them "Double JG Dates", they are also called "slash dates".. 

Double JG Dates usually look like this 04 Feb 1740/1 or 14 February 1699/1700  The year is Julian/Gregorian and enough digits are used for the Gregorian portion to make it unambiguous. Dates may only to be written as double if they occur between 1 January and 25 March in the years from 1582 until the year of full conversion. (1753 in the old British Empire). RM allows modern dates to be in double JG date format\

Double Date  Julian Gregorian  Old Style - New Style

<https://www.familysearch.org/en/wiki/Julian_and_Gregorian_Calendars>

<https://news.legacyfamilytree.com/legacy_news/2020/01/tuesdays-tip-double-dating-intermediate.html>

<http://www.searchforancestors.com/utility/gregorian.html>

<https://stevemorse.org/jcal/julian.html>

An example transition (two consecutive days)-

| Country                     | Last Julian Date | First Gregorian Date |
| :-------------------------- | :--------------- | :------------------- |
| Germany, Catholic (Bavaria) | Oct 5, 1583      | Oct 16, 1583         |

In historical sources created when dates were in transition, Julian data was sometimes/often  followed with O.S. and Gregorian dates followed by N.S.( old and new style)

``` text
                                 GREGORIAN
  2   2   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   3   3   3
  1   2   3   4   5   6   7   8   9  10  11  12   1   2   3   4   5   6   7   8   9  10  11  12 
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
 11  12   1   2   3   4   5   6   7   8   9  10  11  12   1   2   3   4   5   6   7   8   9  10   
  1   1   2   2   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   3
                                  JULIIAN
  X   X                                           X   X  
```

## Quarter dates

enter- Q1 2014\
displays- March Quarter 2014   (long format, what about other formats?)\
sort      January 2014\
      Q1 - 2014,  Q2 - June, Q3 - September, Q4 - December \

March Quarter 2014   long format\
Mar Q 2014           short format

sort date is as if it was standard \
Q1 2014 => sort date Jan 2014 same sort date as entering Jan 2014 in date

## Quaker dates

questions
Do quaker dates just have a different canonical input/output but stored date is simple Gregorian?

## Date validation

General
must be a valid Gregorian date (# days in month, leap year rules etc?) (do double dates have to be valid Julian dates (leap year rules were different)\
Ambiguous date parts are interpreted by the sequence as specified in preferences.\
For a Two-Part Date, the first date must be "earlier" than second.\

Double JG Dates
Month-day must be between Jan 1 and Mar 24 inclusive.
Year must be 1583 or greater

Canonical date format
Double JG Dates- the Gregorian date after the slash may only contain a year.
And only the minimum number of digits required is included that show the main year +1.
so: 1 Feb 1755/6     1 Feb 1759/60     1 Feb 1798/9    1 Feb 1799/1800
There is no accounting for the 10 days "eliminated"


### Starting attempt at Bachus-Naur form Date spec (not even close yet)

https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form

```
RMdate ::= <RM_Type_EM_Date> | <RM_Type_T_Date> | <RM_Type_D_Date> | <RM_Type_R_Date> |<RM_Type_Q_Date> 

<RM_Type_EM_Date> ::= "."

<RM_Type_T_Date> ::= "T" <UTF-8 character>+

<RM_Type_D_Date> ::= 'D' <struct> <DatePart> " | 'D' <struct> <DatePart> <DatePart> 

<RM_Type_R_Date> ::= 'R' <struct> <DatePart> " | 'R' <struct> <DatePart> <DatePart> 

<RM_Type_Q_Date> ::= 'Q' <struct> <DatePart> " | 'Q' <struct> <DatePart> <DatePart> 


<DatePart> ::= <AD or BC FLAG> <YYYY> <MM> <DD> <confidence FLAG> <JG DD FLAG>

<YYYY> ::= <digit> digit> <digit> <digit>
<MM>   ::= <digit> <digit>
<DD>    ::= <digit> <digit>

etc.  TODO

```

confidence does not affect sort date

===========================================DIV50==

Tested in RM 9.1.3
created a date of-
24 March 1924/5
in database, it is stored as-
D.+19240324/.+00000000/.
with a sort date of-
6713296958983766028

the Julian calendar date is stored in the DB !!!


Copilot, with lots of prodding and correcting, gave this

<rm-date> ::= <type>
              <structure>
              <era-1>
              <year-1>
              <month-1>
              <day-1>
              <julian-1>
              <certainty-1>
              <era-2>
              <year-2>
              <month-2>
              <day-2>
              <julian-2>
              <certainty-2>

(* -------------------------------------------------- *)
(* Part 0 — Positions 0–2                             *)
(* -------------------------------------------------- *)

(* Position 0: Type *)
<type> ::= "." | "D" | "Q" | "R" | "T"

(* Position 1: Structure (Qualifier) *)
<structure> ::= "." | "B" | "Y" | "T" | "U" | "F" | "I" | "A"
               | "R" | "S" | "-" | "O"

(* -------------------------------------------------- *)
(* Part 1 — Positions 2–13                            *)
(* -------------------------------------------------- *)

(* Position 2: Era for first date part *)
<era-1> ::= "+" | "-"

(* Positions 3–6: Year (4 digits) *)
<year-1> ::= <digit><digit><digit><digit>

(* Positions 7–8: Month (2 digits) *)
<month-1> ::= <digit><digit>

(* Positions 9–10: Day (2 digits) *)
<day-1> ::= <digit><digit>

(* Position 11: Julian/Gregorian flag *)
<julian-1> ::= "/" | "."

(* Position 12: Certainty code *)
<certainty-1> ::= "?" | "1" | "2" | "3" | "4" | "5" | "6"
                | "A" | "C" | "E" | "L" | "S"
                | "."

(* -------------------------------------------------- *)
(* Part 2 — Positions 13–24                           *)
(* -------------------------------------------------- *)

(* Position 13: Era for second date part *)
<era-2> ::= "+" | "-"

(* Positions 14–17: Year (4 digits) *)
<year-2> ::= <digit><digit><digit><digit>

(* Positions 18–19: Month (2 digits) *)
<month-2> ::= <digit><digit>

(* Positions 20–21: Day (2 digits) *)
<day-2> ::= <digit><digit>

(* Position 22: Julian/Gregorian flag *)
<julian-2> ::= "/" | "."

(* Position 23: Certainty code *)
<certainty-2> ::= "?" | "1" | "2" | "3" | "4" | "5" | "6"
                | "A" | "C" | "E" | "L" | "S"
                | "."

(* -------------------------------------------------- *)
(* Lexical Elements                                   *)
(* -------------------------------------------------- *)

<digit> ::= "0" | "1" | "2" | "3" | "4"
          | "5" | "6" | "7" | "8" | "9"