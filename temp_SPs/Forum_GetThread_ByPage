USE [DarkWhisperDB]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Forum_GetThread_ByPage]
     @TopicID						int,
     @PageSize						int,
     @PageIndex                     int
As
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @StartID int
declare @EndID int

set @StartID = @PageSize * (@PageIndex - 1)
set @EndID = @StartID + @PageSize + 1

CREATE TABLE #TempSearch (
     IndexID						int IDENTITY (1, 1),
	 PostID							int

	 )

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


insert Into #TempSearch ( PostID )
select Top 1000 p.PostID
from dbo.tblTopics t (nolock)
left outer join dbo.tblPosts p (nolock)
on t.TopicID = p.TopicID
left outer join dbo.tblMembers m (nolock)
on m.UserID = p.UserID
where t.TopicID = @TopicID
order by PostID desc

---------------------------------------------------------------------------------------------------------------------------------------*/

declare @PageCount               int
declare @Remainder               int

Select @PageCount = ( count(indexID) / @PageSize ), @Remainder = ( count(indexID) % @PageSize )
From #TempSearch (nolock)

-- now get the total record count to return with the results for paging...
declare @TotalCount          int
Select @TotalCount = Count(IndexID)
From #TempSearch (nolock)

if @Remainder > 0
     select @PageCount = @PageCount + 1

delete from #TempSearch
Where IndexID <= @StartID
     or IndexID >= @EndID


Select TS.*, @TotalCount as totalResults, @PageCount as maxPage
From #TempSearch TS (nolock)
Order By TS.IndexID Asc
