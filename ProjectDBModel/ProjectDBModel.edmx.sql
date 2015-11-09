
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/07/2015 00:32:01
-- Generated from EDMX file: \\vmware-host\Shared Folders\Downloads\ProjectSolution_V1_Bisicious\ProjectSolution\ProjectDBModel\ProjectDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjectDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AccountAccountType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountAccountType];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountAttachment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attachments] DROP CONSTRAINT [FK_AccountAttachment];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_AccountComment];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountConnection_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountConnection] DROP CONSTRAINT [FK_AccountConnection_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountConnection_Connection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountConnection] DROP CONSTRAINT [FK_AccountConnection_Connection];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountLink_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountLink] DROP CONSTRAINT [FK_AccountLink_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountLink_Link]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountLink] DROP CONSTRAINT [FK_AccountLink_Link];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountMail_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountMail] DROP CONSTRAINT [FK_AccountMail_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountMail_Mail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountMail] DROP CONSTRAINT [FK_AccountMail_Mail];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_AccountProject];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_AccountRating];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTeam]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Teams] DROP CONSTRAINT [FK_AccountTeam];
GO
IF OBJECT_ID(N'[dbo].[FK_CommentRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_CommentRating];
GO
IF OBJECT_ID(N'[dbo].[FK_ConnectionConnectionStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ConnectionStatuses] DROP CONSTRAINT [FK_ConnectionConnectionStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ConnectionsConnectionStatuses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ConnectionStatuses] DROP CONSTRAINT [FK_ConnectionsConnectionStatuses];
GO
IF OBJECT_ID(N'[dbo].[FK_MailAttachment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attachments] DROP CONSTRAINT [FK_MailAttachment];
GO
IF OBJECT_ID(N'[dbo].[FK_MailMailFlag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Mails] DROP CONSTRAINT [FK_MailMailFlag];
GO
IF OBJECT_ID(N'[dbo].[FK_MailRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_MailRating];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectAttachment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attachments] DROP CONSTRAINT [FK_ProjectAttachment];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_ProjectComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_ProjectRating];
GO
IF OBJECT_ID(N'[dbo].[FK_RatingsRatingTypes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RatingTypes] DROP CONSTRAINT [FK_RatingsRatingTypes];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AccountConnection]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountConnection];
GO
IF OBJECT_ID(N'[dbo].[AccountLink]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountLink];
GO
IF OBJECT_ID(N'[dbo].[AccountMail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountMail];
GO
IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[AccountTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountTypes];
GO
IF OBJECT_ID(N'[dbo].[Attachments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Attachments];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Connections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Connections];
GO
IF OBJECT_ID(N'[dbo].[ConnectionStatuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ConnectionStatuses];
GO
IF OBJECT_ID(N'[dbo].[Links]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Links];
GO
IF OBJECT_ID(N'[dbo].[MailFlags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MailFlags];
GO
IF OBJECT_ID(N'[dbo].[Mails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mails];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Ratings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ratings];
GO
IF OBJECT_ID(N'[dbo].[RatingTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RatingTypes];
GO
IF OBJECT_ID(N'[dbo].[Teams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NOT NULL,
    [ConfirmPassword] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Company] nvarchar(max)  NULL,
    [CompanyLogo] nvarchar(max)  NULL,
    [Street] nvarchar(max)  NULL,
    [PostalCode] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [State] nvarchar(max)  NULL,
    [Country] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NULL,
    [CellPhone] nvarchar(max)  NULL,
    [FaxNumber] nvarchar(max)  NULL,
    [Website] nvarchar(max)  NULL,
    [About] nvarchar(max)  NULL,
    [AccountType_Id] int  NOT NULL,
    [UserName] nvarchar(max)  NULL,
    [Salt] nvarchar(max)  NULL
);
GO

-- Creating table 'AccountTypes'
CREATE TABLE [dbo].[AccountTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [AccountTypeLogo] nvarchar(max)  NULL
);
GO

-- Creating table 'Attachments'
CREATE TABLE [dbo].[Attachments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AttachmentName] nvarchar(max)  NOT NULL,
    [AttachmentCreator] nvarchar(max)  NOT NULL,
    [FileType] nvarchar(max)  NOT NULL,
    [FileSize] nvarchar(max)  NOT NULL,
    [AttachmentDate] nvarchar(max)  NOT NULL,
    [AttachmentTime] nvarchar(max)  NOT NULL,
    [EncryptedName] nvarchar(max)  NOT NULL,
    [ProjectsId] int  NULL,
    [AccountId] int  NOT NULL,
    [MailId] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CommentData] nvarchar(max)  NOT NULL,
    [CommentTarget] nvarchar(max)  NOT NULL,
    [CommentDate] nvarchar(max)  NOT NULL,
    [CommentTime] nvarchar(max)  NOT NULL,
    [CommentAttachement] nvarchar(max)  NOT NULL,
    [AccountId] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- Creating table 'Connections'
CREATE TABLE [dbo].[Connections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StarterID] nvarchar(max)  NOT NULL,
    [InvestorID] nvarchar(max)  NOT NULL,
    [ConnectionDate] nvarchar(max)  NOT NULL,
    [ConnectionTime] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ConnectionStatuses'
CREATE TABLE [dbo].[ConnectionStatuses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StatusName] nvarchar(max)  NOT NULL,
    [StatusLogo] nvarchar(max)  NOT NULL,
    [Connection_Id] int  NOT NULL,
    [ConnectionId] int  NOT NULL
);
GO

-- Creating table 'Links'
CREATE TABLE [dbo].[Links] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LinkName] nvarchar(max)  NOT NULL,
    [LinkUrl] nvarchar(max)  NOT NULL,
    [LinkLogo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MailFlags'
CREATE TABLE [dbo].[MailFlags] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Mails'
CREATE TABLE [dbo].[Mails] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmailAddress] nvarchar(max)  NOT NULL,
    [FromEmail] nvarchar(max)  NOT NULL,
    [ToEmail] nvarchar(max)  NOT NULL,
    [MailedBy] nvarchar(max)  NOT NULL,
    [MailSubject] nvarchar(max)  NOT NULL,
    [MailDate] nvarchar(max)  NOT NULL,
    [MailTime] nvarchar(max)  NOT NULL,
    [MailFlag] nvarchar(max)  NOT NULL,
    [MailAttachment] nvarchar(max)  NOT NULL,
    [MailCc] nvarchar(max)  NOT NULL,
    [MailBCc] nvarchar(max)  NOT NULL,
    [MailLink] nvarchar(max)  NOT NULL,
    [ReplyToEmail] nvarchar(max)  NOT NULL,
    [MailFlag1_Id] int  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PName] nvarchar(max)  NOT NULL,
    [PSubHeading] nvarchar(max)  NULL,
    [PInfo] nvarchar(1000)  NULL,
    [PLogo] nvarchar(max)  NULL,
    [PRatings] nvarchar(max)  NULL,
    [ReqInvestment] nvarchar(max)  NULL,
    [PStartDate] nvarchar(max)  NULL,
    [PEndDate] nvarchar(max)  NULL,
    [AccountId] int  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RatingCount] nvarchar(max)  NOT NULL,
    [WhoRated] nvarchar(max)  NOT NULL,
    [WhoIsRated] nvarchar(max)  NOT NULL,
    [RatingTime] nvarchar(max)  NOT NULL,
    [RatingTypeId] int  NOT NULL,
    [AccountId] int  NOT NULL,
    [CommentId] int  NOT NULL,
    [MailId] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- Creating table 'RatingTypes'
CREATE TABLE [dbo].[RatingTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RatingTypeName] nvarchar(max)  NOT NULL,
    [Rating_Id] int  NOT NULL
);
GO

-- Creating table 'Teams'
CREATE TABLE [dbo].[Teams] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeamMemberName] nvarchar(max)  NOT NULL,
    [TeamGroupID] nvarchar(max)  NOT NULL,
    [AccountId] int  NOT NULL
);
GO

-- Creating table 'AccountConnection'
CREATE TABLE [dbo].[AccountConnection] (
    [Accounts_Id] int  NOT NULL,
    [Connections_Id] int  NOT NULL
);
GO

-- Creating table 'AccountLink'
CREATE TABLE [dbo].[AccountLink] (
    [Accounts_Id] int  NOT NULL,
    [Links_Id] int  NOT NULL
);
GO

-- Creating table 'AccountMail'
CREATE TABLE [dbo].[AccountMail] (
    [Accounts_Id] int  NOT NULL,
    [Mails_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AccountTypes'
ALTER TABLE [dbo].[AccountTypes]
ADD CONSTRAINT [PK_AccountTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Attachments'
ALTER TABLE [dbo].[Attachments]
ADD CONSTRAINT [PK_Attachments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Connections'
ALTER TABLE [dbo].[Connections]
ADD CONSTRAINT [PK_Connections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ConnectionStatuses'
ALTER TABLE [dbo].[ConnectionStatuses]
ADD CONSTRAINT [PK_ConnectionStatuses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Links'
ALTER TABLE [dbo].[Links]
ADD CONSTRAINT [PK_Links]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MailFlags'
ALTER TABLE [dbo].[MailFlags]
ADD CONSTRAINT [PK_MailFlags]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Mails'
ALTER TABLE [dbo].[Mails]
ADD CONSTRAINT [PK_Mails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RatingTypes'
ALTER TABLE [dbo].[RatingTypes]
ADD CONSTRAINT [PK_RatingTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teams'
ALTER TABLE [dbo].[Teams]
ADD CONSTRAINT [PK_Teams]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Accounts_Id], [Connections_Id] in table 'AccountConnection'
ALTER TABLE [dbo].[AccountConnection]
ADD CONSTRAINT [PK_AccountConnection]
    PRIMARY KEY CLUSTERED ([Accounts_Id], [Connections_Id] ASC);
GO

-- Creating primary key on [Accounts_Id], [Links_Id] in table 'AccountLink'
ALTER TABLE [dbo].[AccountLink]
ADD CONSTRAINT [PK_AccountLink]
    PRIMARY KEY CLUSTERED ([Accounts_Id], [Links_Id] ASC);
GO

-- Creating primary key on [Accounts_Id], [Mails_Id] in table 'AccountMail'
ALTER TABLE [dbo].[AccountMail]
ADD CONSTRAINT [PK_AccountMail]
    PRIMARY KEY CLUSTERED ([Accounts_Id], [Mails_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AccountType_Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_AccountAccountType]
    FOREIGN KEY ([AccountType_Id])
    REFERENCES [dbo].[AccountTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccountType'
CREATE INDEX [IX_FK_AccountAccountType]
ON [dbo].[Accounts]
    ([AccountType_Id]);
GO

-- Creating foreign key on [AccountId] in table 'Attachments'
ALTER TABLE [dbo].[Attachments]
ADD CONSTRAINT [FK_AccountAttachment]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAttachment'
CREATE INDEX [IX_FK_AccountAttachment]
ON [dbo].[Attachments]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_AccountComment]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountComment'
CREATE INDEX [IX_FK_AccountComment]
ON [dbo].[Comments]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_AccountProject]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountProject'
CREATE INDEX [IX_FK_AccountProject]
ON [dbo].[Projects]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_AccountRating]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountRating'
CREATE INDEX [IX_FK_AccountRating]
ON [dbo].[Ratings]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Teams'
ALTER TABLE [dbo].[Teams]
ADD CONSTRAINT [FK_AccountTeam]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountTeam'
CREATE INDEX [IX_FK_AccountTeam]
ON [dbo].[Teams]
    ([AccountId]);
GO

-- Creating foreign key on [MailId] in table 'Attachments'
ALTER TABLE [dbo].[Attachments]
ADD CONSTRAINT [FK_MailAttachment]
    FOREIGN KEY ([MailId])
    REFERENCES [dbo].[Mails]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MailAttachment'
CREATE INDEX [IX_FK_MailAttachment]
ON [dbo].[Attachments]
    ([MailId]);
GO

-- Creating foreign key on [ProjectId] in table 'Attachments'
ALTER TABLE [dbo].[Attachments]
ADD CONSTRAINT [FK_ProjectAttachment]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectAttachment'
CREATE INDEX [IX_FK_ProjectAttachment]
ON [dbo].[Attachments]
    ([ProjectId]);
GO

-- Creating foreign key on [CommentId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_CommentRating]
    FOREIGN KEY ([CommentId])
    REFERENCES [dbo].[Comments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentRating'
CREATE INDEX [IX_FK_CommentRating]
ON [dbo].[Ratings]
    ([CommentId]);
GO

-- Creating foreign key on [ProjectId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_ProjectComment]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectComment'
CREATE INDEX [IX_FK_ProjectComment]
ON [dbo].[Comments]
    ([ProjectId]);
GO

-- Creating foreign key on [ConnectionId] in table 'ConnectionStatuses'
ALTER TABLE [dbo].[ConnectionStatuses]
ADD CONSTRAINT [FK_ConnectionConnectionStatus]
    FOREIGN KEY ([ConnectionId])
    REFERENCES [dbo].[Connections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConnectionConnectionStatus'
CREATE INDEX [IX_FK_ConnectionConnectionStatus]
ON [dbo].[ConnectionStatuses]
    ([ConnectionId]);
GO

-- Creating foreign key on [Connection_Id] in table 'ConnectionStatuses'
ALTER TABLE [dbo].[ConnectionStatuses]
ADD CONSTRAINT [FK_ConnectionsConnectionStatuses]
    FOREIGN KEY ([Connection_Id])
    REFERENCES [dbo].[Connections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConnectionsConnectionStatuses'
CREATE INDEX [IX_FK_ConnectionsConnectionStatuses]
ON [dbo].[ConnectionStatuses]
    ([Connection_Id]);
GO

-- Creating foreign key on [MailFlag1_Id] in table 'Mails'
ALTER TABLE [dbo].[Mails]
ADD CONSTRAINT [FK_MailMailFlag]
    FOREIGN KEY ([MailFlag1_Id])
    REFERENCES [dbo].[MailFlags]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MailMailFlag'
CREATE INDEX [IX_FK_MailMailFlag]
ON [dbo].[Mails]
    ([MailFlag1_Id]);
GO

-- Creating foreign key on [MailId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_MailRating]
    FOREIGN KEY ([MailId])
    REFERENCES [dbo].[Mails]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MailRating'
CREATE INDEX [IX_FK_MailRating]
ON [dbo].[Ratings]
    ([MailId]);
GO

-- Creating foreign key on [ProjectId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_ProjectRating]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectRating'
CREATE INDEX [IX_FK_ProjectRating]
ON [dbo].[Ratings]
    ([ProjectId]);
GO

-- Creating foreign key on [Rating_Id] in table 'RatingTypes'
ALTER TABLE [dbo].[RatingTypes]
ADD CONSTRAINT [FK_RatingsRatingTypes]
    FOREIGN KEY ([Rating_Id])
    REFERENCES [dbo].[Ratings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingsRatingTypes'
CREATE INDEX [IX_FK_RatingsRatingTypes]
ON [dbo].[RatingTypes]
    ([Rating_Id]);
GO

-- Creating foreign key on [Accounts_Id] in table 'AccountConnection'
ALTER TABLE [dbo].[AccountConnection]
ADD CONSTRAINT [FK_AccountConnection_Accounts]
    FOREIGN KEY ([Accounts_Id])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Connections_Id] in table 'AccountConnection'
ALTER TABLE [dbo].[AccountConnection]
ADD CONSTRAINT [FK_AccountConnection_Connections]
    FOREIGN KEY ([Connections_Id])
    REFERENCES [dbo].[Connections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountConnection_Connections'
CREATE INDEX [IX_FK_AccountConnection_Connections]
ON [dbo].[AccountConnection]
    ([Connections_Id]);
GO

-- Creating foreign key on [Accounts_Id] in table 'AccountLink'
ALTER TABLE [dbo].[AccountLink]
ADD CONSTRAINT [FK_AccountLink_Accounts]
    FOREIGN KEY ([Accounts_Id])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Links_Id] in table 'AccountLink'
ALTER TABLE [dbo].[AccountLink]
ADD CONSTRAINT [FK_AccountLink_Links]
    FOREIGN KEY ([Links_Id])
    REFERENCES [dbo].[Links]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountLink_Links'
CREATE INDEX [IX_FK_AccountLink_Links]
ON [dbo].[AccountLink]
    ([Links_Id]);
GO

-- Creating foreign key on [Accounts_Id] in table 'AccountMail'
ALTER TABLE [dbo].[AccountMail]
ADD CONSTRAINT [FK_AccountMail_Accounts]
    FOREIGN KEY ([Accounts_Id])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mails_Id] in table 'AccountMail'
ALTER TABLE [dbo].[AccountMail]
ADD CONSTRAINT [FK_AccountMail_Mails]
    FOREIGN KEY ([Mails_Id])
    REFERENCES [dbo].[Mails]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountMail_Mails'
CREATE INDEX [IX_FK_AccountMail_Mails]
ON [dbo].[AccountMail]
    ([Mails_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------