USE [master]
GO
/****** Object:  Database [db_test_cesde]    Script Date: 4/03/2025 12:58:00 p. m. ******/
CREATE DATABASE [db_test_cesde]
GO

USE [db_test_cesde]
GO
/****** Object:  Table [dbo].[tbl_cursos]    Script Date: 4/03/2025 12:58:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cursos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](500) NULL,
	[duracion] [smallint] NULL,
	[precio] [money] NULL,
	[fecha_inicio] [date] NULL,
 CONSTRAINT [PK_tbl_cursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cursos_docentes]    Script Date: 4/03/2025 12:58:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cursos_docentes](
	[documento_docente] [nvarchar](12) NOT NULL,
	[id_curso] [int] NOT NULL,
 CONSTRAINT [PK_tbl_cursos_docentes] PRIMARY KEY CLUSTERED 
(
	[documento_docente] ASC,
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_docentes]    Script Date: 4/03/2025 12:58:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_docentes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](70) NULL,
	[documento] [nvarchar](12) NOT NULL,
	[correo] [nvarchar](80) NULL,
 CONSTRAINT [PK_tbl_docentes] PRIMARY KEY CLUSTERED 
(
	[documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_cursos_docentes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cursos_docentes_tbl_cursos] FOREIGN KEY([id_curso])
REFERENCES [dbo].[tbl_cursos] ([id])
GO
ALTER TABLE [dbo].[tbl_cursos_docentes] CHECK CONSTRAINT [FK_tbl_cursos_docentes_tbl_cursos]
GO
ALTER TABLE [dbo].[tbl_cursos_docentes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cursos_docentes_tbl_docentes] FOREIGN KEY([documento_docente])
REFERENCES [dbo].[tbl_docentes] ([documento])
GO
ALTER TABLE [dbo].[tbl_cursos_docentes] CHECK CONSTRAINT [FK_tbl_cursos_docentes_tbl_docentes]
GO
