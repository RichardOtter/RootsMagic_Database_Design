# ConfigTable

## Purpose

Holds RM app configuration data. No genealogical data.

## Table DDL

``` SQL
CREATE TABLE ConfigTable (RecID INTEGER PRIMARY KEY, RecType INTEGER, Title TEXT, DataRec BLOB, UTCModDate FLOAT );

CREATE INDEX idxRecType ON ConfigTable (RecType);
```

## Columns List

| #   | Name       | Type    |
| --- | ---------- | ------- |
| 1   | RecID      | INTEGER |
| 2   | RecType    | INTEGER |
| 3   | Title      | TEXT    |
| 4   | DataRec    | BLOB    |
| 5   | UTCModDate | FLOAT   |

## Notes

| #   | Name       | Note |
| --- | ---------- | ---- |
| 1   | RecID      | _PK  |
| 2   | RecType    |      |
| 3   | Title      |      |
| 4   | DataRec    |      |
| 5   | UTCModDate | _STD |


```
RecType 1,3,4,5,6,7   no 2, mostly 5
Title TEXT
DataRec BLOB
UTCModDate FLOAT


RecType
1    main config                    Title=[blank]
3    custom report settings        Title=custom report user specified name
4    ??                            Title=MAIN & 1            
5    predefined report settings    Title=report name
6                                Title=WEB1
7    problem sttings                Title=PROB1 & POB2


    ===========================================DIV50==
    rowid    RecID    RecType    Title    DataRec    UTCModDate
    1    1    1        [BLOB_DATA]    45147.1934720255
    22    22    3    test    [BLOB_DATA]    
    28    28    3    immigrat    [BLOB_DATA]    
    52    52    3    FG proto    [BLOB_DATA]    44916.1396773032
    2    2    4    MAIN    [BLOB_DATA]    
    30    30    4    1    [BLOB_DATA]    45144.9324915394
    3    3    5    MEDIALIST    [BLOB_DATA]    
    4    4    5    KINSHIPLIST    [BLOB_DATA]    
    5    5    5    LDSLIST    [BLOB_DATA]    
    6    6    5    DUPLIST    [BLOB_DATA]    
    7    7    5    DESCLIST    [BLOB_DATA]    
    8    8    5    BOXCHART    [BLOB_DATA]    
    9    9    5    PEDCHART    [BLOB_DATA]    
    10    10    5    RELATECHART    [BLOB_DATA]    
    11    11    5    HOURGLASS    [BLOB_DATA]    
    12    12    5    INDIVSUMMARY    [BLOB_DATA]    
    13    13    5    SURNAMESTATS    [BLOB_DATA]    
    14    14    5    AHNENTAFEL    [BLOB_DATA]    
    15    15    5    FACTLIST    [BLOB_DATA]    
    16    16    5    INDIVLIST    [BLOB_DATA]    
    17    17    5    PLACELIST    [BLOB_DATA]    
    18    18    5    COUNTYCHECK    [BLOB_DATA]    
    19    19    5    STATISTICSLIST    [BLOB_DATA]    
    20    20    5    GROUPSHEET    [BLOB_DATA]    
    21    21    5    WEBTAGSLIST    [BLOB_DATA]    
    23    23    5    CUSTOMRPT    [BLOB_DATA]    
    24    24    5    BLANKREPORTS    [BLOB_DATA]    
    25    25    5    SOURCELIST    [BLOB_DATA]    
    26    26    5    ADDRLABELS    [BLOB_DATA]    
    29    29    5    rptTaskList    [BLOB_DATA]    44484.1527710185
    31    31    5    rptSurnameStatistics    [BLOB_DATA]    44484.1528169676
    32    32    5    rptSourceList    [BLOB_DATA]    45103.1695091088
    33    33    5    rptRelationshipChart    [BLOB_DATA]    45055.8186694097
    34    34    5    rptIndividualSummary    [BLOB_DATA]    44985.8273894444
    35    35    5    rptMultimediaList    [BLOB_DATA]    44565.9921435648
    36    36    5    rptAddressLabels    [BLOB_DATA]    44567.8425340162
    37    37    5    rptWhoWasThereList    [BLOB_DATA]    44628.7059010185
    38    38    5    rptFGS    [BLOB_DATA]    44997.9758127778
    39    39    5    rptPedigreeChart    [BLOB_DATA]    44640.0540819792
    42    42    5    rptCustomReport    [BLOB_DATA]    44916.1402024884
    43    43    5    rptFactList    [BLOB_DATA]    45087.1351957639
    44    44    5    rptDuplicateList    [BLOB_DATA]    44758.0270608681
    45    45    5    rptStatisticsList    [BLOB_DATA]    45089.9363217245
    46    46    5    rptIndividualList    [BLOB_DATA]    44997.9751678819
    47    47    5    rptWebTagsList    [BLOB_DATA]    44804.1184123727
    48    48    5    rptCountTrees    [BLOB_DATA]    44881.7024156713
    49    49    5    rptBoxChart    [BLOB_DATA]    45120.7562170486
    50    50    5    chartAncestorFan    [BLOB_DATA]    44884.2265676736
    51    51    5    rptPlaceList    [BLOB_DATA]    44907.7932423958
    53    53    5    chartAncestor    [BLOB_DATA]    45144.9324913542
    54    54    5    rptProblemList    [BLOB_DATA]    45029.9301888079
    55    55    5    chartDescendant    [BLOB_DATA]    45120.7568479861
    56    56    5    rptDescendantList    [BLOB_DATA]    45120.7564016088
    57    57    5    rptKinshipList    [BLOB_DATA]    45069.2003108912
    58    58    5    rptCountyCheck    [BLOB_DATA]    45089.9441190741
    40    40    6    WEB1    [BLOB_DATA]    45088.0334241204
    27    27    7    PROB1    [BLOB_DATA]    44986.7116882407
    41    41    7    PROB2    [BLOB_DATA]    45078.171658912
    
    ===========================================DIV50==



RecType=1    Title= [blank]

sample data from v11

data=


<Root>
    <Version>11000</Version>
    <STVersion>700</STVersion>
    <UniqueID>E8841905B21D49D79D2E878E0AC690B87147</UniqueID>
    <RootPerson>1</RootPerson>
    <LastPerson>1</LastPerson>
    <LastView>3</LastView>
    <LastSideView>0</LastSideView>
    <LastSearchView>1</LastSearchView>
    <LastMediaView>0</LastMediaView>
    <LastMediaAdd>1</LastMediaAdd>
    <StartPerson>1</StartPerson>
    <StartView>1</StartView>
    <StartSideView>0</StartSideView>
    <SurnameUp>false</SurnameUp>
    <LDSOptions>false</LDSOptions>
    <DateFormat>0</DateFormat>
    <RecNumber>1</RecNumber>
    <PreparerName>Richard J Otter</PreparerName>
    <PreparerAddr1>4232 Wilshire Blvd.</PreparerAddr1>
    <PreparerAddr2>Oakland, California 94602 USA</PreparerAddr2>
    <PreparerAddr3></PreparerAddr3>
    <PreparerPhone></PreparerPhone>
    <PreparerCellPhone>+1 510-604-1498</PreparerCellPhone>
    <PreparerEmail>RichardJOtter@gmail.com</PreparerEmail>
    <PreparerFax></PreparerFax>
    <PreparerWeb>https://RichardOtter.github.io</PreparerWeb>
    <LiveProblems>true</LiveProblems>
    <DefLang>en</DefLang>
    <WebHintStatus>1</WebHintStatus>
    <WebHints>true</WebHints>
    <MHHints>true</MHHints>
    <FSHints>true</FSHints>
    <FMPHints>false</FMPHints>
    <AncHints>true</AncHints>
    <AncRecordHints>true</AncRecordHints>
    <AncPersonHints>true</AncPersonHints>
    <AncPhotoHints>true</AncPhotoHints>
    <AncColorCode>true</AncColorCode>
    <MHRecordMatches>false</MHRecordMatches>
    <MHSmartMatches>true</MHSmartMatches>
    <MHConfidence>10</MHConfidence>
    <MHUserEmail>RichardJOtter@gmail.com</MHUserEmail>
    <FilterAncestryList>1</FilterAncestryList>
    <FSConfidence>50</FSConfidence>
    <FSFixes>0</FSFixes>
    <APFT1>1</APFT1>
    <APFT2>2</APFT2>
    <APFT3>4</APFT3>
    <APFT4>1065</APFT4>
    <APFT5>1062</APFT5>
    <RECST0>10005</RECST0>
    <RECST1>10068</RECST1>
    <RECST2>10071</RECST2>
    <RECST3>10023</RECST3>
    <RECST4>10023</RECST4>
    <RECST5>10051</RECST5>
    <RECST6>10023</RECST6>
    <RECST7>10023</RECST7>
    <RECST8>10023</RECST8>
    <RECST9>10023</RECST9>
    <RECST10>10023</RECST10>
    <RECST11>10023</RECST11>
    <RECST12>10023</RECST12>
    <RECST13>128</RECST13>
    <RECST14>10030</RECST14>
    <RECST15>10030</RECST15>
    <RECST16>10074</RECST16>
    <RECST17>10074</RECST17>
    <RECST18>10071</RECST18>
    <RECST19>10071</RECST19>
    <RECST20>10037</RECST20>
    <RECST21>10033</RECST21>
    <RECST22>10026</RECST22>
    <RECST23>10026</RECST23>
    <RECST24>10036</RECST24>
    <RECST25>157</RECST25>
    <RECST26>10008</RECST26>
    <RECST27>10033</RECST27>
    <RECST28>10033</RECST28>
    <RECST29>10008</RECST29>
    <RECST30>10008</RECST30>
    <RECST31>10008</RECST31>
    <RECST32>10033</RECST32>
    <RECST33>10033</RECST33>
    <RECST34>10033</RECST34>
    <RECST35>10033</RECST35>
    <RECST36>229</RECST36>
    <RECST37>229</RECST37>
    <RECST38>10008</RECST38>
    <RECST39>10008</RECST39>
    <RECST40>10008</RECST40>
    <RECST41>10008</RECST41>
    <RECST42>10008</RECST42>
    <RECST43>10008</RECST43>
    <RECST44>229</RECST44>
    <RECST45>229</RECST45>
    <RECST46>229</RECST46>
    <RECST47>229</RECST47>
    <RECST48>10008</RECST48>
    <RECST49>10008</RECST49>
    <RECRPT0>rptRelationshipChart</RECRPT0>
    <RECRPT1>rptKinshipList</RECRPT1>
    <RECRPT2>rptPedigreeChart</RECRPT2>
    <RECRPT3>rptFGS</RECRPT3>
    <MemCitID>121185</MemCitID>
    <NicknameDelim>1</NicknameDelim>
    <IGIUserName></IGIUserName>
    <IGIPassword></IGIPassword>
    <PedGens>5</PedGens>
    <DescGens>5</DescGens>
    <DescBEPS>false</DescBEPS>
    <AltNamesInSideList>true</AltNamesInSideList>
    <AltNamesInExplorer>false</AltNamesInExplorer>
    <AltNamesInPersonView>false</AltNamesInPersonView>
    <AltNamesInSearchView>true</AltNamesInSearchView>
    <ShowPictures>true</ShowPictures>
    <ShowAvatars>true</ShowAvatars>
    <DBColor>1</DBColor>
    <BirthInSideList>true</BirthInSideList>
    <RecNoInSideList>true</RecNoInSideList>
    <PersViewSortCol>4</PersViewSortCol>
    <PersViewSortAsc>false</PersViewSortAsc>
    <PersViewCol0>
        <FieldType>10000</FieldType>
        <EventType>1065</EventType>
        <DataType>3</DataType>
        <ColWidth>100</ColWidth>
    </PersViewCol0>
    <PersViewCol1>
        <FieldType>3</FieldType>
        <EventType>0</EventType>
        <DataType>0</DataType>
        <ColWidth>80</ColWidth>
    </PersViewCol1>
    <PersViewCol2>
        <FieldType>2</FieldType>
        <EventType>0</EventType>
        <DataType>0</DataType>
        <ColWidth>40</ColWidth>
    </PersViewCol2>
    <PersViewNameColWidth>254</PersViewNameColWidth>
    <SearchViewSortCol>4</SearchViewSortCol>
    <SearchViewSortAsc>true</SearchViewSortAsc>
    <SearchViewCol0>
        <FieldType>10000</FieldType>
        <EventType>1065</EventType>
        <DataType>3</DataType>
        <ColWidth>100</ColWidth>
    </SearchViewCol0>
    <SearchViewCol1>
        <FieldType>10000</FieldType>
        <EventType>17</EventType>
        <DataType>3</DataType>
        <ColWidth>100</ColWidth>
    </SearchViewCol1>
    <SearchViewCol2>
        <FieldType>10000</FieldType>
        <EventType>17</EventType>
        <DataType>2</DataType>
        <ColWidth>200</ColWidth>
    </SearchViewCol2>
    <SearchViewCol3>
        <FieldType>2</FieldType>
        <EventType>0</EventType>
        <DataType>0</DataType>
        <ColWidth>40</ColWidth>
    </SearchViewCol3>
    <SearchViewCol4>
        <FieldType>10000</FieldType>
        <EventType>1</EventType>
        <DataType>1</DataType>
        <ColWidth>80</ColWidth>
    </SearchViewCol4>
    <SearchViewCol5>
        <FieldType>10000</FieldType>
        <EventType>1</EventType>
        <DataType>2</DataType>
        <ColWidth>200</ColWidth>
    </SearchViewCol5>
    <SearchViewCol6>
        <FieldType>10000</FieldType>
        <EventType>2</EventType>
        <DataType>1</DataType>
        <ColWidth>80</ColWidth>
    </SearchViewCol6>
    <SearchViewCol7>
        <FieldType>10000</FieldType>
        <EventType>2</EventType>
        <DataType>2</DataType>
        <ColWidth>200</ColWidth>
    </SearchViewCol7>
    <SearchViewNameColWidth>197</SearchViewNameColWidth>
    <CplViewFathWidth>187</CplViewFathWidth>
    <CplViewMothWidth>150</CplViewMothWidth>
    <CplViewDateWidth>80</CplViewDateWidth>
    <CplViewPlaceWidth>180</CplViewPlaceWidth>
    <FanViewRelationWidth>100</FanViewRelationWidth>
    <FanViewRole1Width>100</FanViewRole1Width>
    <FanViewP1Width>180</FanViewP1Width>
    <FanViewRole2Width>100</FanViewRole2Width>
    <FanViewP2Width>180</FanViewP2Width>
    <FanViewDateWidth>80</FanViewDateWidth>
    <FanViewPlaceWidth>180</FanViewPlaceWidth>
    <TreeShareFactType1Width>80</TreeShareFactType1Width>
    <TreeShareFactType2Width>80</TreeShareFactType2Width>
    <TreeShareDate1Width>80</TreeShareDate1Width>
    <TreeShareDate2Width>80</TreeShareDate2Width>
    <EditPersEventWidth>131</EditPersEventWidth>
    <EditPersonDateWidth>124.333343505859</EditPersonDateWidth>
    <SideListBirthWidth>40</SideListBirthWidth>
    <SideListDeathWidth>40</SideListDeathWidth>
    <DescViewNameWidth>300</DescViewNameWidth>
    <DescViewArrowWidth>24</DescViewArrowWidth>
    <DescViewSexWidth>24</DescViewSexWidth>
    <DescViewBDateWidth>115</DescViewBDateWidth>
    <DescViewBPlaceWidth>300</DescViewBPlaceWidth>
    <DescViewDDateWidth>100</DescViewDDateWidth>
    <DescViewDPlaceWidth>300</DescViewDPlaceWidth>
    <EditPersonSourceWidth>250</EditPersonSourceWidth>
    <FSMatchPersonWidth>150</FSMatchPersonWidth>
    <FSMatchBDWidth>197</FSMatchBDWidth>
    <FSMatchBPWidth>150</FSMatchBPWidth>
    <FSMatchDDWidth>139</FSMatchDDWidth>
    <FSMatchDPWidth>150</FSMatchDPWidth>
    <FSMatchFatherWidth>150</FSMatchFatherWidth>
    <FSMatchMotherWidth>150</FSMatchMotherWidth>
    <FSMatchSpouseWidth>150</FSMatchSpouseWidth>
    <FSMatchFSIDWidth>80</FSMatchFSIDWidth>
    <DnaProviderWidth>64</DnaProviderWidth>
    <DnaPerson1Width>390.333343505859</DnaPerson1Width>
    <DnaPerson2Width>200</DnaPerson2Width>
    <DnaSharedCMWidth>120</DnaSharedCMWidth>
    <DnaSharedPercentWidth>85</DnaSharedPercentWidth>
    <DnaLargeSegWidth>76</DnaLargeSegWidth>
    <DnaSharedSegWidth>79</DnaSharedSegWidth>
    <DnaDateWidth>126</DnaDateWidth>
    <DnaRelWidth>200</DnaRelWidth>
    <DnaDnaRelWidth>200</DnaDnaRelWidth>
    <HealthConditionWidth>200</HealthConditionWidth>
    <HealthDetailsWidth>200</HealthDetailsWidth>
    <HealthDateWidth>100</HealthDateWidth>
    <CitationsCollapsed>false</CitationsCollapsed>
    <CitationsCollapsed_Tasks>false</CitationsCollapsed_Tasks>
    <WitnessesCollapsed>false</WitnessesCollapsed>
    <MediaCollapsed>false</MediaCollapsed>
    <MediaCollapsed_Places>false</MediaCollapsed_Places>
    <MediaCollapsed_Citations>true</MediaCollapsed_Citations>
    <MediaCollapsed_Sources>false</MediaCollapsed_Sources>
    <MediaCollapsed_Tasks>false</MediaCollapsed_Tasks>
    <TasksCollapsed>false</TasksCollapsed>
    <TasksCollapsed_Places>false</TasksCollapsed_Places>
    <AddressesCollapsed>false</AddressesCollapsed>
    <AddressesCollapsed_Sources>false</AddressesCollapsed_Sources>
    <AddressesCollapsed_Citations>false</AddressesCollapsed_Citations>
    <AddressesCollapsed_TasksAddr>false</AddressesCollapsed_TasksAddr>
    <AddressesCollapsed_TasksRepo>false</AddressesCollapsed_TasksRepo>
    <EnableFS>true</EnableFS>
    <FSCheckDupOrds>false</FSCheckDupOrds>
    <FSFilterType>All</FSFilterType>
    <FSFilterGroupID>0</FSFilterGroupID>
    <FSFilterGenerations>11</FSFilterGenerations>
    <FSFilterStartPerson>2361</FSFilterStartPerson>
    <TimelineReversePlaceNames>false</TimelineReversePlaceNames>
    <TimelinePlaceDetails>false</TimelinePlaceDetails>
    <TimelineSharedEvents>true</TimelineSharedEvents>
    <TimelineAssociations>true</TimelineAssociations>
    <TimelineRelatives>false</TimelineRelatives>
    <TimelineParents>false</TimelineParents>
    <TimelineSiblings>false</TimelineSiblings>
    <TimelineChildren>true</TimelineChildren>
    <TimelineSpouses>true</TimelineSpouses>
    <TimelineDblRows>true</TimelineDblRows>
    <TimelineSortBy>2</TimelineSortBy>
    <NameSpacing>false</NameSpacing>
    <NameInvalidCharacters>false</NameInvalidCharacters>
    <NamePunctuation>false</NamePunctuation>
    <NameAllUppercase>false</NameAllUppercase>
    <NameCapitalization>false</NameCapitalization>
    <NameAbbreviation>false</NameAbbreviation>
    <NameDescription>false</NameDescription>
    <NameMisplacedNickname>false</NameMisplacedNickname>
    <NameMisplacedPrefix>false</NameMisplacedPrefix>
    <NameMisplacedSuffix>false</NameMisplacedSuffix>
    <NameAlternateName>false</NameAlternateName>
    <NameWifeHasHusbandSurname>false</NameWifeHasHusbandSurname>
    <PlaceSpacing>false</PlaceSpacing>
    <PlaceInvalidCharacters>false</PlaceInvalidCharacters>
    <PlacePunctuation>false</PlacePunctuation>
    <PlaceAllUppercase>false</PlaceAllUppercase>
    <PlaceCapitalization>false</PlaceCapitalization>
    <PlaceAbbreviation>false</PlaceAbbreviation>
    <PlaceBlankPieces>false</PlaceBlankPieces>
    <PlaceMisplacedDetails>false</PlaceMisplacedDetails>
    <PlaceAddCountry>false</PlaceAddCountry>
    <PlaceRemoveCountry>false</PlaceRemoveCountry>
    <PlaceReplaceBrackets>false</PlaceReplaceBrackets>
    <LastDNAProvider>2</LastDNAProvider>
    <RelateCalcID2>1530</RelateCalcID2>
    <ColorCodeSet>1</ColorCodeSet>
    <ColorCode0>
        <Name>Ancestors </Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14>Ancestos and spouses</FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode0>
    <ColorCode1>
        <Name>Research goals</Name>
        <FieldName0></FieldName0>
        <FieldName1>Died before 16</FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4>not related</FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7>FACT-DNA: exists</FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10>CAO Ancestors</FieldName10>
        <FieldName11></FieldName11>
        <FieldName12>CP=STOP</FieldName12>
        <FieldName13></FieldName13>
        <FieldName14>Cousins_CAO_ext</FieldName14>
        <FieldName15></FieldName15>
        <FieldName16>Not Connected to RJO</FieldName16>
        <FieldName17>CP=Start of line.</FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20>CP=TODO</FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27>CP=TODO Start of line.</FieldName27>
    </ColorCode1>
    <ColorCode2>
        <Name></Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode2>
    <ColorCode3>
        <Name>Cousins- RJO, GCS, KEF</Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode3>
    <ColorCode4>
        <Name></Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode4>
    <ColorCode5>
        <Name></Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode5>
    <ColorCode6>
        <Name>Test</Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10>Not in RJO tree</FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode6>
    <ColorCode7>
        <Name>DNA matches &amp; intermediates</Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17>DNA Match &amp; intermediates</FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode7>
    <ColorCode8>
        <Name></Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27></FieldName27>
    </ColorCode8>
    <ColorCode9>
        <Name></Name>
        <FieldName0></FieldName0>
        <FieldName1></FieldName1>
        <FieldName2></FieldName2>
        <FieldName3></FieldName3>
        <FieldName4></FieldName4>
        <FieldName5></FieldName5>
        <FieldName6></FieldName6>
        <FieldName7></FieldName7>
        <FieldName8></FieldName8>
        <FieldName9></FieldName9>
        <FieldName10></FieldName10>
        <FieldName11></FieldName11>
        <FieldName12></FieldName12>
        <FieldName13></FieldName13>
        <FieldName14></FieldName14>
        <FieldName15></FieldName15>
        <FieldName16></FieldName16>
        <FieldName17></FieldName17>
        <FieldName18></FieldName18>
        <FieldName19></FieldName19>
        <FieldName20></FieldName20>
        <FieldName21></FieldName21>
        <FieldName22></FieldName22>
        <FieldName23></FieldName23>
        <FieldName24></FieldName24>
        <FieldName25></FieldName25>
        <FieldName26></FieldName26>
        <FieldName27>no in rjo main tree</FieldName27>
    </ColorCode9>
</Root>

## Open Questions

