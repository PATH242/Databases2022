CREATE TABLE account(
	accountId BIGSERIAL,
	name VARCHAR(60),
	credit decimal(13,2),
	currency VARCHAR(15)
);
CREATE PROCEDURE transaction
@id1 int,
@id2 int,
@money int
AS
