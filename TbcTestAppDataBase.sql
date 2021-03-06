USE [master]
GO
/****** Object:  Database [tbctest]    Script Date: 28.09.2020 22:43:00 ******/
CREATE DATABASE [tbctest]
 CONTAINMENT = NONE
GO
ALTER DATABASE [tbctest] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tbctest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tbctest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tbctest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tbctest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tbctest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tbctest] SET ARITHABORT OFF 
GO
ALTER DATABASE [tbctest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tbctest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tbctest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tbctest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tbctest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tbctest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tbctest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tbctest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tbctest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tbctest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tbctest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tbctest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tbctest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tbctest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tbctest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tbctest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tbctest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tbctest] SET RECOVERY FULL 
GO
ALTER DATABASE [tbctest] SET  MULTI_USER 
GO
ALTER DATABASE [tbctest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tbctest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tbctest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tbctest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tbctest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tbctest', N'ON'
GO
ALTER DATABASE [tbctest] SET QUERY_STORE = OFF
GO
USE [tbctest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [tbctest]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 28.09.2020 22:43:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonFiles]    Script Date: 28.09.2020 22:43:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_PersonFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonGender]    Script Date: 28.09.2020 22:43:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonGender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DateDeleted] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonGender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonPhoneNumbers]    Script Date: 28.09.2020 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonPhoneNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PhoneTypeId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_PersonPhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonRelationTypes]    Script Date: 28.09.2020 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonRelationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RelationTypeName] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_PersonRelationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 28.09.2020 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[RelationTypeId] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[GenderId] [int] NULL,
	[PersonalNumber] [nvarchar](11) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[CityId] [int] NULL,
	[HistoryRowId] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 28.09.2020 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnHandledExeptionLog]    Script Date: 28.09.2020 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnHandledExeptionLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExeptionMassage] [nvarchar](max) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_UnHandledExeptionLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonFiles]  WITH CHECK ADD  CONSTRAINT [FK_PersonFiles_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[PersonFiles] CHECK CONSTRAINT [FK_PersonFiles_Persons]
GO
ALTER TABLE [dbo].[PersonPhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumbers_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[PersonPhoneNumbers] CHECK CONSTRAINT [FK_PersonPhoneNumbers_Persons]
GO
ALTER TABLE [dbo].[PersonPhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumbers_PhoneTypes] FOREIGN KEY([PhoneTypeId])
REFERENCES [dbo].[PhoneTypes] ([Id])
GO
ALTER TABLE [dbo].[PersonPhoneNumbers] CHECK CONSTRAINT [FK_PersonPhoneNumbers_PhoneTypes]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Cities]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_PersonGender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[PersonGender] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_PersonGender]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_PersonRelationTypes] FOREIGN KEY([RelationTypeId])
REFERENCES [dbo].[PersonRelationTypes] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_PersonRelationTypes]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_PersonsParent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_PersonsParent]
GO
ALTER TABLE [dbo].[PersonPhoneNumbers]  WITH CHECK ADD  CONSTRAINT [CK_PersonPhoneNumbersValidation] CHECK  ((len([phonenumber])>(3) AND len([phonenumber])<(51)))
GO
ALTER TABLE [dbo].[PersonPhoneNumbers] CHECK CONSTRAINT [CK_PersonPhoneNumbersValidation]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [CK_Persons_DataValidation] CHECK  ((len([firstname])>(1) AND len([firstname])<(51) AND len([lastname])>(1) AND len([lastname])<(51) AND len([personalnumber])=(11)))
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [CK_Persons_DataValidation]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [CK_PersonsDOBValidation] CHECK  (([birthdate]<=dateadd(year,(-18),getdate())))
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [CK_PersonsDOBValidation]
GO
USE [master]
GO
ALTER DATABASE [tbctest] SET  READ_WRITE 
GO

USE [tbctest]
GO
BEGIN TRAN
SET IDENTITY_INSERT dbo.PersonGender ON;

 INSERT INTO dbo.PersonGender
  (
      Id,
      Gender,
      DateCreated
  )
  VALUES
	  (   1,         -- Id - int
      N'ქალი',       -- Gender - nvarchar(50)
      GETDATE()  -- DateCreaged - datetime
      ),
	  (   2,         -- Id - int
      N'კაცი',       -- Gender - nvarchar(50)
      GETDATE()  -- DateCreaged - datetime
      )
	  SET IDENTITY_INSERT dbo.PersonGender OFF	

	  SET IDENTITY_INSERT dbo.PersonRelationTypes ON;
	  INSERT dbo.PersonRelationTypes
	  (
		  Id,
	      RelationTypeName,
	      DateCreated
	  )
	  VALUES
	  (   1,
		  N'კოლეგა',       -- RelationTypeName - nchar(50)
	      GETDATE() -- DateCreated - datetime
	      ),
		  (   2,
		  N'ნაცნობი',       -- RelationTypeName - nchar(50)
	      GETDATE() -- DateCreated - datetime
	      ),
		  (   3,
		  N'ნათესავი',       -- RelationTypeName - nchar(50)
	      GETDATE() -- DateCreated - datetime
	      ),
		  (   4,
		  N'სხვა',       -- RelationTypeName - nchar(50)
	      GETDATE() -- DateCreated - datetime
	      )
		  SET IDENTITY_INSERT dbo.PersonRelationTypes OFF	



		  SET IDENTITY_INSERT dbo.PhoneTypes ON;
		  INSERT INTO dbo.PhoneTypes
		  (
			  Id,
		      PhoneType,
		      DateCreated
		  )
		  VALUES
		  (   1,
			  N'მობილური',       -- PhoneType - nchar(10)
		      GETDATE() -- DateCreated - datetime
		      ),
			  (   2,
			  N'ოფისის',       -- PhoneType - nchar(10)
		      GETDATE() -- DateCreated - datetime
		      ),
			  (   3,
			  N'სახლის',       -- PhoneType - nchar(10)
		      GETDATE() -- DateCreated - datetime
		      )
			  SET IDENTITY_INSERT dbo.PhoneTypes OFF;



			  SET IDENTITY_INSERT dbo.Cities ON;
			  INSERT INTO dbo.Cities
			  (
				  Id,
			      CityName,
			      DateCreated
			  )
			  VALUES
			  (   1,
				  N'ქალაქი1',       -- CityName - nchar(50)
			      GETDATE() -- DateCreated - datetime
			      ),
				   (  2,
				  N'ქალაქი2',       -- CityName - nchar(50)
			      GETDATE() -- DateCreated - datetime
			      ),
				   (   3,
				  N'ქალაქი3',       -- CityName - nchar(50)
			      GETDATE() -- DateCreated - datetime
			      ),
				   (  4,
				  N'ქალაქი4',       -- CityName - nchar(50)
			      GETDATE() -- DateCreated - datetime
			      ),
				   (   5,
				  N'ქალაქი5',       -- CityName - nchar(50)
			      GETDATE() -- DateCreated - datetime
			      )
				  SET IDENTITY_INSERT dbo.Cities OFF;


COMMIT

	

