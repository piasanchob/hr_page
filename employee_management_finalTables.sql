USE [master]
GO
/****** Object:  Database [HR]    Script Date: 26/4/2022 02:39:11 ******/
CREATE DATABASE [HR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HR] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR] SET RECOVERY FULL 
GO
ALTER DATABASE [HR] SET  MULTI_USER 
GO
ALTER DATABASE [HR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HR', N'ON'
GO
ALTER DATABASE [HR] SET QUERY_STORE = OFF
GO
USE [HR]
GO
/****** Object:  User [sa2]    Script Date: 26/4/2022 02:39:12 ******/
CREATE USER [sa2] FOR LOGIN [sa2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26/4/2022 02:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[picture] [varchar](500) NULL,
	[phoneNumber] [varchar](64) NOT NULL,
	[email] [varchar](64) NOT NULL,
	[hireDate] [date] NOT NULL,
	[timeWorked] [int] NOT NULL,
	[status] [int] NULL,
	[managerId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 26/4/2022 02:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Managers] FOREIGN KEY([managerId])
REFERENCES [dbo].[Managers] ([id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Managers]
GO
/****** Object:  StoredProcedure [dbo].[addEmployees]    Script Date: 26/4/2022 02:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[addEmployees] @inputName varchar(64), @inputPicture varchar(64), @inputPhoneNumber varchar(64),
@inputEmail varchar(64), @inputHireDate date, @inputManagerId int

AS
BEGIN
   
   INSERT INTO Employees VALUES
   (@inputName, @inputPicture, @inputPhoneNumber, @inputEmail, @inputHireDate, 0,1,@inputManagerId)

END
GO
/****** Object:  StoredProcedure [dbo].[delEmployee]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[delEmployee] @inputId int
AS
BEGIN

   UPDATE Employees
   SET status = 0
   WHERE id = @inputId

END
GO
/****** Object:  StoredProcedure [dbo].[GetManagerNames]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetManagerNames]
AS
BEGIN
   SELECT name FROM Managers
END
GO
/****** Object:  StoredProcedure [dbo].[insertManagers]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[insertManagers] @name varchar(64) 
AS
BEGIN

   INSERT INTO Managers(name) VALUES (@name)
END
GO
/****** Object:  StoredProcedure [dbo].[searchById]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[searchById] @inputId int
AS
BEGIN
   SELECT id,name,picture FROM Employees WHERE id = @inputId AND status = 1
   ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[searchByName]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[searchByName] @inputName varchar(64)
AS
BEGIN
   SELECT id,name,picture FROM Employees WHERE name = @inputName AND status = 1
   ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[showEmployee]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[showEmployee] @inputId int
AS
BEGIN

   SELECT * FROM Employees WHERE id = @inputId

END
GO
/****** Object:  StoredProcedure [dbo].[showEmployees]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[showEmployees] 
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
/****** Object:  StoredProcedure [dbo].[showManager]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[showManager] @inputId int
AS
BEGIN

   SELECT * FROM Managers WHERE id = @inputId

END
GO
/****** Object:  StoredProcedure [dbo].[showManagers]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[showManagers] 
AS
BEGIN

   SELECT * FROM Managers 

END
GO
/****** Object:  StoredProcedure [dbo].[updateManagers]    Script Date: 26/4/2022 02:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[updateManagers] @id int, @name varchar(64) 
AS
BEGIN

   UPDATE Managers
   SET name = @name
   WHERE id = @id
END
GO
USE [master]
GO
ALTER DATABASE [HR] SET  READ_WRITE 
GO
