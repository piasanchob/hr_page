use HR


GO
CREATE OR ALTER PROCEDURE searchById @inputId int
AS
BEGIN
   SELECT id,name,picture FROM Employees WHERE id = @inputId AND status = 1
   ORDER BY name
END
GO


GO
CREATE OR ALTER PROCEDURE searchByName @inputName varchar(64)
AS
BEGIN
   SELECT id,name,picture FROM Employees WHERE name = @inputName AND status = 1
   ORDER BY name
END
GO


GO
CREATE OR ALTER PROCEDURE addEmployees @inputName varchar(64), @inputPicture varchar(64), @inputPhoneNumber varchar(64),
@inputEmail varchar(64), @inputHireDate date, @inputManagerId int

AS
BEGIN
   
   INSERT INTO Employees VALUES
   (@inputName, @inputPicture, @inputPhoneNumber, @inputEmail, @inputHireDate, 0,1,@inputManagerId)

END
GO


GO
CREATE OR ALTER PROCEDURE showEmployee @inputId int
AS
BEGIN

   SELECT * FROM Employees WHERE id = @inputId

END
GO


GO
CREATE OR ALTER PROCEDURE showEmployees 
AS
BEGIN

   SELECT id, name, picture,phoneNumber,email,
                    convert(varchar(10),hireDate,120) as hireDate
                    ,timeWorked,status,managerId
                    from Employees
					WHERE status = 1
					ORDER BY name

END
GO


GO
CREATE OR ALTER PROCEDURE showManager @inputId int
AS
BEGIN

   SELECT * FROM Managers WHERE id = @inputId

END
GO



GO
CREATE OR ALTER PROCEDURE showManagers 
AS
BEGIN

   SELECT * FROM Managers 

END
GO


GO
CREATE OR ALTER PROCEDURE delEmployee @inputId int
AS
BEGIN

   UPDATE Employees
   SET status = 0
   WHERE id = @inputId

END
GO


GO
CREATE OR ALTER PROCEDURE insertManagers @name varchar(64) 
AS
BEGIN

   INSERT INTO Managers(name) VALUES (@name)
END
GO


GO
CREATE OR ALTER PROCEDURE updateManagers @id int, @name varchar(64) 
AS
BEGIN

   UPDATE Managers
   SET name = @name
   WHERE id = @id
END
GO

SELECT * FROM Employees



GO
CREATE OR ALTER PROCEDURE GetManagerNames
AS
BEGIN
   SELECT name FROM Managers
END
GO