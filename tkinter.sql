use SAMPLE_DB;
select * from Candidate_Data;






CREATE INDEX idx_phone_no ON Candidate_Data (Phone_No);
































delete from Candidate_Data where ID = 9;

-- Get the current maximum ID value
Use SAMPLE_DB;
SELECT MAX(ID) FROM Candidate_Data;

-- Reseed the IDENTITY column
DBCC CHECKIDENT ('Candidate_Data', RESEED, 6);

DROP INDEX IF EXISTS idx_phone_no ON Candidate_Data;








