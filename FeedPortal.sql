/****** Object:  Database [FeedPortal]    Script Date: 16-Mar-22 4:39:35 PM ******/
CREATE DATABASE [FeedPortal]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [FeedPortal] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [FeedPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FeedPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FeedPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FeedPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FeedPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [FeedPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FeedPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FeedPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FeedPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FeedPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FeedPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FeedPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FeedPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FeedPortal] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [FeedPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FeedPortal] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FeedPortal] SET  MULTI_USER 
GO
ALTER DATABASE [FeedPortal] SET ENCRYPTION ON
GO
ALTER DATABASE [FeedPortal] SET QUERY_STORE = ON
GO
ALTER DATABASE [FeedPortal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[CommentLikeDetails]    Script Date: 16-Mar-22 4:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLikeDetails](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [nvarchar](15) NOT NULL,
	[User2Email] [nvarchar](255) NOT NULL,
	[IsLiked] [bit] NOT NULL,
	[RecordStatus] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC,
	[User2Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCommentDetails]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCommentDetails](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [nvarchar](15) NOT NULL,
	[PostId] [nvarchar](15) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[User2Email] [nvarchar](255) NOT NULL,
	[RecordStatus] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostDetails]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostDetails](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](255) NOT NULL,
	[RecordStatus] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostLikeDetails]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLikeDetails](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [nvarchar](15) NOT NULL,
	[User2Email] [nvarchar](255) NOT NULL,
	[IsLiked] [bit] NOT NULL,
	[RecordStatus] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[User2Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentLikeDetails]  WITH CHECK ADD  CONSTRAINT [FK_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[PostCommentDetails] ([CommentId])
GO
ALTER TABLE [dbo].[CommentLikeDetails] CHECK CONSTRAINT [FK_CommentId]
GO
ALTER TABLE [dbo].[PostCommentDetails]  WITH CHECK ADD  CONSTRAINT [FK_CommentPostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[PostDetails] ([PostId])
GO
ALTER TABLE [dbo].[PostCommentDetails] CHECK CONSTRAINT [FK_CommentPostId]
GO
ALTER TABLE [dbo].[PostLikeDetails]  WITH CHECK ADD  CONSTRAINT [FK_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[PostDetails] ([PostId])
GO
ALTER TABLE [dbo].[PostLikeDetails] CHECK CONSTRAINT [FK_PostId]
GO
/****** Object:  StoredProcedure [dbo].[CreateCommentOnPost]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-March-2022
Description:    This Stored Procedure is used to Comment on a Post

Example: -      Exec [dbo].[CreateCommentOnPost]
				@CommentId			= 'C-1',
				@PostId				= 'P-2',
				@Comment			= 'Good Comment',
				@User2Email			= 'prateekagarwal9@gmail.com',
				@CreatedBy			= 'prateekagarwal9@gmail.com',
				@UpdatedBy			= 'prateekagarwal9@gmail.com'
*/
-- =========================================================================================================

CREATE PROCEDURE [dbo].[CreateCommentOnPost]
	-- Add The Parameter for the Stored Procedure here
	@CommentId NVARCHAR(15),	
	@PostId NVARCHAR(15),
	@Comment NVARCHAR(MAX),
	@User2Email NVARCHAR(255),
	@CreatedBy NVARCHAR(255),
	@UpdatedBy NVARCHAR(255)

AS
BEGIN
	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;
	-- It will check if post is already liked or not
	IF EXISTS (SELECT TOP 1 1 FROM [PostCommentDetails] WHERE PostId = @PostId AND User2Email = @User2Email)
		BEGIN
			-- If comment exists and then it will throw error 
			DECLARE @errorMessage VARCHAR(100) = 'Comment on this Post By ' + @User2Email + ' already exists';
			THROW
				50001, -- error_number
				@errorMessage, -- error_message
				1; -- state
		END
	-- Insert Statements for Stored Procedure here
	ELSE
		BEGIN
			INSERT INTO [dbo].[PostCommentDetails]
			(
				CommentId,
				PostId,
				Comment,
				User2Email,
				RecordStatus,
				CreatedAt,
				CreatedBy,
				UpdatedAt,
				UpdatedBy
			)
			VALUES
			(
				@CommentId,
				@PostId,
				@Comment,
				@User2Email,
				'Active',
				GETDATE(),
				@CreatedBy,
				GETDATE(),
				@UpdatedBy
			)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[FetchCommentId]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Comment ID

Example: -      Exec [dbo].[FetchCommentId]

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchCommentId]


AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT TOP 1 CommentId FROM [PostCommentDetails] ORDER BY RecordId DESC

END
GO
/****** Object:  StoredProcedure [dbo].[FetchCommentOnPost]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Comments On Post 

Example: -      Exec [dbo].[FetchCommentOnPost] @PostId = 'P-2'

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchCommentOnPost]
	@PostId NVARCHAR(15)

AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT 
			CommentId,
			PostId,
			Comment,
			User2Email
	FROM [dbo].[PostCommentDetails]
	WHERE RecordStatus = 'Active' AND PostId = @PostId
	ORDER BY RecordId 

END
GO
/****** Object:  StoredProcedure [dbo].[FetchLikeOnComment]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Comments On Post 

Example: -      Exec [dbo].[FetchLikeOnComment] @CommentId = 'C-1'

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchLikeOnComment]
	@CommentId NVARCHAR(15)

AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT 
			User2Email
	FROM [dbo].[CommentLikeDetails]
	WHERE RecordStatus = 'Active' AND IsLiked = 1 AND CommentId = @CommentId
	ORDER BY RecordId 

END
GO
/****** Object:  StoredProcedure [dbo].[FetchLikeOnPost]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Likes On Post 

Example: -      Exec [dbo].[FetchLikeOnPost] @PostId = 'P-2'

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchLikeOnPost]
	@PostId NVARCHAR(15)

AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT 
			PostId,
			User2Email
	FROM [dbo].[PostLikeDetails]
	WHERE RecordStatus = 'Active' AND IsLiked = 1 AND PostId = @PostId
	ORDER BY RecordId 

END
GO
/****** Object:  StoredProcedure [dbo].[FetchPostId]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Post ID

Example: -      Exec [dbo].[FetchPostId] 

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchPostId]


AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT TOP 1 PostId FROM [PostDetails] ORDER BY RecordId DESC

END
GO
/****** Object:  StoredProcedure [dbo].[FetchPosts]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-Mar-2022
Description:    This Stored Procedure is used to Fetch Posts of User

Example: -      Exec [dbo].[FetchPosts] @UserEmail = 'prateekagarwal947@gmail.com'

*/
-- =========================================================================================================


CREATE PROCEDURE [dbo].[FetchPosts]
	@UserEmail NVARCHAR(255)

AS

BEGIN

	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	SELECT 
			PostId,
			Title,
			Content,
			UserEmail
	FROM [dbo].[PostDetails]
	WHERE RecordStatus = 'Active' AND UserEmail = @UserEmail
	ORDER BY RecordId 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertPost]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-March-2022
Description:    This Stored Procedure is used to Insert New Post

Example: -      Exec [dbo].[InsertPost] 
				@PostId				= 'P-1',
				@Title				= 'New Join',
				@Content			= 'Hello EveryOne, I have joined a new company',
				@UserEmail			= 'prateekagarwal947@gmail.com',
				@CreatedBy			= 'prateekagarwal947@gmail.com',
				@UpdatedBy			= 'prateekagarwal947@gmail.com'
*/
-- =========================================================================================================

CREATE PROCEDURE [dbo].[InsertPost]
	-- Add The Parameter for the Stored Procedure here
	
	@PostId NVARCHAR(15),
	@Title NVARCHAR(255),
	@Content NVARCHAR(MAX),
	@UserEmail NVARCHAR(255),
	@CreatedBy NVARCHAR(255),
	@UpdatedBy NVARCHAR(255)

AS
BEGIN
	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;

	-- Insert Statements for Stored Procedure here
	INSERT INTO [dbo].[PostDetails]
	(
		PostId,
		Title,
		Content,
		UserEmail,
		RecordStatus,
		CreatedAt,
		CreatedBy,
		UpdatedAt,
		UpdatedBy
	)
	VALUES
	(
		@PostId,
		@Title,
	    @Content,
		@UserEmail,
		'Active',
		GETDATE(),
		@CreatedBy,
		GETDATE(),
		@UpdatedBy
	)
END
GO
/****** Object:  StoredProcedure [dbo].[LikeComment]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-March-2022
Description:    This Stored Procedure is used to Like Comment

Example: -      Exec [dbo].[LikeComment] 
				@CommentId			= 'C-1',
				@User2Email			= 'prateekagarwal9@gmail.com',
				@CreatedBy			= 'prateekagarwal9@gmail.com',
				@UpdatedBy			= 'prateekagarwal9@gmail.com'
*/
-- =========================================================================================================

CREATE PROCEDURE [dbo].[LikeComment]
	-- Add The Parameter for the Stored Procedure here
	
	@CommentId NVARCHAR(15),
	@User2Email NVARCHAR(255),
	@CreatedBy NVARCHAR(255),
	@UpdatedBy NVARCHAR(255)

AS
BEGIN
	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;
	-- It will check if post is already liked or not
	IF EXISTS (SELECT TOP 1 1 FROM [CommentLikeDetails] WHERE CommentId = @CommentId AND User2Email = @User2Email)
		BEGIN
		-- If it is already liked then it will convert it to not liked 
			UPDATE [CommentLikeDetails] 
			SET 
				IsLiked		= 1^IsLiked, 
				UpdatedAt	= GETDATE(),
				UpdatedBy	= @UpdatedBy 
			WHERE 
				CommentId	= @CommentId AND 
				User2Email  = @User2Email
		END
	-- Insert Statements for Stored Procedure here
	ELSE
		BEGIN
			INSERT INTO [dbo].[CommentLikeDetails]
			(
				CommentId,
				User2Email,
				IsLiked,
				RecordStatus,
				CreatedAt,
				CreatedBy,
				UpdatedAt,
				UpdatedBy
			)
			VALUES
			(
				@CommentId,
				@User2Email,
				1,
				'Active',
				GETDATE(),
				@CreatedBy,
				GETDATE(),
				@UpdatedBy
			)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[LikePost]    Script Date: 16-Mar-22 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================================================
/*
Author:			Prateek Agarwal
Created Date:   16-March-2022
Description:    This Stored Procedure is used to Like Post

Example: -      Exec [dbo].[LikePost] 
				@PostId				= 'P-2',
				@User2Email			= 'prateekagarwal9@gmail.com',
				@CreatedBy			= 'prateekagarwal9@gmail.com',
				@UpdatedBy			= 'prateekagarwal9@gmail.com'
*/
-- =========================================================================================================

CREATE PROCEDURE [dbo].[LikePost]
	-- Add The Parameter for the Stored Procedure here
	
	@PostId NVARCHAR(15),
	@User2Email NVARCHAR(255),
	@CreatedBy NVARCHAR(255),
	@UpdatedBy NVARCHAR(255)

AS
BEGIN
	-- SET NOCOUNT ON is added to prevent extra result sets
	-- from interfering with SELECT Statements.
	SET NOCOUNT ON;
	-- It will check if post is already liked or not
	IF EXISTS (SELECT TOP 1 1 FROM [PostLikeDetails] WHERE PostId = @PostId AND User2Email = @User2Email)
		BEGIN
		-- If it is already liked then it will convert it to not liked 
			UPDATE [PostLikeDetails] 
			SET 
				IsLiked		= 1^IsLiked, 
				UpdatedAt	= GETDATE(),
				UpdatedBy	= @UpdatedBy 
			WHERE 
				PostId		= @PostId AND 
				User2Email  = @User2Email
		END
	-- Insert Statements for Stored Procedure here
	ELSE
		BEGIN
			INSERT INTO [dbo].[PostLikeDetails]
			(
				PostId,
				User2Email,
				IsLiked,
				RecordStatus,
				CreatedAt,
				CreatedBy,
				UpdatedAt,
				UpdatedBy
			)
			VALUES
			(
				@PostId,
				@User2Email,
				1,
				'Active',
				GETDATE(),
				@CreatedBy,
				GETDATE(),
				@UpdatedBy
			)
		END
END
GO
ALTER DATABASE [FeedPortal] SET  READ_WRITE 
GO
