
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/04/2014 23:25:22
-- Generated from EDMX file: C:\Users\Topr\Documents\GitHub\BakalarkaWebAplication\Bakalarka\Bakalarka\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserSchoolYear]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[YearSet] DROP CONSTRAINT [FK_UserSchoolYear];
GO
IF OBJECT_ID(N'[dbo].[FK_SchoolYearStudyGroup]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudyGroupSet] DROP CONSTRAINT [FK_SchoolYearStudyGroup];
GO
IF OBJECT_ID(N'[dbo].[FK_StudyGroupStudent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentSet] DROP CONSTRAINT [FK_StudyGroupStudent];
GO
IF OBJECT_ID(N'[dbo].[FK_SchoolYearStudySubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudySubjectSet] DROP CONSTRAINT [FK_SchoolYearStudySubject];
GO
IF OBJECT_ID(N'[dbo].[FK_StudySubjectSubjectSubCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubjectSubCategorySet] DROP CONSTRAINT [FK_StudySubjectSubjectSubCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectSubCategorySchoolResults]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResultsSet] DROP CONSTRAINT [FK_SubjectSubCategorySchoolResults];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentSchoolResults]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResultsSet] DROP CONSTRAINT [FK_StudentSchoolResults];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectSubCategoryStudentsNotes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentsNotesSet] DROP CONSTRAINT [FK_SubjectSubCategoryStudentsNotes];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentStudentsNotes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentsNotesSet] DROP CONSTRAINT [FK_StudentStudentsNotes];
GO
IF OBJECT_ID(N'[dbo].[FK_SchoolYearSchoolShedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduleSet] DROP CONSTRAINT [FK_SchoolYearSchoolShedule];
GO
IF OBJECT_ID(N'[dbo].[FK_SchoolSheduleSheduleItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduleItemSet] DROP CONSTRAINT [FK_SchoolSheduleSheduleItem];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentAttendance]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttendanceSet] DROP CONSTRAINT [FK_StudentAttendance];
GO
IF OBJECT_ID(N'[dbo].[FK_SheduleItemSubjectSubCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduleItemSet] DROP CONSTRAINT [FK_SheduleItemSubjectSubCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_SchoolSheduleSheduleHours]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduleHoursSet] DROP CONSTRAINT [FK_SchoolSheduleSheduleHours];
GO
IF OBJECT_ID(N'[dbo].[FK_SheduleItemSheduleHours]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduleItemSet] DROP CONSTRAINT [FK_SheduleItemSheduleHours];
GO
IF OBJECT_ID(N'[dbo].[FK_StudyGroupInformations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InformationsSet] DROP CONSTRAINT [FK_StudyGroupInformations];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentInformations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InformationsSet] DROP CONSTRAINT [FK_StudentInformations];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[YearSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[YearSet];
GO
IF OBJECT_ID(N'[dbo].[StudyGroupSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudyGroupSet];
GO
IF OBJECT_ID(N'[dbo].[StudentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentSet];
GO
IF OBJECT_ID(N'[dbo].[StudySubjectSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudySubjectSet];
GO
IF OBJECT_ID(N'[dbo].[SubjectSubCategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubjectSubCategorySet];
GO
IF OBJECT_ID(N'[dbo].[ResultsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ResultsSet];
GO
IF OBJECT_ID(N'[dbo].[StudentsNotesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentsNotesSet];
GO
IF OBJECT_ID(N'[dbo].[SheduleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SheduleSet];
GO
IF OBJECT_ID(N'[dbo].[AttendanceSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AttendanceSet];
GO
IF OBJECT_ID(N'[dbo].[SheduleItemSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SheduleItemSet];
GO
IF OBJECT_ID(N'[dbo].[SheduleHoursSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SheduleHoursSet];
GO
IF OBJECT_ID(N'[dbo].[InformationsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InformationsSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] nvarchar(128)  NOT NULL,
    [UsingEvenOddShedule] bit  NOT NULL,
    [QRcode] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'YearSet'
CREATE TABLE [dbo].[YearSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [ActualYear] bit  NOT NULL,
    [User_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'StudyGroupSet'
CREATE TABLE [dbo].[StudyGroupSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GroupName] nvarchar(20)  NOT NULL,
    [SchoolYear_Id] int  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(20)  NOT NULL,
    [LastName] nvarchar(20)  NOT NULL,
    [PhoneNumber] nvarchar(15)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [QRcodeParent] nvarchar(128)  NOT NULL,
    [QRcodeStudent] nvarchar(128)  NOT NULL,
    [StudyGroup_Id] int  NOT NULL
);
GO

-- Creating table 'StudySubjectSet'
CREATE TABLE [dbo].[StudySubjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [SchoolYear_Id] int  NOT NULL
);
GO

-- Creating table 'SubjectSubCategorySet'
CREATE TABLE [dbo].[SubjectSubCategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [StudySubject_Id] int  NOT NULL
);
GO

-- Creating table 'ResultsSet'
CREATE TABLE [dbo].[ResultsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(50)  NOT NULL,
    [Score] decimal(2,1)  NOT NULL,
    [SubjectSubCategory_Id] int  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- Creating table 'StudentsNotesSet'
CREATE TABLE [dbo].[StudentsNotesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(20)  NOT NULL,
    [Note] nvarchar(max)  NOT NULL,
    [SubjectSubCategory_Id] int  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- Creating table 'SheduleSet'
CREATE TABLE [dbo].[SheduleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Period] nvarchar(1)  NULL,
    [EvenWeek] bit  NULL,
    [SchoolYear_Id] int  NOT NULL
);
GO

-- Creating table 'AttendanceSet'
CREATE TABLE [dbo].[AttendanceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MissingStart] datetime  NOT NULL,
    [MissingEnd] datetime  NULL,
    [Excused] bit  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- Creating table 'SheduleItemSet'
CREATE TABLE [dbo].[SheduleItemSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BeginTime] time  NULL,
    [EndTime] time  NULL,
    [Shedule_Id] int  NOT NULL,
    [SubjectSubCategory_Id] int  NOT NULL
);
GO

-- Creating table 'SheduleHoursSet'
CREATE TABLE [dbo].[SheduleHoursSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BeginTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [Shedule_Id] int  NOT NULL
);
GO

-- Creating table 'InformationsSet'
CREATE TABLE [dbo].[InformationsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InfoForStudent] nvarchar(max)  NOT NULL,
    [InfoForParent] nvarchar(max)  NOT NULL,
    [Description] nvarchar(20)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [StudyGroup_Id] int  NULL,
    [Student_Id] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'YearSet'
ALTER TABLE [dbo].[YearSet]
ADD CONSTRAINT [PK_YearSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudyGroupSet'
ALTER TABLE [dbo].[StudyGroupSet]
ADD CONSTRAINT [PK_StudyGroupSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudySubjectSet'
ALTER TABLE [dbo].[StudySubjectSet]
ADD CONSTRAINT [PK_StudySubjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubjectSubCategorySet'
ALTER TABLE [dbo].[SubjectSubCategorySet]
ADD CONSTRAINT [PK_SubjectSubCategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ResultsSet'
ALTER TABLE [dbo].[ResultsSet]
ADD CONSTRAINT [PK_ResultsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentsNotesSet'
ALTER TABLE [dbo].[StudentsNotesSet]
ADD CONSTRAINT [PK_StudentsNotesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SheduleSet'
ALTER TABLE [dbo].[SheduleSet]
ADD CONSTRAINT [PK_SheduleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AttendanceSet'
ALTER TABLE [dbo].[AttendanceSet]
ADD CONSTRAINT [PK_AttendanceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SheduleItemSet'
ALTER TABLE [dbo].[SheduleItemSet]
ADD CONSTRAINT [PK_SheduleItemSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SheduleHoursSet'
ALTER TABLE [dbo].[SheduleHoursSet]
ADD CONSTRAINT [PK_SheduleHoursSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InformationsSet'
ALTER TABLE [dbo].[InformationsSet]
ADD CONSTRAINT [PK_InformationsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'YearSet'
ALTER TABLE [dbo].[YearSet]
ADD CONSTRAINT [FK_UserSchoolYear]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSchoolYear'
CREATE INDEX [IX_FK_UserSchoolYear]
ON [dbo].[YearSet]
    ([User_Id]);
GO

-- Creating foreign key on [SchoolYear_Id] in table 'StudyGroupSet'
ALTER TABLE [dbo].[StudyGroupSet]
ADD CONSTRAINT [FK_SchoolYearStudyGroup]
    FOREIGN KEY ([SchoolYear_Id])
    REFERENCES [dbo].[YearSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolYearStudyGroup'
CREATE INDEX [IX_FK_SchoolYearStudyGroup]
ON [dbo].[StudyGroupSet]
    ([SchoolYear_Id]);
GO

-- Creating foreign key on [StudyGroup_Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [FK_StudyGroupStudent]
    FOREIGN KEY ([StudyGroup_Id])
    REFERENCES [dbo].[StudyGroupSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudyGroupStudent'
CREATE INDEX [IX_FK_StudyGroupStudent]
ON [dbo].[StudentSet]
    ([StudyGroup_Id]);
GO

-- Creating foreign key on [SchoolYear_Id] in table 'StudySubjectSet'
ALTER TABLE [dbo].[StudySubjectSet]
ADD CONSTRAINT [FK_SchoolYearStudySubject]
    FOREIGN KEY ([SchoolYear_Id])
    REFERENCES [dbo].[YearSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolYearStudySubject'
CREATE INDEX [IX_FK_SchoolYearStudySubject]
ON [dbo].[StudySubjectSet]
    ([SchoolYear_Id]);
GO

-- Creating foreign key on [StudySubject_Id] in table 'SubjectSubCategorySet'
ALTER TABLE [dbo].[SubjectSubCategorySet]
ADD CONSTRAINT [FK_StudySubjectSubjectSubCategory]
    FOREIGN KEY ([StudySubject_Id])
    REFERENCES [dbo].[StudySubjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudySubjectSubjectSubCategory'
CREATE INDEX [IX_FK_StudySubjectSubjectSubCategory]
ON [dbo].[SubjectSubCategorySet]
    ([StudySubject_Id]);
GO

-- Creating foreign key on [SubjectSubCategory_Id] in table 'ResultsSet'
ALTER TABLE [dbo].[ResultsSet]
ADD CONSTRAINT [FK_SubjectSubCategorySchoolResults]
    FOREIGN KEY ([SubjectSubCategory_Id])
    REFERENCES [dbo].[SubjectSubCategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectSubCategorySchoolResults'
CREATE INDEX [IX_FK_SubjectSubCategorySchoolResults]
ON [dbo].[ResultsSet]
    ([SubjectSubCategory_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'ResultsSet'
ALTER TABLE [dbo].[ResultsSet]
ADD CONSTRAINT [FK_StudentSchoolResults]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentSchoolResults'
CREATE INDEX [IX_FK_StudentSchoolResults]
ON [dbo].[ResultsSet]
    ([Student_Id]);
GO

-- Creating foreign key on [SubjectSubCategory_Id] in table 'StudentsNotesSet'
ALTER TABLE [dbo].[StudentsNotesSet]
ADD CONSTRAINT [FK_SubjectSubCategoryStudentsNotes]
    FOREIGN KEY ([SubjectSubCategory_Id])
    REFERENCES [dbo].[SubjectSubCategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectSubCategoryStudentsNotes'
CREATE INDEX [IX_FK_SubjectSubCategoryStudentsNotes]
ON [dbo].[StudentsNotesSet]
    ([SubjectSubCategory_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'StudentsNotesSet'
ALTER TABLE [dbo].[StudentsNotesSet]
ADD CONSTRAINT [FK_StudentStudentsNotes]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentStudentsNotes'
CREATE INDEX [IX_FK_StudentStudentsNotes]
ON [dbo].[StudentsNotesSet]
    ([Student_Id]);
GO

-- Creating foreign key on [SchoolYear_Id] in table 'SheduleSet'
ALTER TABLE [dbo].[SheduleSet]
ADD CONSTRAINT [FK_SchoolYearSchoolShedule]
    FOREIGN KEY ([SchoolYear_Id])
    REFERENCES [dbo].[YearSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolYearSchoolShedule'
CREATE INDEX [IX_FK_SchoolYearSchoolShedule]
ON [dbo].[SheduleSet]
    ([SchoolYear_Id]);
GO

-- Creating foreign key on [Shedule_Id] in table 'SheduleItemSet'
ALTER TABLE [dbo].[SheduleItemSet]
ADD CONSTRAINT [FK_SchoolSheduleSheduleItem]
    FOREIGN KEY ([Shedule_Id])
    REFERENCES [dbo].[SheduleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSheduleSheduleItem'
CREATE INDEX [IX_FK_SchoolSheduleSheduleItem]
ON [dbo].[SheduleItemSet]
    ([Shedule_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'AttendanceSet'
ALTER TABLE [dbo].[AttendanceSet]
ADD CONSTRAINT [FK_StudentAttendance]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentAttendance'
CREATE INDEX [IX_FK_StudentAttendance]
ON [dbo].[AttendanceSet]
    ([Student_Id]);
GO

-- Creating foreign key on [SubjectSubCategory_Id] in table 'SheduleItemSet'
ALTER TABLE [dbo].[SheduleItemSet]
ADD CONSTRAINT [FK_SheduleItemSubjectSubCategory]
    FOREIGN KEY ([SubjectSubCategory_Id])
    REFERENCES [dbo].[SubjectSubCategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SheduleItemSubjectSubCategory'
CREATE INDEX [IX_FK_SheduleItemSubjectSubCategory]
ON [dbo].[SheduleItemSet]
    ([SubjectSubCategory_Id]);
GO

-- Creating foreign key on [Shedule_Id] in table 'SheduleHoursSet'
ALTER TABLE [dbo].[SheduleHoursSet]
ADD CONSTRAINT [FK_SchoolSheduleSheduleHours]
    FOREIGN KEY ([Shedule_Id])
    REFERENCES [dbo].[SheduleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSheduleSheduleHours'
CREATE INDEX [IX_FK_SchoolSheduleSheduleHours]
ON [dbo].[SheduleHoursSet]
    ([Shedule_Id]);
GO

-- Creating foreign key on [StudyGroup_Id] in table 'InformationsSet'
ALTER TABLE [dbo].[InformationsSet]
ADD CONSTRAINT [FK_StudyGroupInformations]
    FOREIGN KEY ([StudyGroup_Id])
    REFERENCES [dbo].[StudyGroupSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudyGroupInformations'
CREATE INDEX [IX_FK_StudyGroupInformations]
ON [dbo].[InformationsSet]
    ([StudyGroup_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'InformationsSet'
ALTER TABLE [dbo].[InformationsSet]
ADD CONSTRAINT [FK_StudentInformations]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentInformations'
CREATE INDEX [IX_FK_StudentInformations]
ON [dbo].[InformationsSet]
    ([Student_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------