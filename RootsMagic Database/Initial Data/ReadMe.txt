
To generate this data-
An empty database is created by RootsMagic using default options.
These data were generated on Windows, using the x64 edition of RM.
(Ideally, should use the 11.0.0 release etc)

Create the database dump



Open questions

When a user creates a new database/file in RootsMagic,
is the file created from SQL, or is a pre-created file duplicated and save?

An empty file is created in SQLite, the database objects are created
and then initial data is inserted into the database.
Initial data may include the Version Number of the schema.

Since ver 8, most (all ?) tables have an UTCModDate column.
Each initial database seems to have updated UTCModDate values for each row of
initial data.

