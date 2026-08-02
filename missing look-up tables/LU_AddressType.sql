CREATE TABLE IF NOT EXISTS LU_AddressType (
    AddressID INTEGER PRIMARY KEY,
    AddressType TEXT NOT NULL
);

INSERT OR IGNORE INTO LU_SexType (SexID, SexType) VALUES
  (0, "Person"),
  (1, "Repository");

