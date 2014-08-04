
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/04/2014 20:05:30
-- Generated from EDMX file: C:\Users\KastanNotas\Documents\GitHub\BakalarkaWebAplication\Bakalarka\Bakalarka\DataModel.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


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

-- Creating table 'SchoolYearSet'
CREATE TABLE [dbo].[SchoolYearSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [ActualYear] bit  NOT NULL,
    [User_Id] nvarchar(128)  NOT NULL,
    [User_QRcode] nvarchar(128)  NOT NULL
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

-- Creating table 'SchoolResultsSet'
CREATE TABLE [dbo].[SchoolResultsSet] (
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

-- Creating table 'SchoolSheduleSet'
CREATE TABLE [dbo].[SchoolSheduleSet] (
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
    [MissingEnd] datetime  NOT NULL,
    [Excused] bit  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- Creating table 'SheduleItemSet'
CREATE TABLE [dbo].[SheduleItemSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BeginTime] time  NULL,
    [EndTime] time  NULL,
    [SchoolShedule_Id] int  NOT NULL,
    [SubjectSubCategory_Id] int  NOT NULL
);
GO

-- Creating table 'SheduleHoursSet'
CREATE TABLE [dbo].[SheduleHoursSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BeginTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [SchoolShedule_Id] int  NOT NULL,
    [SheduleItem_Id] int  NOT NULL
);
GO

-- Creating table 'InformationsSet'
CREATE TABLE [dbo].[InformationsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InfoForStudent] nvarchar(max)  NOT NULL,
    [InfoForParent] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [InfoForTeacher] bit  NOT NULL,
    [StudyGroup_Id] int  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id], [QRcode] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id], [QRcode] ASC);
GO

-- Creating primary key on [Id] in table 'SchoolYearSet'
ALTER TABLE [dbo].[SchoolYearSet]
ADD CONSTRAINT [PK_SchoolYearSet]
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

-- Creating primary key on [Id] in table 'SchoolResultsSet'
ALTER TABLE [dbo].[SchoolResultsSet]
ADD CONSTRAINT [PK_SchoolResultsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentsNotesSet'
ALTER TABLE [dbo].[StudentsNotesSet]
ADD CONSTRAINT [PK_StudentsNotesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SchoolSheduleSet'
ALTER TABLE [dbo].[SchoolSheduleSet]
ADD CONSTRAINT [PK_SchoolSheduleSet]
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

-- Creating foreign key on [User_Id], [User_QRcode] in table 'SchoolYearSet'
ALTER TABLE [dbo].[SchoolYearSet]
ADD CONSTRAINT [FK_UserSchoolYear]
    FOREIGN KEY ([User_Id], [User_QRcode])
    REFERENCES [dbo].[UserSet]
        ([Id], [QRcode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSchoolYear'
CREATE INDEX [IX_FK_UserSchoolYear]
ON [dbo].[SchoolYearSet]
    ([User_Id], [User_QRcode]);
GO

-- Creating foreign key on [SchoolYear_Id] in table 'StudyGroupSet'
ALTER TABLE [dbo].[StudyGroupSet]
ADD CONSTRAINT [FK_SchoolYearStudyGroup]
    FOREIGN KEY ([SchoolYear_Id])
    REFERENCES [dbo].[SchoolYearSet]
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
    REFERENCES [dbo].[SchoolYearSet]
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

-- Creating foreign key on [SubjectSubCategory_Id] in table 'SchoolResultsSet'
ALTER TABLE [dbo].[SchoolResultsSet]
ADD CONSTRAINT [FK_SubjectSubCategorySchoolResults]
    FOREIGN KEY ([SubjectSubCategory_Id])
    REFERENCES [dbo].[SubjectSubCategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectSubCategorySchoolResults'
CREATE INDEX [IX_FK_SubjectSubCategorySchoolResults]
ON [dbo].[SchoolResultsSet]
    ([SubjectSubCategory_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'SchoolResultsSet'
ALTER TABLE [dbo].[SchoolResultsSet]
ADD CONSTRAINT [FK_StudentSchoolResults]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentSchoolResults'
CREATE INDEX [IX_FK_StudentSchoolResults]
ON [dbo].[SchoolResultsSet]
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

-- Creating foreign key on [SchoolYear_Id] in table 'SchoolSheduleSet'
ALTER TABLE [dbo].[SchoolSheduleSet]
ADD CONSTRAINT [FK_SchoolYearSchoolShedule]
    FOREIGN KEY ([SchoolYear_Id])
    REFERENCES [dbo].[SchoolYearSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolYearSchoolShedule'
CREATE INDEX [IX_FK_SchoolYearSchoolShedule]
ON [dbo].[SchoolSheduleSet]
    ([SchoolYear_Id]);
GO

-- Creating foreign key on [SchoolShedule_Id] in table 'SheduleItemSet'
ALTER TABLE [dbo].[SheduleItemSet]
ADD CONSTRAINT [FK_SchoolSheduleSheduleItem]
    FOREIGN KEY ([SchoolShedule_Id])
    REFERENCES [dbo].[SchoolSheduleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSheduleSheduleItem'
CREATE INDEX [IX_FK_SchoolSheduleSheduleItem]
ON [dbo].[SheduleItemSet]
    ([SchoolShedule_Id]);
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

-- Creating foreign key on [SchoolShedule_Id] in table 'SheduleHoursSet'
ALTER TABLE [dbo].[SheduleHoursSet]
ADD CONSTRAINT [FK_SchoolSheduleSheduleHours]
    FOREIGN KEY ([SchoolShedule_Id])
    REFERENCES [dbo].[SchoolSheduleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSheduleSheduleHours'
CREATE INDEX [IX_FK_SchoolSheduleSheduleHours]
ON [dbo].[SheduleHoursSet]
    ([SchoolShedule_Id]);
GO

-- Creating foreign key on [SheduleItem_Id] in table 'SheduleHoursSet'
ALTER TABLE [dbo].[SheduleHoursSet]
ADD CONSTRAINT [FK_SheduleItemSheduleHours]
    FOREIGN KEY ([SheduleItem_Id])
    REFERENCES [dbo].[SheduleItemSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SheduleItemSheduleHours'
CREATE INDEX [IX_FK_SheduleItemSheduleHours]
ON [dbo].[SheduleHoursSet]
    ([SheduleItem_Id]);
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