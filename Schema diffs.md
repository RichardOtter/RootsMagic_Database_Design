# Ver 10 to ver 11

Only change from v10 is in the ConfigTable initial data for the Record column.
The Version element now reads "Version 11".

## New Tables
[none]

## Modified Tables
[none]

## Deleted Tables
[none]

## Std diff output
[none]

## Lines re-ordered, common items deleted
[none]


# Ver 9 to ver 10

## New Tables

* DNATable
* HealthTable

## Modified Tables

* AncestryTable
* FamilySearchTable

## Deleted Tables
[none]

## Std diff output
```
$  diff ver\ 9.txt ver\ 10.txt
5c5
< CREATE TABLE AncestryTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, anID TEXT, Modified INTEGER, anVersion TEXT, anDate FLOAT, Status INTEGER, UTCModDate FLOAT );
---
> CREATE TABLE AncestryTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, anID TEXT, Modified INTEGER, anVersion TEXT, anDate FLOAT, Status INTEGER, UTCModDate FLOAT , TreeID TEXT);
14a15,16
> CREATE TABLE DNATable (RecID INTEGER PRIMARY KEY, ID1 INTEGER, ID2 INTEGER, Label1 TEXT, Label2 TEXT, DNAProvider INTEGER, SharedCM FLOAT, SharedPercent FLOAT, LargeSeg FLOAT, SharedSegs INTEGER, Date TEXT, Relate1 INTEGER, Relate2 INTEGER, CommonAnc INTEGER, CommonAncType INTEGER, Verified INTEGER, Note TEXT, UTCModDate FLOAT );
>
21c23
< CREATE TABLE FamilySearchTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, fsID TEXT, Modified INTEGER, fsVersion TEXT, fsDate FLOAT, Status INTEGER, UTCModDate FLOAT );
---
> CREATE TABLE FamilySearchTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, fsID TEXT, Modified INTEGER, fsVersion TEXT, fsDate FLOAT, Status INTEGER, UTCModDate FLOAT , TreeID TEXT);
30a33,34
> CREATE TABLE HealthTable (RecID INTEGER PRIMARY KEY, OwnerID INTEGER, Condition INTEGER, SubCondition TEXT, Date FLOAT, Note TEXT, UTCModDate FLOAT );
>
72a77,80
> CREATE INDEX idxDnaId1 ON DNATable (ID1);
>
> CREATE INDEX idxDnaId2 ON DNATable (ID2);
>
93a102,103
>
> CREATE INDEX idxHealthOwnerId ON HealthTable (OwnerID);
```

## Lines re-ordered, common items deleted
```

< CREATE TABLE AncestryTable ();
> CREATE TABLE AncestryTable ( TreeID TEXT);

< CREATE TABLE FamilySearchTable ();
> CREATE TABLE FamilySearchTable ( TreeID TEXT);

> CREATE TABLE DNATable (RecID INTEGER PRIMARY KEY, ID1 INTEGER, ID2 INTEGER, Label1 TEXT, Label2 TEXT, DNAProvider INTEGER, SharedCM FLOAT, SharedPercent FLOAT, LargeSeg FLOAT, SharedSegs INTEGER, Date TEXT, Relate1 INTEGER, Relate2 INTEGER, CommonAnc INTEGER, CommonAncType INTEGER, Verified INTEGER, Note TEXT, UTCModDate FLOAT );

> CREATE TABLE HealthTable (RecID INTEGER PRIMARY KEY, OwnerID INTEGER, Condition INTEGER, SubCondition TEXT, Date FLOAT, Note TEXT, UTCModDate FLOAT );


> CREATE INDEX idxDnaId1 ON DNATable (ID1);

> CREATE INDEX idxDnaId2 ON DNATable (ID2);

> CREATE INDEX idxHealthOwnerId ON HealthTable (OwnerID);
```


# Ver 8 to ver 9

## New Tables

* FANTable
* FANTypeTable
* PayloadTable

## Modified Tables

* CitationTable
* PersonTable

## Deleted Tables

[none]

## Std diff output
```
$  diff ver\ 8.txt ver\ 9.txt
11c11
< CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, SourceID INTEGER, Comments TEXT, ActualText TEXT, RefNumber TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, Fields BLOB, UTCModDate FLOAT, CitationName TEXT );
---
> CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, SourceID INTEGER, Comments TEXT, ActualText TEXT, RefNumber TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, Fields BLOB, UTCModDate FLOAT, CitationName TEXT COLLATE RMNOCASE );
24a25,28
> CREATE TABLE FANTable (FanID INTEGER PRIMARY KEY, ID1 INTEGER, ID2 INTEGER, FanTypeID INTEGER, PlaceID INTEGER, SiteID INTEGER, Date TEXT, SortDate BIGINT, Description TEXT, Note TEXT, UTCModDate FLOAT );
>
> CREATE TABLE FANTypeTable (FANTypeID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, Role1 TEXT, Role2 TEXT, Sentence1 TEXT, Sentence2 TEXT, UTCModDate FLOAT );
>
33c37,39
< CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );
---
> CREATE TABLE PayloadTable (RecID INTEGER PRIMARY KEY, RecType INTEGER, OwnerType INTEGER, OwnerID INTEGER, Title TEXT, DataRec BLOB, UTCModDate FLOAT );
>
> CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Color1 INTEGER, Color2 INTEGER, Color3 INTEGER, Color4 INTEGER, Color5 INTEGER, Color6 INTEGER, Color7 INTEGER, Color8 INTEGER, Color9 INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );
78a85,90
> CREATE INDEX idxFanId1 ON FANTable (ID1);
>
> CREATE INDEX idxFanId2 ON FANTable (ID2);
>
> CREATE INDEX idxFANTypeName ON FANTypeTable (Name);
>
104a117,118
> CREATE INDEX idxPayloadType ON PayloadTable (RecType);
>
115c129
< CREATE INDEX idxSourceName ON SourceTable (Name);
---
> CREATE INDEX idxSourceName ON SourceTable (Name COLLATE RMNOCASE) ;
```

## Lines re-ordered, common items deleted
```

< CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, SourceID INTEGER, Comments TEXT, ActualText TEXT, RefNumber TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, Fields BLOB, UTCModDate FLOAT, CitationName TEXT );
> CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, SourceID INTEGER, Comments TEXT, ActualText TEXT, RefNumber TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, Fields BLOB, UTCModDate FLOAT, CitationName TEXT COLLATE RMNOCASE );

< CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );
> CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Color1 INTEGER, Color2 INTEGER, Color3 INTEGER, Color4 INTEGER, Color5 INTEGER, Color6 INTEGER, Color7 INTEGER, Color8 INTEGER, Color9 INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );

> CREATE TABLE FANTable (FanID INTEGER PRIMARY KEY, ID1 INTEGER, ID2 INTEGER, FanTypeID INTEGER, PlaceID INTEGER, SiteID INTEGER, Date TEXT, SortDate BIGINT, Description TEXT, Note TEXT, UTCModDate FLOAT );

> CREATE TABLE FANTypeTable (FANTypeID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, Role1 TEXT, Role2 TEXT, Sentence1 TEXT, Sentence2 TEXT, UTCModDate FLOAT );

> CREATE TABLE PayloadTable (RecID INTEGER PRIMARY KEY, RecType INTEGER, OwnerType INTEGER, OwnerID INTEGER, Title TEXT, DataRec BLOB, UTCModDate FLOAT );


> CREATE INDEX idxFanId1 ON FANTable (ID1);

> CREATE INDEX idxFanId2 ON FANTable (ID2);

> CREATE INDEX idxFANTypeName ON FANTypeTable (Name);

> CREATE INDEX idxPayloadType ON PayloadTable (RecType);

< CREATE INDEX idxSourceName ON SourceTable (Name);
> CREATE INDEX idxSourceName ON SourceTable (Name COLLATE RMNOCASE) ;
```

# Ver 7 to ver 8

## New Tables

* AncestryTable
* CitationLinkTable
* FamilySearchTable
* TagTable
* TaskLinkTable
* TaskTable

## Modified Tables

* ChildTable
* CitationTable
* EventTable
* FactTypeTable
* FamilyTable
* MediaLinkTable
* MultimediaTable
* NameTable
* PersonTable
* PlaceTable
* URLTable


## Modified Tables: Only change: Add column: UTCModDate

* AddressLinkTable
* AddressTable
* ConfigTable
* ExclusionTable
* GroupTable
* RoleTable
* SourceTable
* SourceTemplateTable
* WitnessTable

## Deleted Tables

* LabelTable
* LinkTable
* LinkAncestryTable
* ResearchItemTable
* ResearchTable

## Feature Area

### External Links
removed-\
  LinkTable\
  LinkAncestryTable\
added-\
 AncestryTable\
 FamilySearchTable\

### Source & Citations
added-\
  CitationLinkTable\

### Groups
removed- \
  LabelTable\
added-\
  TagTable\

### Tasks-
removed-\
  ResearchTable\
  ResearchItemTable\
added-\
  TaskTable\
  TaskLinkTable\


## std diff output
```
$  diff ver\ 7.txt ver\ 8.txt
1c1
< CREATE TABLE AddressLinkTable (LinkID INTEGER PRIMARY KEY, OwnerType INTEGER, AddressID INTEGER, OwnerID INTEGER, AddressNum INTEGER, Details TEXT );
---
> CREATE TABLE AddressLinkTable (LinkID INTEGER PRIMARY KEY, OwnerType INTEGER, AddressID INTEGER, OwnerID INTEGER, AddressNum INTEGER, Details TEXT, UTCModDate FLOAT );
3c3
< CREATE TABLE AddressTable (AddressID INTEGER PRIMARY KEY, AddressType INTEGER, Name TEXT COLLATE RMNOCASE, Street1 TEXT, Street2 TEXT, City TEXT, State TEXT, Zip TEXT, Country TEXT, Phone1 TEXT, Phone2 TEXT, Fax TEXT, Email TEXT, URL TEXT, Latitude INTEGER, Longitude INTEGER, Note BLOB );
---
> CREATE TABLE AddressTable (AddressID INTEGER PRIMARY KEY, AddressType INTEGER, Name TEXT COLLATE RMNOCASE, Street1 TEXT, Street2 TEXT, City TEXT, State TEXT, Zip TEXT, Country TEXT, Phone1 TEXT, Phone2 TEXT, Fax TEXT, Email TEXT, URL TEXT, Latitude INTEGER, Longitude INTEGER, Note TEXT, UTCModDate FLOAT );
5c5
< CREATE TABLE ChildTable (RecID INTEGER PRIMARY KEY, ChildID INTEGER, FamilyID INTEGER, RelFather INTEGER, RelMother INTEGER, ChildOrder INTEGER, IsPrivate INTEGER, ProofFather INTEGER, ProofMother INTEGER, Note BLOB );
---
> CREATE TABLE AncestryTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, anID TEXT, Modified INTEGER, anVersion TEXT, anDate FLOAT, Status INTEGER, UTCModDate FLOAT );
7c7
< CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, OwnerType INTEGER, SourceID INTEGER, OwnerID INTEGER, Quality TEXT, IsPrivate INTEGER, Comments BLOB, ActualText BLOB, RefNumber TEXT, Flags INTEGER, Fields BLOB );
---
> CREATE TABLE ChildTable (RecID INTEGER PRIMARY KEY, ChildID INTEGER, FamilyID INTEGER, RelFather INTEGER, RelMother INTEGER, ChildOrder INTEGER, IsPrivate INTEGER, ProofFather INTEGER, ProofMother INTEGER, Note TEXT, UTCModDate FLOAT );
9c9
< CREATE TABLE ConfigTable (RecID INTEGER PRIMARY KEY, RecType INTEGER, Title TEXT, DataRec BLOB );
---
> CREATE TABLE CitationLinkTable (LinkID INTEGER PRIMARY KEY, CitationID INTEGER, OwnerType INTEGER, OwnerID INTEGER, SortOrder INTEGER, Quality TEXT, IsPrivate INTEGER, Flags INTEGER, UTCModDate FLOAT );
11c11
< CREATE TABLE EventTable (EventID INTEGER PRIMARY KEY, EventType INTEGER, OwnerType INTEGER, OwnerID INTEGER, FamilyID INTEGER, PlaceID INTEGER, SiteID INTEGER, Date TEXT, SortDate INTEGER, IsPrimary INTEGER, IsPrivate INTEGER, Proof INTEGER, Status INTEGER, EditDate FLOAT, Sentence BLOB, Details BLOB, Note BLOB );
---
> CREATE TABLE CitationTable (CitationID INTEGER PRIMARY KEY, SourceID INTEGER, Comments TEXT, ActualText TEXT, RefNumber TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, Fields BLOB, UTCModDate FLOAT, CitationName TEXT );
13c13
< CREATE TABLE ExclusionTable (RecID INTEGER PRIMARY KEY, ExclusionType INTEGER, ID1 INTEGER, ID2 INTEGER );
---
> CREATE TABLE ConfigTable (RecID INTEGER PRIMARY KEY, RecType INTEGER, Title TEXT, DataRec BLOB, UTCModDate FLOAT );
15c15
< CREATE TABLE FactTypeTable (FactTypeID INTEGER PRIMARY KEY, OwnerType INTEGER, Name TEXT COLLATE RMNOCASE, Abbrev TEXT, GedcomTag TEXT, UseValue INTEGER, UseDate INTEGER, UsePlace INTEGER, Sentence BLOB, Flags INTEGER );
---
> CREATE TABLE EventTable (EventID INTEGER PRIMARY KEY, EventType INTEGER, OwnerType INTEGER, OwnerID INTEGER, FamilyID INTEGER, PlaceID INTEGER, SiteID INTEGER, Date TEXT, SortDate BIGINT, IsPrimary INTEGER, IsPrivate INTEGER, Proof INTEGER, Status INTEGER, Sentence TEXT, Details TEXT, Note TEXT, UTCModDate FLOAT );
17c17
< CREATE TABLE FamilyTable (FamilyID INTEGER PRIMARY KEY, FatherID INTEGER, MotherID INTEGER, ChildID INTEGER, HusbOrder INTEGER, WifeOrder INTEGER, IsPrivate INTEGER, Proof INTEGER, SpouseLabel INTEGER, FatherLabel INTEGER, MotherLabel INTEGER, Note BLOB );
---
> CREATE TABLE ExclusionTable (RecID INTEGER PRIMARY KEY, ExclusionType INTEGER, ID1 INTEGER, ID2 INTEGER, UTCModDate FLOAT );
19c19
< CREATE TABLE GroupTable (RecID INTEGER PRIMARY KEY, GroupID INTEGER, StartID INTEGER, EndID INTEGER );
---
> CREATE TABLE FactTypeTable (FactTypeID INTEGER PRIMARY KEY, OwnerType INTEGER, Name TEXT COLLATE RMNOCASE, Abbrev TEXT, GedcomTag TEXT, UseValue INTEGER, UseDate INTEGER, UsePlace INTEGER, Sentence TEXT, Flags INTEGER, UTCModDate FLOAT );
21c21
< CREATE TABLE LabelTable (LabelID INTEGER PRIMARY KEY, LabelType INTEGER, LabelValue INTEGER, LabelName TEXT COLLATE RMNOCASE, Description TEXT );
---
> CREATE TABLE FamilySearchTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, fsID TEXT, Modified INTEGER, fsVersion TEXT, fsDate FLOAT, Status INTEGER, UTCModDate FLOAT );
23c23
< CREATE TABLE LinkAncestryTable (LinkID INTEGER PRIMARY KEY, extSystem INTEGER, LinkType INTEGER, rmID INTEGER, extID TEXT, Modified INTEGER, extVersion TEXT, extDate FLOAT, Status INTEGER, Note BLOB );
---
> CREATE TABLE FamilyTable (FamilyID INTEGER PRIMARY KEY, FatherID INTEGER, MotherID INTEGER, ChildID INTEGER, HusbOrder INTEGER, WifeOrder INTEGER, IsPrivate INTEGER, Proof INTEGER, SpouseLabel INTEGER, FatherLabel INTEGER, MotherLabel INTEGER, SpouseLabelStr TEXT, FatherLabelStr TEXT, MotherLabelStr TEXT, Note TEXT, UTCModDate FLOAT );
25c25
< CREATE TABLE LinkTable (LinkID INTEGER PRIMARY KEY, extSystem INTEGER, LinkType INTEGER, rmID INTEGER, extID TEXT, Modified INTEGER, extVersion TEXT, extDate FLOAT, Status INTEGER, Note BLOB );
---
> CREATE TABLE GroupTable (RecID INTEGER PRIMARY KEY, GroupID INTEGER, StartID INTEGER, EndID INTEGER, UTCModDate FLOAT );
27c27
< CREATE TABLE MediaLinkTable (LinkID INTEGER PRIMARY KEY, MediaID INTEGER, OwnerType INTEGER, OwnerID INTEGER, IsPrimary INTEGER, Include1 INTEGER, Include2 INTEGER, Include3 INTEGER, Include4 INTEGER, SortOrder INTEGER, RectLeft INTEGER, RectTop INTEGER, RectRight INTEGER, RectBottom INTEGER, Note TEXT, Caption TEXT COLLATE RMNOCASE, RefNumber TEXT COLLATE RMNOCASE, Date TEXT, SortDate INTEGER, Description BLOB );
---
> CREATE TABLE MediaLinkTable (LinkID INTEGER PRIMARY KEY, MediaID INTEGER, OwnerType INTEGER, OwnerID INTEGER, IsPrimary INTEGER, Include1 INTEGER, Include2 INTEGER, Include3 INTEGER, Include4 INTEGER, SortOrder INTEGER, RectLeft INTEGER, RectTop INTEGER, RectRight INTEGER, RectBottom INTEGER, Comments TEXT, UTCModDate FLOAT );
29c29
< CREATE TABLE MultimediaTable (MediaID INTEGER PRIMARY KEY, MediaType INTEGER, MediaPath TEXT, MediaFile TEXT COLLATE RMNOCASE, URL TEXT, Thumbnail BLOB, Caption TEXT COLLATE RMNOCASE, RefNumber TEXT COLLATE RMNOCASE, Date TEXT, SortDate INTEGER, Description BLOB );
---
> CREATE TABLE MultimediaTable (MediaID INTEGER PRIMARY KEY, MediaType INTEGER, MediaPath TEXT, MediaFile TEXT COLLATE RMNOCASE, URL TEXT, Thumbnail BLOB, Caption TEXT COLLATE RMNOCASE, RefNumber TEXT COLLATE RMNOCASE, Date TEXT, SortDate BIGINT, Description TEXT, UTCModDate FLOAT );
31c31
< CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE RMNOCASE, Given TEXT COLLATE RMNOCASE, Prefix TEXT COLLATE RMNOCASE, Suffix TEXT COLLATE RMNOCASE, Nickname TEXT COLLATE RMNOCASE, NameType INTEGER, Date TEXT, SortDate INTEGER, IsPrimary INTEGER, IsPrivate INTEGER, Proof INTEGER, EditDate FLOAT, Sentence BLOB, Note BLOB, BirthYear INTEGER, DeathYear INTEGER );
---
> CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE RMNOCASE, Given TEXT COLLATE RMNOCASE, Prefix TEXT COLLATE RMNOCASE, Suffix TEXT COLLATE RMNOCASE, Nickname TEXT COLLATE RMNOCASE, NameType INTEGER, Date TEXT, SortDate BIGINT, IsPrimary INTEGER, IsPrivate INTEGER, Proof INTEGER, Sentence TEXT, Note TEXT, BirthYear INTEGER, DeathYear INTEGER, Display INTEGER, Language TEXT, UTCModDate FLOAT, SurnameMP TEXT, GivenMP TEXT, NicknameMP TEXT );
33c33
< CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, EditDate FLOAT, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note BLOB );
---
> CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );
35c35
< CREATE TABLE PlaceTable (PlaceID INTEGER PRIMARY KEY, PlaceType INTEGER, Name TEXT COLLATE RMNOCASE, Abbrev TEXT, Normalized TEXT, Latitude INTEGER, Longitude INTEGER, LatLongExact INTEGER, MasterID INTEGER, Note BLOB );
---
> CREATE TABLE PlaceTable (PlaceID INTEGER PRIMARY KEY, PlaceType INTEGER, Name TEXT COLLATE RMNOCASE, Abbrev TEXT, Normalized TEXT, Latitude INTEGER, Longitude INTEGER, LatLongExact INTEGER, MasterID INTEGER, Note TEXT, Reverse TEXT COLLATE RMNOCASE, fsID INTEGER, anID INTEGER, UTCModDate FLOAT );
37c37
< CREATE TABLE ResearchItemTable (ItemID INTEGER PRIMARY KEY, LogID INTEGER, Date TEXT, SortDate INTEGER, RefNumber TEXT, Repository TEXT, Goal TEXT, Source TEXT, Result TEXT );
---
> CREATE TABLE RoleTable (RoleID INTEGER PRIMARY KEY, RoleName TEXT COLLATE RMNOCASE, EventType INTEGER, RoleType INTEGER, Sentence TEXT, UTCModDate FLOAT );
39c39
< CREATE TABLE ResearchTable (TaskID INTEGER PRIMARY KEY, TaskType INTEGER, OwnerID INTEGER, OwnerType INTEGER, RefNumber TEXT, Name TEXT COLLATE RMNOCASE, Status INTEGER, Priority INTEGER, Date1 TEXT, Date2 TEXT, Date3 TEXT, SortDate1 INTEGER, SortDate2 INTEGER, SortDate3 INTEGER, Filename TEXT, Details BLOB );
---
> CREATE TABLE SourceTable (SourceID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, RefNumber TEXT, ActualText TEXT, Comments TEXT, IsPrivate INTEGER, TemplateID INTEGER, Fields BLOB, UTCModDate FLOAT );
41c41
< CREATE TABLE RoleTable (RoleID INTEGER PRIMARY KEY, RoleName TEXT COLLATE RMNOCASE, EventType INTEGER, RoleType INTEGER, Sentence TEXT );
---
> CREATE TABLE SourceTemplateTable (TemplateID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, Description TEXT, Favorite INTEGER, Category TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, FieldDefs BLOB, UTCModDate FLOAT );
43c43
< CREATE TABLE SourceTable (SourceID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, RefNumber TEXT, ActualText TEXT, Comments TEXT, IsPrivate INTEGER, TemplateID INTEGER, Fields BLOB );
---
> CREATE TABLE TagTable (TagID INTEGER PRIMARY KEY, TagType INTEGER, TagValue INTEGER, TagName TEXT COLLATE RMNOCASE, Description TEXT, UTCModDate FLOAT );
45c45
< CREATE TABLE SourceTemplateTable (TemplateID INTEGER PRIMARY KEY, Name TEXT COLLATE RMNOCASE, Description TEXT, Favorite INTEGER, Category TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT, FieldDefs BLOB );
---
> CREATE TABLE TaskLinkTable (LinkID INTEGER PRIMARY KEY, TaskID INTEGER, OwnerType INTEGER, OwnerID INTEGER, UTCModDate FLOAT );
47c47
< CREATE TABLE URLTable (LinkID INTEGER PRIMARY KEY, OwnerType INTEGER, OwnerID INTEGER, LinkType INTEGER, Name TEXT, URL TEXT, Note BLOB );
---
> CREATE TABLE TaskTable (TaskID INTEGER PRIMARY KEY, TaskType INTEGER, RefNumber TEXT, Name TEXT COLLATE RMNOCASE, Status INTEGER, Priority INTEGER, Date1 TEXT, Date2 TEXT, Date3 TEXT, SortDate1 BIGINT, SortDate2 BIGINT, SortDate3 BITINT, Filename TEXT, Details TEXT, Results TEXT, UTCModDate FLOAT, Exclude INTEGER );
49c49,51
< CREATE TABLE WitnessTable (WitnessID INTEGER PRIMARY KEY, EventID INTEGER, PersonID INTEGER, WitnessOrder INTEGER, Role INTEGER, Sentence TEXT, Note BLOB, Given TEXT COLLATE RMNOCASE, Surname TEXT COLLATE RMNOCASE, Prefix TEXT COLLATE RMNOCASE, Suffix TEXT COLLATE RMNOCASE );
---
> CREATE TABLE URLTable (LinkID INTEGER PRIMARY KEY, OwnerType INTEGER, OwnerID INTEGER, LinkType INTEGER, Name TEXT, URL TEXT, Note TEXT, UTCModDate FLOAT );
>
> CREATE TABLE WitnessTable (WitnessID INTEGER PRIMARY KEY, EventID INTEGER, PersonID INTEGER, WitnessOrder INTEGER, Role INTEGER, Sentence TEXT, Note TEXT, Given TEXT COLLATE RMNOCASE, Surname TEXT COLLATE RMNOCASE, Prefix TEXT COLLATE RMNOCASE, Suffix TEXT COLLATE RMNOCASE, UTCModDate FLOAT );
59c61,63
< CREATE INDEX idxCitationOwnerID ON CitationTable (OwnerID);
---
> CREATE INDEX idxCitationLinkOwnerID ON CitationLinkTable (OwnerID);
>
> CREATE INDEX idxCitationName ON CitationTable (CitationName);
77,79c81
< CREATE INDEX idxLabelType ON LabelTable (LabelType);
<
< CREATE INDEX idxLinkAncestryExtId ON LinkAncestryTable (extID);
---
> CREATE INDEX idxGivenMP ON NameTable (GivenMP);
81c83
< CREATE INDEX idxLinkAncestryRmId ON LinkAncestryTable (rmID);
---
> CREATE INDEX idxLinkAncestryanID ON AncestryTable (anID);
83c85
< CREATE INDEX idxLinkExtId ON LinkTable (extID);
---
> CREATE INDEX idxLinkAncestryRmId ON AncestryTable (rmID);
85c87
< CREATE INDEX idxLinkRmId ON LinkTable (rmID);
---
> CREATE INDEX idxLinkfsID ON FamilySearchTable (fsID);
87c89
< CREATE INDEX idxMediaCaption ON MediaLinkTable (Caption);
---
> CREATE INDEX idxLinkRmId ON FamilySearchTable (rmID);
109,113c111
< CREATE INDEX idxResearchItemLogID ON ResearchItemTable (LogID);
<
< CREATE INDEX idxResearchName ON ResearchTable (Name);
<
< CREATE INDEX idxResearchOwnerID ON ResearchTable (OwnerID);
---
> CREATE INDEX idxReversePlaceName ON PlaceTable (Reverse);
125c123,131
< CREATE INDEX idxURLOwnerID ON URLTable (OwnerID);
---
> CREATE INDEX idxSurnameGivenMP ON NameTable (SurnameMP, GivenMP, BirthYear, DeathYear);
>
> CREATE INDEX idxSurnameMP ON NameTable (SurnameMP);
>
> CREATE INDEX idxTagType ON TagTable (TagType);
>
> CREATE INDEX idxTaskName ON TaskTable (Name);
>
> CREATE INDEX idxTaskOwnerID ON TaskLinkTable (OwnerID);
```

## Lines re-ordered, common items deleted

```
< CREATE TABLE AddressLinkTable ();
> CREATE TABLE AddressLinkTable ( UTCModDate FLOAT );

< CREATE TABLE AddressTable ( Note BLOB );
> CREATE TABLE AddressTable ( Note TEXT, UTCModDate FLOAT );

< CREATE TABLE ChildTable ( Note BLOB );
> CREATE TABLE ChildTable ( Note TEXT, UTCModDate FLOAT );

< CREATE TABLE EventTable ( SortDate INTEGER, EditDate FLOAT, Sentence BLOB, Details BLOB, Note BLOB );
> CREATE TABLE EventTable ( SortDate BIGINT,                  Sentence TEXT, Details TEXT, Note TEXT, UTCModDate FLOAT );

< CREATE TABLE ExclusionTable ();
> CREATE TABLE ExclusionTable ( UTCModDate FLOAT );

< CREATE TABLE FactTypeTable ( Sentence BLOB );
> CREATE TABLE FactTypeTable ( Sentence TEXT, UTCModDate FLOAT );

< CREATE TABLE FamilyTable (                                                                Note BLOB );
> CREATE TABLE FamilyTable ( SpouseLabelStr TEXT, FatherLabelStr TEXT, MotherLabelStr TEXT, Note TEXT, UTCModDate FLOAT );

< CREATE TABLE GroupTable ();
> CREATE TABLE GroupTable ( UTCModDate FLOAT );

< CREATE TABLE MediaLinkTable ( Note TEXT, Caption TEXT COLLATE RMNOCASE, RefNumber TEXT COLLATE RMNOCASE, Date TEXT, SortDate INTEGER, Description BLOB );
> CREATE TABLE MediaLinkTable ( Comments TEXT,                                                                                                           UTCModDate FLOAT );

< CREATE TABLE MultimediaTable ( SortDate INTEGER, Description BLOB );
> CREATE TABLE MultimediaTable ( SortDate BIGINT,  Description TEXT, UTCModDate FLOAT );

< CREATE TABLE NameTable ( SortDate INTEGER, EditDate FLOAT, Sentence BLOB, Note BLOB, BirthYear INTEGER, DeathYear INTEGER );
> CREATE TABLE NameTable ( SortDate BIGINT,                  Sentence TEXT, Note TEXT, BirthYear INTEGER, DeathYear INTEGER, Display INTEGER, Language TEXT, UTCModDate FLOAT, SurnameMP TEXT, GivenMP TEXT, NicknameMP TEXT );

< CREATE TABLE PersonTable ( EditDate FLOAT, Note BLOB );
> CREATE TABLE PersonTable (                 Note TEXT, UTCModDate FLOAT );

< CREATE TABLE PlaceTable ( Note BLOB );
> CREATE TABLE PlaceTable ( Note TEXT, Reverse TEXT COLLATE RMNOCASE, fsID INTEGER, anID INTEGER, UTCModDate FLOAT );

< CREATE TABLE RoleTable ( );
> CREATE TABLE RoleTable (, UTCModDate FLOAT );

< CREATE TABLE SourceTable ();
> CREATE TABLE SourceTable ( UTCModDate FLOAT );

< CREATE TABLE SourceTemplateTable ();
> CREATE TABLE SourceTemplateTable ( UTCModDate FLOAT );

< CREATE TABLE URLTable ( Note BLOB );
> CREATE TABLE URLTable ( Note TEXT, UTCModDate FLOAT );

< CREATE TABLE WitnessTable ( Note BLOB );
> CREATE TABLE WitnessTable ( Note TEXT, UTCModDate FLOAT );

< CREATE TABLE CitationTable ( OwnerType INTEGER, OwnerID INTEGER, Quality TEXT, IsPrivate INTEGER, Comments BLOB, ActualText BLOB,                                                                                           Flags INTEGER, );
> CREATE TABLE CitationTable (                                                                      Comments TEXT, ActualText TEXT, Footnote TEXT, ShortFootnote TEXT, Bibliography TEXT,  UTCModDate FLOAT, CitationName TEXT );

< CREATE TABLE ConfigTable ();
> CREATE TABLE ConfigTable ( UTCModDate FLOAT );


> CREATE TABLE CitationLinkTable (LinkID INTEGER PRIMARY KEY, CitationID INTEGER, OwnerType INTEGER, OwnerID INTEGER, SortOrder INTEGER, Quality TEXT, IsPrivate INTEGER, Flags INTEGER, UTCModDate FLOAT );


< CREATE TABLE LabelTable (LabelID INTEGER PRIMARY KEY, LabelType INTEGER, LabelValue INTEGER, LabelName TEXT COLLATE RMNOCASE, Description TEXT );
> CREATE TABLE TagTable (TagID INTEGER PRIMARY KEY, TagType INTEGER, TagValue INTEGER, TagName TEXT COLLATE RMNOCASE, Description TEXT, UTCModDate FLOAT );


> CREATE TABLE TaskTable (TaskID INTEGER PRIMARY KEY, TaskType INTEGER, RefNumber TEXT, Name TEXT COLLATE RMNOCASE, Status INTEGER, Priority INTEGER, Date1 TEXT, Date2 TEXT, Date3 TEXT, SortDate1 BIGINT, SortDate2 BIGINT, SortDate3 BITINT, Filename TEXT, Details TEXT, Results TEXT, UTCModDate FLOAT, Exclude INTEGER );
> CREATE TABLE TaskLinkTable (LinkID INTEGER PRIMARY KEY, TaskID INTEGER, OwnerType INTEGER, OwnerID INTEGER, UTCModDate FLOAT );

< CREATE TABLE ResearchTable (TaskID INTEGER PRIMARY KEY, TaskType INTEGER, OwnerID INTEGER, OwnerType INTEGER, RefNumber TEXT, Name TEXT COLLATE RMNOCASE, Status INTEGER, Priority INTEGER, Date1 TEXT, Date2 TEXT, Date3 TEXT, SortDate1 INTEGER, SortDate2 INTEGER, SortDate3 INTEGER, Filename TEXT, Details BLOB );
< CREATE TABLE ResearchItemTable (ItemID INTEGER PRIMARY KEY, LogID INTEGER, Date TEXT, SortDate INTEGER, RefNumber TEXT, Repository TEXT, Goal TEXT, Source TEXT, Result TEXT );


< CREATE TABLE LinkTable (LinkID INTEGER PRIMARY KEY, extSystem INTEGER, LinkType INTEGER, rmID INTEGER, extID TEXT, Modified INTEGER, extVersion TEXT, extDate FLOAT, Status INTEGER, Note BLOB );
< CREATE TABLE LinkAncestryTable (LinkID INTEGER PRIMARY KEY, extSystem INTEGER, LinkType INTEGER, rmID INTEGER, extID TEXT, Modified INTEGER, extVersion TEXT, extDate FLOAT, Status INTEGER, Note BLOB );

> CREATE TABLE AncestryTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, anID TEXT, Modified INTEGER, anVersion TEXT, anDate FLOAT, Status INTEGER, UTCModDate FLOAT );
> CREATE TABLE FamilySearchTable (LinkID INTEGER PRIMARY KEY, LinkType INTEGER, rmID INTEGER, fsID TEXT, Modified INTEGER, fsVersion TEXT, fsDate FLOAT, Status INTEGER, UTCModDate FLOAT );
```

