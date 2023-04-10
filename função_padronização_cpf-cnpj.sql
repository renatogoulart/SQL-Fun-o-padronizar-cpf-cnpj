-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION FC_limpezadecpf
(	

	@documento varchar (19)

)
RETURNS  varchar (18)

begin 
	set @documento = rtrim(ltrim(replace(REPLACE(replace(@documento,'.',''),'-',''),'/','')));
	return case when
		  len(@documento) = 11
	then  stuff(stuff(stuff(@documento,4,0,'.'),8,0,'.'),12,0,'-')
	when  len(@documento) = 14
	then  stuff(stuff(stuff(stuff(@documento,3,0,'.'),7,0,'.'),11,0,'/'),16,0,'-')
	else  NULL
	end   
end

