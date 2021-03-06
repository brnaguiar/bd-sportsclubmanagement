USE [master]
GO
/****** Object:  Database [p4g8]    Script Date: 11/06/2018 23:52:43 ******/
CREATE DATABASE [p4g8]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p4g8', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\p4g8.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'p4g8_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\p4g8_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [p4g8] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p4g8].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p4g8] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p4g8] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p4g8] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p4g8] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p4g8] SET ARITHABORT OFF 
GO
ALTER DATABASE [p4g8] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [p4g8] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p4g8] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p4g8] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p4g8] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p4g8] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p4g8] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p4g8] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p4g8] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p4g8] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p4g8] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p4g8] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p4g8] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p4g8] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p4g8] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p4g8] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p4g8] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p4g8] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p4g8] SET  MULTI_USER 
GO
ALTER DATABASE [p4g8] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p4g8] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p4g8] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p4g8] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [p4g8]
GO
/****** Object:  User [test]    Script Date: 11/06/2018 23:52:43 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [p4g8]    Script Date: 11/06/2018 23:52:43 ******/
CREATE USER [p4g8] FOR LOGIN [p4g8] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p4g8]
GO
/****** Object:  Schema [COMPANY]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [COMPANY]
GO
/****** Object:  Schema [ENCOMENDAS]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [ENCOMENDAS]
GO
/****** Object:  Schema [MY_TEAM]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [MY_TEAM]
GO
/****** Object:  Schema [Prescricao_Eletronica]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [Prescricao_Eletronica]
GO
/****** Object:  Schema [RENT_CAR]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [RENT_CAR]
GO
/****** Object:  Schema [Reservas_De_Voos]    Script Date: 11/06/2018 23:52:44 ******/
CREATE SCHEMA [Reservas_De_Voos]
GO
/****** Object:  Table [COMPANY].[DEPARTMENT]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[DEPARTMENT](
	[Dname] [varchar](15) NOT NULL,
	[Dnumber] [int] NOT NULL,
	[Mgr_ssn] [char](9) NULL,
	[Mgr_start_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [COMPANY].[DEPENDENT]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[DEPENDENT](
	[Essn] [char](9) NOT NULL,
	[Dependent_name] [varchar](15) NOT NULL,
	[Sex] [char](1) NULL,
	[Bdate] [date] NULL,
	[Relationship] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Dependent_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [COMPANY].[DEPT_LOCATION]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[DEPT_LOCATION](
	[Dnumber] [int] NOT NULL,
	[Dlocation] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC,
	[Dlocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [COMPANY].[EMPLOYEE]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[EMPLOYEE](
	[Fname] [varchar](15) NOT NULL,
	[Minit] [char](1) NULL,
	[Lname] [varchar](15) NOT NULL,
	[Ssn] [char](9) NOT NULL,
	[Bdate] [date] NULL,
	[Address] [varchar](30) NULL,
	[Sex] [char](1) NULL,
	[Salary] [decimal](10, 2) NULL,
	[Super_ssn] [char](9) NULL,
	[Dno] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [COMPANY].[PROJECT]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[PROJECT](
	[Pname] [varchar](15) NOT NULL,
	[Pnumber] [int] NOT NULL,
	[Plocation] [varchar](15) NULL,
	[Dnum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [COMPANY].[WORKS_ON]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMPANY].[WORKS_ON](
	[Essn] [char](9) NOT NULL,
	[Pno] [int] NOT NULL,
	[Hours] [decimal](3, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Pno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hello]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hello](
	[MsgID] [int] NOT NULL,
	[MsgSubject] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ENCOMENDAS].[Contem]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ENCOMENDAS].[Contem](
	[pcodigo] [varchar](8) NOT NULL,
	[eencomenda] [int] NULL,
	[nitens] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ENCOMENDAS].[Encomenda]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ENCOMENDAS].[Encomenda](
	[data] [date] NULL,
	[numero] [int] NOT NULL,
	[fnif] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ENCOMENDAS].[Fornecedor]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ENCOMENDAS].[Fornecedor](
	[nome] [varchar](15) NULL,
	[nfax] [char](9) NULL,
	[nif] [char](9) NOT NULL,
	[endereco] [varchar](15) NULL,
	[pagamento] [varchar](10) NULL,
	[fcodigo] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ENCOMENDAS].[Produto]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ENCOMENDAS].[Produto](
	[codigo] [varchar](8) NOT NULL,
	[preco] [int] NULL,
	[taxa_iva] [varchar](4) NULL,
	[nome] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ENCOMENDAS].[TipoFornecedor]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ENCOMENDAS].[TipoFornecedor](
	[id] [varchar](9) NULL,
	[designacao] [varchar](15) NULL,
	[codigo] [char](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Club_Member]    Script Date: 11/06/2018 23:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Club_Member](
	[internal_id] [int] NOT NULL,
	[internal_role] [varchar](20) NOT NULL,
	[salary] [varchar](20) NULL,
	[citizen_card] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[internal_id] ASC,
	[citizen_card] ASC,
	[internal_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Club_Supporter]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Club_Supporter](
	[supporter_id] [int] NOT NULL,
	[reserved_seat] [int] NULL,
	[citizen_card] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supporter_id] ASC,
	[citizen_card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Infrastructure]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Infrastructure](
	[iname] [varchar](20) NULL,
	[inau_date] [int] NULL,
	[c_cost] [int] NULL,
	[m_cost] [int] NULL,
	[infra_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[infra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Matchday]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Matchday](
	[mvp_id] [int] NULL,
	[matchday_no] [int] NULL,
	[matchday_id] [int] NOT NULL,
	[matchday_date] [int] NULL,
	[scored] [int] NULL,
	[conceded] [int] NULL,
	[season_id] [int] NULL,
	[oteam_id] [int] NULL,
	[infra_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[matchday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Oponents]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Oponents](
	[market_v] [int] NULL,
	[oteam_id] [int] NOT NULL,
	[oteam_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[oteam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Person]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Person](
	[fnome] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[nationality] [varchar](20) NOT NULL,
	[age] [tinyint] NOT NULL,
	[citizen_card] [int] NOT NULL,
	[gender] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[citizen_card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Played_By]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Played_By](
	[player_id] [int] NOT NULL,
	[matchday_id] [int] NOT NULL,
	[oteam_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[player_id] ASC,
	[matchday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Player]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Player](
	[height] [int] NULL,
	[position] [varchar](20) NULL,
	[sport] [varchar](20) NULL,
	[shirt_number] [varchar](20) NULL,
	[agent] [varchar](20) NULL,
	[market_value] [int] NULL,
	[team_status] [varchar](20) NULL,
	[internal_id] [int] NOT NULL,
	[internal_role] [varchar](20) NOT NULL,
	[citizen_card] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[internal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Sport_Facility]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Sport_Facility](
	[capacity] [int] NULL,
	[sf_type] [varchar](20) NULL,
	[surface] [varchar](20) NULL,
	[infra_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[infra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Staff]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Staff](
	[internal_id] [int] NOT NULL,
	[internal_role] [varchar](20) NOT NULL,
	[staff_role] [varchar](20) NOT NULL,
	[citizen_card] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[internal_id] ASC,
	[citizen_card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MY_TEAM].[Team_Season]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MY_TEAM].[Team_Season](
	[sport_type] [varchar](20) NULL,
	[season_year] [int] NULL,
	[n_of_matches] [int] NULL,
	[total_scored] [int] NULL,
	[total_conceded] [int] NULL,
	[season_mvp] [int] NULL,
	[season_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[season_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[CompanhiaFarmaceutica]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[CompanhiaFarmaceutica](
	[endereco] [varchar](20) NULL,
	[nome] [varchar](20) NULL,
	[n_registo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[n_registo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[farmacia]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[farmacia](
	[nome] [varchar](20) NULL,
	[endereco] [varchar](20) NOT NULL,
	[telefone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[Farmaco]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[Farmaco](
	[nome_comercial] [varchar](20) NOT NULL,
	[formula] [varchar](20) NOT NULL,
	[n_registo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[n_registo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[Medico]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[Medico](
	[sns_id] [int] NOT NULL,
	[nome] [varchar](20) NULL,
	[especialidade] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sns_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[Prescricao]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[Prescricao](
	[sns_id] [int] NOT NULL,
	[n_utente] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[n_registo] [int] NULL,
	[endereco] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[sns_id] ASC,
	[n_utente] ASC,
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[Processada]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[Processada](
	[data_process] [date] NULL,
	[numero] [int] NOT NULL,
	[n_registo] [int] NOT NULL,
	[endereco] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC,
	[n_registo] ASC,
	[endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Prescricao_Eletronica].[Utente]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prescricao_Eletronica].[Utente](
	[nome] [varchar](20) NULL,
	[n_utente] [int] NOT NULL,
	[data_nascimento] [date] NULL,
	[endereco] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[n_utente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Aluguer]    Script Date: 11/06/2018 23:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Aluguer](
	[numero] [tinyint] NOT NULL,
	[duracao] [tinyint] NOT NULL,
	[data] [date] NOT NULL,
	[c_nif] [char](9) NULL,
	[b_number] [tinyint] NULL,
	[v_matricula] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Balcao]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Balcao](
	[numero] [tinyint] NOT NULL,
	[nome] [varchar](10) NULL,
	[endereco] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Cliente]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Cliente](
	[nome] [varchar](15) NULL,
	[endereco] [varchar](15) NULL,
	[num_carta] [char](10) NULL,
	[nif] [char](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Ligeiro]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Ligeiro](
	[codigo] [tinyint] NOT NULL,
	[numlugares] [tinyint] NULL,
	[combustivel] [varchar](10) NULL,
	[portas] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Pesado]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Pesado](
	[peso] [int] NULL,
	[passageiros] [int] NULL,
	[codigo] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Simiralidade]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Simiralidade](
	[codigo_com] [tinyint] NULL,
	[codigo_comp] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[TipoVeiculo]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[TipoVeiculo](
	[codigo] [tinyint] NOT NULL,
	[arcondicionado] [bit] NULL,
	[designacao] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RENT_CAR].[Veiculo]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RENT_CAR].[Veiculo](
	[matricula] [char](8) NOT NULL,
	[marca] [varchar](10) NULL,
	[ano] [char](4) NULL,
	[codigo_tipo] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[Airplane]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[Airplane](
	[total_number_of_seats] [int] NOT NULL,
	[type_name] [varchar](20) NULL,
	[airplane_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[airplane_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[AirplaneType]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[AirplaneType](
	[max_seats] [int] NOT NULL,
	[company] [varchar](20) NULL,
	[type_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[Airport]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[Airport](
	[airport_name] [varchar](20) NOT NULL,
	[airport_city] [varchar](20) NOT NULL,
	[airport_state] [varchar](20) NOT NULL,
	[airport_code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[airport_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[CandLand]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[CandLand](
	[airport_code] [int] NOT NULL,
	[type_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[airport_code] ASC,
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[Fare]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[Fare](
	[code] [int] NOT NULL,
	[number_flight] [int] NOT NULL,
	[amount_code] [money] NOT NULL,
	[restrictions] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC,
	[number_flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[Flight]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[Flight](
	[Airline] [varchar](20) NULL,
	[Weekdays] [varchar](70) NULL,
	[number_flight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[number_flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[FlightLeg]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[FlightLeg](
	[dep_time] [time](7) NOT NULL,
	[arr_airport] [int] NOT NULL,
	[arr_time] [time](7) NOT NULL,
	[number_flight] [int] NOT NULL,
	[leg_no] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[leg_no] ASC,
	[number_flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[LegInstance]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[LegInstance](
	[date_instance] [date] NOT NULL,
	[leg_no] [int] NOT NULL,
	[number_flight] [int] NOT NULL,
	[available_seats] [int] NULL,
	[airplane_id] [int] NOT NULL,
	[airport_code] [int] NOT NULL,
	[dep_time] [time](7) NOT NULL,
	[arr_airport] [int] NOT NULL,
	[arr_time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[date_instance] ASC,
	[leg_no] ASC,
	[number_flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reservas_De_Voos].[Seat]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservas_De_Voos].[Seat](
	[costumer_name] [varchar](40) NOT NULL,
	[cphone] [varchar](9) NOT NULL,
	[seat_no] [int] NOT NULL,
	[date_instance] [date] NOT NULL,
	[leg_no] [int] NOT NULL,
	[number_flight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seat_no] ASC,
	[date_instance] ASC,
	[leg_no] ASC,
	[number_flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BUS_TYPE]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[BUS_TYPE] as
	select titles.[type], titles.title
	from pubs.dbo.titles where titles.[type]='Business';
GO
/****** Object:  View [dbo].[ex1_a_ii]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ex1_a_ii] as
select publishers.pub_name, employee.fname, employee.lname 
from pubs.dbo.publishers join pubs.dbo.employee on publishers.pub_id = employee.pub_id;
GO
/****** Object:  View [dbo].[ex1_a_iii]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ex1_a_iii] as 
select stor_name, titles.title 
from pubs.dbo.stores join pubs.dbo.sales on stores.stor_id = sales.stor_id
join pubs.dbo.titles on sales.title_id = titles.title_id;
GO
/****** Object:  View [dbo].[ex1_a_iv]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ex1_a_iv] as 
select titles.title, titles.[type] from pubs.dbo.titles
where titles.[type] = 'business';

GO
/****** Object:  View [dbo].[PUBS_EMPLOYESS]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view	[dbo].[PUBS_EMPLOYESS] as 
	select publishers.pub_name, employee.fname, employee.minit, employee.lname
	from pubs.dbo.employee join pubs.dbo.publishers on employee.pub_id=publishers.pub_id;
GO
/****** Object:  View [dbo].[STORES_TITLES]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[STORES_TITLES] as
	select stores.stor_name, titles.title
	from pubs.dbo.stores join pubs.dbo.sales on stores.stor_id= sales.stor_id join pubs.dbo.titles on sales.title_id=titles.title_id;
GO
/****** Object:  View [dbo].[TITLE_AUTHOR]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TITLE_AUTHOR] as
	select authors.au_fname, authors.au_lname, titles.title
	from pubs.dbo.titles join pubs.dbo.titleauthor on titles.title_id=titleauthor.title_id join pubs.dbo.authors on titleauthor.au_id=authors.au_id;
GO
/****** Object:  View [dbo].[Title_Author3]    Script Date: 11/06/2018 23:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Title_Author3] as 
select authors.au_fname, authors.au_lname, titles.title from pubs.dbo.titles 
join pubs.dbo.titleauthor on titles.title_id = titleauthor.title_id
join pubs.dbo.authors on titleauthor.au_id = authors.au_id;
GO
INSERT [COMPANY].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Investigacao', 1, N'21312332 ', CAST(N'2010-08-02' AS Date))
INSERT [COMPANY].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Comercial', 2, N'321233765', CAST(N'2013-05-16' AS Date))
INSERT [COMPANY].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Logistica', 3, N'41124234 ', CAST(N'2013-05-16' AS Date))
INSERT [COMPANY].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'RecursosHumanos', 4, N'12652121 ', CAST(N'2014-04-02' AS Date))
INSERT [COMPANY].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Desporto', 5, NULL, NULL)
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'21312332 ', N'Joana Costa', N'F', CAST(N'2008-04-01' AS Date), N'Filho')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'21312332 ', N'Maria Costa', N'F', CAST(N'1990-10-05' AS Date), N'Neto')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'21312332 ', N'Rui Costa', N'M', CAST(N'2000-08-04' AS Date), N'Neto')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'321233765', N'Filho Lindo', N'M', CAST(N'2001-02-22' AS Date), N'Filho')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'342343434', N'Rosa Lima', N'F', CAST(N'2006-03-11' AS Date), N'Filho')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'41124234 ', N'Ana Sousa', N'F', CAST(N'2007-04-13' AS Date), N'Neto')
INSERT [COMPANY].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'41124234 ', N'Gaspar Pinto', N'M', CAST(N'2006-02-08' AS Date), N'Sobrinho')
INSERT [COMPANY].[DEPT_LOCATION] ([Dnumber], [Dlocation]) VALUES (2, N'AVEIRO')
INSERT [COMPANY].[DEPT_LOCATION] ([Dnumber], [Dlocation]) VALUES (3, N'COIMBRA')
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Ana', N'L', N'Silva', N'12652121 ', CAST(N'1990-03-03' AS Date), N'Rua ZIG ZAG', N'F', CAST(1400.00 AS Decimal(10, 2)), N'21312332 ', 2)
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Paula', N'A', N'Sousa', N'183623612', CAST(N'2001-08-11' AS Date), N'Rua da FRENTE', N'F', CAST(1450.00 AS Decimal(10, 2)), NULL, 3)
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Carlos', N'D', N'Gomes', N'21312332 ', CAST(N'2000-01-01' AS Date), N'Rua XPTO', N'M', CAST(1200.00 AS Decimal(10, 2)), NULL, 1)
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Juliana', N'A', N'Amaral', N'321233765', CAST(N'1980-08-11' AS Date), N'Rua BZZZZ', N'F', CAST(1350.00 AS Decimal(10, 2)), NULL, 3)
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Maria', N'I', N'Pereira', N'342343434', CAST(N'2001-05-01' AS Date), N'Rua JANOTA', N'F', CAST(1250.00 AS Decimal(10, 2)), N'21312332 ', 2)
INSERT [COMPANY].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Joao', N'G', N'Costa', N'41124234 ', CAST(N'2001-01-01' AS Date), N'Rua YGZ', N'M', CAST(1300.00 AS Decimal(10, 2)), N'21312332 ', 2)
INSERT [COMPANY].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'Aveiro Digital', 1, N'Aveiro', 3)
INSERT [COMPANY].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'BD Open Day', 2, N'Espinho', 2)
INSERT [COMPANY].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'Dicoogle', 3, N'Aveiro', 4)
INSERT [COMPANY].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'GOPACS', 4, N'Aveiro', 3)
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'183623612', 1, CAST(20.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'183623612', 3, CAST(10.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'21312332 ', 1, CAST(20.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'321233765', 1, CAST(25.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'342343434', 1, CAST(20.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'342343434', 4, CAST(25.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'41124234 ', 2, CAST(20.0 AS Decimal(3, 1)))
INSERT [COMPANY].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'41124234 ', 3, CAST(30.0 AS Decimal(3, 1)))
INSERT [dbo].[Hello] ([MsgID], [MsgSubject]) VALUES (1245, N'Ola tudo bem')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DEPARTME__83BFD849CF45ABE0]    Script Date: 11/06/2018 23:52:48 ******/
ALTER TABLE [COMPANY].[DEPARTMENT] ADD UNIQUE NONCLUSTERED 
(
	[Dname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PROJECT__173BB01C124CEFB8]    Script Date: 11/06/2018 23:52:48 ******/
ALTER TABLE [COMPANY].[PROJECT] ADD UNIQUE NONCLUSTERED 
(
	[Pname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [COMPANY].[DEPARTMENT]  WITH CHECK ADD FOREIGN KEY([Mgr_ssn])
REFERENCES [COMPANY].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [COMPANY].[DEPENDENT]  WITH CHECK ADD FOREIGN KEY([Essn])
REFERENCES [COMPANY].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [COMPANY].[DEPT_LOCATION]  WITH CHECK ADD FOREIGN KEY([Dnumber])
REFERENCES [COMPANY].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [COMPANY].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [EMPDEPTFK] FOREIGN KEY([Dno])
REFERENCES [COMPANY].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [COMPANY].[EMPLOYEE] CHECK CONSTRAINT [EMPDEPTFK]
GO
ALTER TABLE [COMPANY].[EMPLOYEE]  WITH CHECK ADD FOREIGN KEY([Super_ssn])
REFERENCES [COMPANY].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [COMPANY].[PROJECT]  WITH CHECK ADD FOREIGN KEY([Dnum])
REFERENCES [COMPANY].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [COMPANY].[WORKS_ON]  WITH CHECK ADD FOREIGN KEY([Essn])
REFERENCES [COMPANY].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [COMPANY].[WORKS_ON]  WITH CHECK ADD FOREIGN KEY([Pno])
REFERENCES [COMPANY].[PROJECT] ([Pnumber])
GO
ALTER TABLE [ENCOMENDAS].[Contem]  WITH CHECK ADD FOREIGN KEY([eencomenda])
REFERENCES [ENCOMENDAS].[Encomenda] ([numero])
GO
ALTER TABLE [ENCOMENDAS].[Encomenda]  WITH CHECK ADD FOREIGN KEY([fnif])
REFERENCES [ENCOMENDAS].[Fornecedor] ([nif])
GO
ALTER TABLE [ENCOMENDAS].[Fornecedor]  WITH CHECK ADD FOREIGN KEY([fcodigo])
REFERENCES [ENCOMENDAS].[TipoFornecedor] ([codigo])
GO
ALTER TABLE [MY_TEAM].[Club_Member]  WITH CHECK ADD FOREIGN KEY([citizen_card])
REFERENCES [MY_TEAM].[Person] ([citizen_card])
GO
ALTER TABLE [MY_TEAM].[Club_Supporter]  WITH CHECK ADD FOREIGN KEY([citizen_card])
REFERENCES [MY_TEAM].[Person] ([citizen_card])
GO
ALTER TABLE [MY_TEAM].[Matchday]  WITH CHECK ADD FOREIGN KEY([infra_id])
REFERENCES [MY_TEAM].[Sport_Facility] ([infra_id])
GO
ALTER TABLE [MY_TEAM].[Matchday]  WITH CHECK ADD FOREIGN KEY([oteam_id])
REFERENCES [MY_TEAM].[Oponents] ([oteam_id])
GO
ALTER TABLE [MY_TEAM].[Matchday]  WITH CHECK ADD FOREIGN KEY([season_id])
REFERENCES [MY_TEAM].[Team_Season] ([season_id])
GO
ALTER TABLE [MY_TEAM].[Played_By]  WITH CHECK ADD FOREIGN KEY([matchday_id])
REFERENCES [MY_TEAM].[Matchday] ([matchday_id])
GO
ALTER TABLE [MY_TEAM].[Played_By]  WITH CHECK ADD FOREIGN KEY([player_id])
REFERENCES [MY_TEAM].[Player] ([internal_id])
GO
ALTER TABLE [MY_TEAM].[Player]  WITH CHECK ADD FOREIGN KEY([internal_id], [citizen_card], [internal_role])
REFERENCES [MY_TEAM].[Club_Member] ([internal_id], [citizen_card], [internal_role])
GO
ALTER TABLE [MY_TEAM].[Sport_Facility]  WITH CHECK ADD FOREIGN KEY([infra_id])
REFERENCES [MY_TEAM].[Infrastructure] ([infra_id])
GO
ALTER TABLE [MY_TEAM].[Staff]  WITH CHECK ADD FOREIGN KEY([internal_id], [citizen_card], [internal_role])
REFERENCES [MY_TEAM].[Club_Member] ([internal_id], [citizen_card], [internal_role])
GO
ALTER TABLE [Prescricao_Eletronica].[Farmaco]  WITH CHECK ADD FOREIGN KEY([n_registo])
REFERENCES [Prescricao_Eletronica].[CompanhiaFarmaceutica] ([n_registo])
GO
ALTER TABLE [Prescricao_Eletronica].[Prescricao]  WITH CHECK ADD FOREIGN KEY([n_utente])
REFERENCES [Prescricao_Eletronica].[Utente] ([n_utente])
GO
ALTER TABLE [Prescricao_Eletronica].[Prescricao]  WITH CHECK ADD FOREIGN KEY([numero], [n_registo], [endereco])
REFERENCES [Prescricao_Eletronica].[Processada] ([numero], [n_registo], [endereco])
GO
ALTER TABLE [Prescricao_Eletronica].[Processada]  WITH CHECK ADD FOREIGN KEY([endereco])
REFERENCES [Prescricao_Eletronica].[farmacia] ([endereco])
GO
ALTER TABLE [RENT_CAR].[Aluguer]  WITH CHECK ADD FOREIGN KEY([b_number])
REFERENCES [RENT_CAR].[Balcao] ([numero])
GO
ALTER TABLE [RENT_CAR].[Aluguer]  WITH CHECK ADD FOREIGN KEY([c_nif])
REFERENCES [RENT_CAR].[Cliente] ([nif])
GO
ALTER TABLE [RENT_CAR].[Aluguer]  WITH CHECK ADD FOREIGN KEY([v_matricula])
REFERENCES [RENT_CAR].[Veiculo] ([matricula])
GO
ALTER TABLE [RENT_CAR].[Ligeiro]  WITH CHECK ADD FOREIGN KEY([codigo])
REFERENCES [RENT_CAR].[TipoVeiculo] ([codigo])
GO
ALTER TABLE [RENT_CAR].[Pesado]  WITH CHECK ADD FOREIGN KEY([codigo])
REFERENCES [RENT_CAR].[TipoVeiculo] ([codigo])
GO
ALTER TABLE [RENT_CAR].[Simiralidade]  WITH CHECK ADD FOREIGN KEY([codigo_com])
REFERENCES [RENT_CAR].[TipoVeiculo] ([codigo])
GO
ALTER TABLE [RENT_CAR].[Simiralidade]  WITH CHECK ADD FOREIGN KEY([codigo_comp])
REFERENCES [RENT_CAR].[TipoVeiculo] ([codigo])
GO
ALTER TABLE [RENT_CAR].[Veiculo]  WITH CHECK ADD FOREIGN KEY([codigo_tipo])
REFERENCES [RENT_CAR].[TipoVeiculo] ([codigo])
GO
ALTER TABLE [Reservas_De_Voos].[Airplane]  WITH CHECK ADD FOREIGN KEY([type_name])
REFERENCES [Reservas_De_Voos].[AirplaneType] ([type_name])
GO
ALTER TABLE [Reservas_De_Voos].[CandLand]  WITH CHECK ADD FOREIGN KEY([airport_code])
REFERENCES [Reservas_De_Voos].[Airport] ([airport_code])
GO
ALTER TABLE [Reservas_De_Voos].[CandLand]  WITH CHECK ADD FOREIGN KEY([type_name])
REFERENCES [Reservas_De_Voos].[AirplaneType] ([type_name])
GO
ALTER TABLE [Reservas_De_Voos].[Fare]  WITH CHECK ADD FOREIGN KEY([number_flight])
REFERENCES [Reservas_De_Voos].[Flight] ([number_flight])
GO
ALTER TABLE [Reservas_De_Voos].[FlightLeg]  WITH CHECK ADD FOREIGN KEY([arr_airport])
REFERENCES [Reservas_De_Voos].[Airport] ([airport_code])
GO
ALTER TABLE [Reservas_De_Voos].[FlightLeg]  WITH CHECK ADD FOREIGN KEY([number_flight])
REFERENCES [Reservas_De_Voos].[Flight] ([number_flight])
GO
ALTER TABLE [Reservas_De_Voos].[LegInstance]  WITH CHECK ADD FOREIGN KEY([airplane_id])
REFERENCES [Reservas_De_Voos].[Airplane] ([airplane_id])
GO
ALTER TABLE [Reservas_De_Voos].[LegInstance]  WITH CHECK ADD FOREIGN KEY([airport_code])
REFERENCES [Reservas_De_Voos].[Airport] ([airport_code])
GO
ALTER TABLE [Reservas_De_Voos].[LegInstance]  WITH CHECK ADD FOREIGN KEY([arr_airport])
REFERENCES [Reservas_De_Voos].[Airport] ([airport_code])
GO
ALTER TABLE [Reservas_De_Voos].[LegInstance]  WITH CHECK ADD FOREIGN KEY([leg_no], [number_flight])
REFERENCES [Reservas_De_Voos].[FlightLeg] ([leg_no], [number_flight])
GO
ALTER TABLE [Reservas_De_Voos].[Seat]  WITH CHECK ADD FOREIGN KEY([date_instance], [leg_no], [number_flight])
REFERENCES [Reservas_De_Voos].[LegInstance] ([date_instance], [leg_no], [number_flight])
GO
ALTER TABLE [Reservas_De_Voos].[Airplane]  WITH CHECK ADD CHECK  (([total_number_of_seats]>(0)))
GO
ALTER TABLE [Reservas_De_Voos].[AirplaneType]  WITH CHECK ADD CHECK  (([max_seats]>(0)))
GO
ALTER TABLE [Reservas_De_Voos].[FlightLeg]  WITH CHECK ADD CHECK  (([number_flight]>(0)))
GO
/****** Object:  StoredProcedure [MY_TEAM].[ListMatchesPlayed_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListMatchesPlayed_Query]

		@arg varchar(20)

AS

BEGIN

	IF (@arg = 'date')
		SELECT MY_TEAM.Matchday.matchday_no, MY_TEAM.Matchday.matchday_date, MY_TEAM.Matchday.scored, MY_TEAM.Matchday.conceded, 
		MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Oponents.oteam_name
		FROM MY_TEAM.Player, MY_TEAM.Matchday, MY_TEAM.Oponents, MY_TEAM.Person, MY_TEAM.Played_By
		WHERE MY_TEAM.Played_By.player_id = MY_TEAM.Player.internal_id AND MY_TEAM.Player.citizen_card = MY_TEAM.Person.citizen_card 
		AND MY_TEAM.Played_By.oteam_id = MY_TEAM.Oponents.oteam_id AND MY_TEAM.Played_By.matchday_id = MY_TEAM.Matchday.matchday_id
		ORDER BY len(MY_TEAM.Matchday.matchday_date) DESC, MY_TEAM.Matchday.matchday_date DESC,
		len(MY_TEAM.Matchday.scored) DESC, MY_TEAM.Matchday.scored DESC,
		len(MY_TEAM.Matchday.conceded) ASC, MY_TEAM.Matchday.conceded ASC;

	IF (@arg = 'nmatch')
		SELECT MY_TEAM.Matchday.matchday_no, MY_TEAM.Matchday.matchday_date, MY_TEAM.Matchday.scored, MY_TEAM.Matchday.conceded, 
		MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Oponents.oteam_name
		FROM MY_TEAM.Player, MY_TEAM.Matchday, MY_TEAM.Oponents, MY_TEAM.Person, MY_TEAM.Played_By
		WHERE MY_TEAM.Played_By.player_id = MY_TEAM.Player.internal_id AND MY_TEAM.Player.citizen_card = MY_TEAM.Person.citizen_card 
		AND MY_TEAM.Played_By.oteam_id = MY_TEAM.Oponents.oteam_id AND MY_TEAM.Played_By.matchday_id = MY_TEAM.Matchday.matchday_id
		ORDER BY len(MY_TEAM.Matchday.matchday_no) ASC, MY_TEAM.Matchday.matchday_no ASC,
		len(MY_TEAM.Matchday.scored) DESC, MY_TEAM.Matchday.scored DESC,
		len(MY_TEAM.Matchday.conceded) ASC, MY_TEAM.Matchday.conceded ASC;

END 

GO
/****** Object:  StoredProcedure [MY_TEAM].[ListOponents_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListOponents_Query]

		@arg varchar(20)

AS

BEGIN

	IF (@arg = 'name')
		
		SELECT MY_TEAM.Oponents.oteam_name,  MY_TEAM.Oponents.market_v, MY_TEAM.Oponents.oteam_id
		FROM MY_TEAM.Oponents
		ORDER BY MY_TEAM.Oponents.oteam_name ASC;

	IF (@arg = 'market')
		
		SELECT MY_TEAM.Oponents.oteam_name,  MY_TEAM.Oponents.market_v, MY_TEAM.Oponents.oteam_id
		FROM MY_TEAM.Oponents
		ORDER BY len(MY_TEAM.Oponents.market_v) DESC, MY_TEAM.Oponents.market_v DESC;

END

GO
/****** Object:  StoredProcedure [MY_TEAM].[ListPlayersByX_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListPlayersByX_Query]

		@arg varchar(20)

AS

BEGIN

IF (@arg = 'salary')

SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.nationality, MY_TEAM.Player.sport, MY_TEAM.Player.position, MY_TEAM.Player.shirt_number,
MY_TEAM.Player.team_status, MY_TEAM.Club_Member.salary, MY_TEAM.Player.internal_id
FROM MY_TEAM.Player, MY_TEAM.Club_Member, MY_TEAM.Person 
WHERE MY_TEAM.Player.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
ORDER BY len(MY_TEAM.Club_Member.salary) DESC, MY_TEAM.Club_Member.salary DESC;

IF (@arg = 'name')

SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.nationality, MY_TEAM.Player.sport, MY_TEAM.Player.position, MY_TEAM.Player.shirt_number,
MY_TEAM.Player.team_status, MY_TEAM.Club_Member.salary, MY_TEAM.Player.internal_id
FROM MY_TEAM.Player, MY_TEAM.Club_Member, MY_TEAM.Person 
WHERE MY_TEAM.Player.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
ORDER BY MY_TEAM.Person.fnome ASC, MY_TEAM.PERSON.lname ASC;


IF (@arg = 'age')

SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.nationality, MY_TEAM.Player.sport, MY_TEAM.Player.position, MY_TEAM.Player.shirt_number,
MY_TEAM.Player.team_status, MY_TEAM.Club_Member.salary, MY_TEAM.Player.internal_id
FROM MY_TEAM.Player, MY_TEAM.Club_Member, MY_TEAM.Person 
WHERE MY_TEAM.Player.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
ORDER BY len(MY_TEAM.Person.age) ASC, MY_TEAM.PERSON.age ASC;


IF (@arg = 'nationallity')

SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.nationality, MY_TEAM.Player.sport, MY_TEAM.Player.position, MY_TEAM.Player.shirt_number,
MY_TEAM.Player.team_status, MY_TEAM.Club_Member.salary, MY_TEAM.Player.internal_id
FROM MY_TEAM.Player, MY_TEAM.Club_Member, MY_TEAM.Person 
WHERE MY_TEAM.Player.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
ORDER BY MY_TEAM.PERSON.nationality ASC;

IF (@arg = 'sport')

SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.nationality, MY_TEAM.Player.sport, MY_TEAM.Player.position, MY_TEAM.Player.shirt_number,
MY_TEAM.Player.team_status, MY_TEAM.Club_Member.salary, MY_TEAM.Player.internal_id
FROM MY_TEAM.Player, MY_TEAM.Club_Member, MY_TEAM.Person 
WHERE MY_TEAM.Player.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
ORDER BY MY_TEAM.Player.sport ASC;



END 

GO
/****** Object:  StoredProcedure [MY_TEAM].[ListSportFacilities_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListSportFacilities_Query]

		@arg varchar(20)

AS

BEGIN

	IF (@arg = 'name')
		
		SELECT MY_TEAM.Infrastructure.iname, MY_TEAM.Sport_Facility.capacity, 
		MY_TEAM.Sport_Facility.sf_type, MY_TEAM.Sport_Facility.surface, MY_TEAM.Infrastructure.m_cost, MY_TEAM.Infrastructure.c_cost, 
		MY_TEAM.Infrastructure.infra_id
		FROM MY_TEAM.Infrastructure, MY_TEAM.Sport_Facility
		WHERE MY_TEAM.Sport_Facility.infra_id = MY_TEAM.Sport_Facility.infra_id
		ORDER BY MY_TEAM.Infrastructure.iname ASC;

	IF (@arg = 'type')
		
		SELECT MY_TEAM.Infrastructure.iname, MY_TEAM.Sport_Facility.capacity, 
		MY_TEAM.Sport_Facility.sf_type, MY_TEAM.Sport_Facility.surface, MY_TEAM.Infrastructure.m_cost, MY_TEAM.Infrastructure.c_cost, 
		MY_TEAM.Infrastructure.infra_id
		FROM MY_TEAM.Infrastructure, MY_TEAM.Sport_Facility
		WHERE MY_TEAM.Sport_Facility.infra_id = MY_TEAM.Sport_Facility.infra_id
		ORDER BY MY_TEAM.Sport_Facility.sf_type ASC;

		IF (@arg = 'mcost')
		
		SELECT MY_TEAM.Infrastructure.iname, MY_TEAM.Sport_Facility.capacity, 
		MY_TEAM.Sport_Facility.sf_type, MY_TEAM.Sport_Facility.surface, MY_TEAM.Infrastructure.m_cost, MY_TEAM.Infrastructure.c_cost, 
		MY_TEAM.Infrastructure.infra_id
		FROM MY_TEAM.Infrastructure, MY_TEAM.Sport_Facility
		WHERE MY_TEAM.Sport_Facility.infra_id = MY_TEAM.Sport_Facility.infra_id
		ORDER BY MY_TEAM.Infrastructure.m_cost ASC;

		IF (@arg = 'ccost')
		
			SELECT MY_TEAM.Infrastructure.iname, MY_TEAM.Sport_Facility.capacity, 
			MY_TEAM.Sport_Facility.sf_type, MY_TEAM.Sport_Facility.surface, MY_TEAM.Infrastructure.m_cost, MY_TEAM.Infrastructure.c_cost, 
			MY_TEAM.Infrastructure.infra_id
			FROM MY_TEAM.Infrastructure, MY_TEAM.Sport_Facility
			WHERE MY_TEAM.Sport_Facility.infra_id = MY_TEAM.Sport_Facility.infra_id
			ORDER BY MY_TEAM.Infrastructure.c_cost ASC;

		IF (@arg = 'capacity')
		
			SELECT MY_TEAM.Infrastructure.iname, MY_TEAM.Sport_Facility.capacity, 
			MY_TEAM.Sport_Facility.sf_type, MY_TEAM.Sport_Facility.surface, MY_TEAM.Infrastructure.m_cost, MY_TEAM.Infrastructure.c_cost, 
			MY_TEAM.Infrastructure.infra_id
			FROM MY_TEAM.Infrastructure, MY_TEAM.Sport_Facility
			WHERE MY_TEAM.Sport_Facility.infra_id = MY_TEAM.Sport_Facility.infra_id
			ORDER BY len(MY_TEAM.Sport_Facility.capacity) DESC, MY_TEAM.Sport_Facility.capacity DESC;
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[ListStaff_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListStaff_Query]

		@arg varchar(20)

AS

BEGIN

	IF (@arg = 'salary')

		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age,  MY_TEAM.Staff.internal_role, MY_TEAM.Staff.staff_role,
		MY_TEAM.Club_Member.salary, My_TEAM.Staff.internal_id
		FROM MY_TEAM.Staff, MY_TEAM.Club_Member, MY_TEAM.Person 
		WHERE MY_TEAM.Staff.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
		ORDER BY len(MY_TEAM.Club_Member.salary) DESC, MY_TEAM.Club_Member.salary DESC;

	IF (@arg = 'name')
		
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age,  MY_TEAM.Staff.internal_role, MY_TEAM.Staff.staff_role,
		MY_TEAM.Club_Member.salary, My_TEAM.Staff.internal_id
		FROM MY_TEAM.Staff, MY_TEAM.Club_Member, MY_TEAM.Person 
		WHERE MY_TEAM.Staff.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
		ORDER BY MY_TEAM.Person.fnome ASC, MY_TEAM.PERSON.lname ASC;

	IF (@arg = 'role')
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age,  MY_TEAM.Staff.internal_role, MY_TEAM.Staff.staff_role,
		MY_TEAM.Club_Member.salary, My_TEAM.Staff.internal_id
		FROM MY_TEAM.Staff, MY_TEAM.Club_Member, MY_TEAM.Person 
		WHERE MY_TEAM.Staff.internal_id = MY_TEAM.Club_Member.internal_id AND MY_TEAM.Club_Member.citizen_card = MY_TEAM.Person.citizen_card
		ORDER BY MY_TEAM.Staff.staff_role;
		
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[ListSupporters_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[ListSupporters_Query]

		@arg varchar(20)

AS

BEGIN
	
	IF (@arg = 'name')	
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.gender, MY_TEAM.Club_Supporter.supporter_id,  MY_TEAM.Club_Supporter.reserved_seat
		FROM MY_TEAM.Person, MY_TEAM.Club_Supporter 
		WHERE MY_TEAM.Person.citizen_card  = MY_TEAM.Club_Supporter.citizen_card
		ORDER BY MY_TEAM.Person.fnome ASC, MY_TEAM.Person.lname ASC;

	IF (@arg = 'age') 
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.gender, MY_TEAM.Club_Supporter.supporter_id,  MY_TEAM.Club_Supporter.reserved_seat
		FROM MY_TEAM.Person, MY_TEAM.Club_Supporter 
		WHERE MY_TEAM.Person.citizen_card  = MY_TEAM.Club_Supporter.citizen_card
		ORDER BY len(MY_TEAM.Person.age) ASC, MY_TEAM.Person.age ASC;

	IF (@arg = 'gender') 
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.gender, MY_TEAM.Club_Supporter.supporter_id,  MY_TEAM.Club_Supporter.reserved_seat
		FROM MY_TEAM.Person, MY_TEAM.Club_Supporter 
		WHERE MY_TEAM.Person.citizen_card  = MY_TEAM.Club_Supporter.citizen_card
		ORDER BY MY_TEAM.Person.gender;

	IF (@arg = 'seat') 
		SELECT MY_TEAM.Person.fnome, MY_TEAM.Person.lname, MY_TEAM.Person.age, MY_TEAM.Person.gender, MY_TEAM.Club_Supporter.supporter_id,  MY_TEAM.Club_Supporter.reserved_seat
		FROM MY_TEAM.Person, MY_TEAM.Club_Supporter 
		WHERE MY_TEAM.Person.citizen_card  = MY_TEAM.Club_Supporter.citizen_card
		ORDER BY len(MY_TEAM.Club_Supporter.reserved_seat) ASC, MY_TEAM.Club_Supporter.reserved_seat ASC;

END
GO
/****** Object:  StoredProcedure [MY_TEAM].[ListTeamSeasons_Query]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [MY_TEAM].[ListTeamSeasons_Query]

			@arg varchar(20)

	AS

	BEGIN

		IF (@arg = 'sport')
			SELECT MY_TEAM.Team_Season.sport_type, MY_TEAM.Team_Season.season_year, MY_TEAM.Team_Season.n_of_matches, MY_TEAM.Team_Season.total_scored,
			MY_TEAM.Team_Season.total_conceded, MY_TEAM.Team_Season.season_mvp FROM MY_TEAM.Team_Season ORDER BY My_TEAM.Team_Season.sport_type;

		IF (@arg = 'year')
			SELECT MY_TEAM.Team_Season.sport_type, MY_TEAM.Team_Season.season_year, MY_TEAM.Team_Season.n_of_matches, MY_TEAM.Team_Season.total_scored,
			MY_TEAM.Team_Season.total_conceded, MY_TEAM.Team_Season.season_mvp FROM MY_TEAM.Team_Season 
			ORDER BY len(MY_TEAM.Team_Season.season_year) DESC, MY_TEAM.Team_Season.season_year DESC;

		IF (@arg = 'nmatches')
			SELECT MY_TEAM.Team_Season.sport_type, MY_TEAM.Team_Season.season_year, MY_TEAM.Team_Season.n_of_matches, MY_TEAM.Team_Season.total_scored,
			MY_TEAM.Team_Season.total_conceded, MY_TEAM.Team_Season.season_mvp FROM MY_TEAM.Team_Season 
			ORDER BY len(MY_TEAM.Team_Season.n_of_matches) DESC, MY_TEAM.Team_Season.n_of_matches DESC;

		IF (@arg = 'goals')
			SELECT MY_TEAM.Team_Season.sport_type, MY_TEAM.Team_Season.season_year, MY_TEAM.Team_Season.n_of_matches, MY_TEAM.Team_Season.total_scored,
			MY_TEAM.Team_Season.total_conceded, MY_TEAM.Team_Season.season_mvp FROM MY_TEAM.Team_Season 
			ORDER BY len(MY_TEAM.Team_Season.total_scored) DESC, MY_TEAM.Team_Season.total_scored DESC;

		IF (@arg = 'conceded')
			SELECT MY_TEAM.Team_Season.sport_type, MY_TEAM.Team_Season.season_year, MY_TEAM.Team_Season.n_of_matches, MY_TEAM.Team_Season.total_scored,
			MY_TEAM.Team_Season.total_conceded, MY_TEAM.Team_Season.season_mvp FROM MY_TEAM.Team_Season 
			ORDER BY len(MY_TEAM.Team_Season.total_conceded) ASC, MY_TEAM.Team_Season.total_conceded ASC;

	END

GO
/****** Object:  StoredProcedure [MY_TEAM].[Matchday_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[Matchday_StoredProcedure]
	@arg varchar(20),
	@delValue int = NULL, 
	@mvp_id			int = NULL,
	@matchday_no	int = NULL,
	@matchday_id    int = NULL,
	@matchday_date	int = NULL,
	@scored			int = NULL,
	@conceded		int = NULL,
	@season_id		int = NULL,
	@oteam_id		int = NULL,
	@infra_id		int = NULL,
	@player_id		int = NULL

AS

BEGIN
        IF (@arg = 'insert') BEGIN
			INSERT INTO MY_TEAM.Matchday VALUES (@mvp_id, @matchday_no, @matchday_id, @matchday_date, @scored, @conceded, @season_id, @oteam_id, @infra_id);
			INSERT INTO MY_TEAM.Played_By VALUES ( @player_id, @matchday_id, @oteam_id);
		END

		IF (@arg = 'delete') BEGIN
			DELETE FROM MY_TEAM.Played_By WHERE MY_TEAM.Played_By.matchDay_Id = @delValue;
			DELETE FROM MY_TEAM.Matchday WHERE MY_TEAM.Matchday.matchday_id = @delValue;


		END
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[Oponents_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[Oponents_StoredProcedure]
	
		@arg varchar(20),
		@delValue int = NULL,
		@market_v	int = NULL,
		@oteam_id	int = NULL,
		@oteam_name	varchar(20) = NULL


AS

BEGIN
        IF (@arg = 'insert') BEGIN
			INSERT INTO MY_TEAM.Oponents VALUES (@market_v, @oteam_id, @oteam_name);
		END

		IF (@arg = 'delete') BEGIN
			DELETE FROM MY_TEAM.Oponents WHERE My_TEAM.Oponents.oteam_id = @delValue;
		END
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[PlayedBy_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[PlayedBy_StoredProcedure]

	
		@player_id		int,
		@matchday_id    int,
		@oteam_id int

AS

BEGIN
	
		INSERT INTO MY_TEAM.Played_By VALUES ( @player_id, @matchday_id, @oteam_id);
END
GO
/****** Object:  StoredProcedure [MY_TEAM].[Player_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[Player_StoredProcedure]

			@operation       varchar(20),
			@delValue         int = NULL,

			@fname		     varchar(20) = NULL,
			@lname           varchar(20) = NULL,
			@nationality	 varchar(20) = NULL,
			@age			 tinyint = NULL,     
			@citizen_card	 int = NULL,         
			@gender			 varchar(20) = NULL,

			@internal_id	 int = NULL,
			@internal_role   varchar(20) = NULL,
			@salary		     varchar(20) = NULL,
			--@citizen_card	 int,

			@height         int = NULL,
			@position       varchar(20) = NULL,
			@sport          varchar(20) = NULL,
			@shirt_number   varchar(20) = NULL,
			@agent          varchar(20) = NULL,
			@market_value   int = NULL,
			@team_status    varchar(20) = NULL
			--@internal_id	int,
			--@internal_role  varchar(20),
			--@citizen_card	int

AS

BEGIN

	IF (@operation = 'insert') BEGIN
				INSERT INTO MY_TEAM.Person VALUES (@fname, @lname, @nationality, @age, @citizen_card, @gender);
				INSERT INTO MY_TEAM.Club_Member VALUES (@internal_id, @internal_role, @salary, @citizen_card);
				INSERT INTO MY_TEAM.Player VALUES (@height, @position, @sport, @shirt_number, @agent, @market_value, @team_status, @internal_id, @internal_role, @citizen_card);
	END

	IF (@operation = 'delete') BEGIN
				DECLARE @citizen_card1 int;
				SELECT @citizen_card1 = MY_TEAM.Club_Member.citizen_card FROM MY_TEAM.Club_Member WHERE MY_TEAM.Club_Member.internal_id = @delValue;
				DELETE FROM MY_TEAM.Played_By WHERE MY_TEAM.Played_By.player_id = @delValue
				DELETE FROM MY_TEAM.Player WHERE MY_TEAM.Player.internal_id = @delValue;
				DELETE FROM MY_TEAM.Club_Member WHERE MY_TEAM.Club_Member.internal_id = @delValue;
			    DELETE FROM MY_TEAM.Person WHERE MY_TEAM.Person.citizen_card = @citizen_card1;
	END 

END

GO
/****** Object:  StoredProcedure [MY_TEAM].[SportFacility_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MY_TEAM].[SportFacility_StoredProcedure]

			@operation varchar(20),
			@delValue int = NULL,
			@iname		varchar(20) = NULL,
			@inau_date	int = NULL,
			@c_cost		int = NULL,
			@m_cost		int = NULL,
			@infra_id	int = NULL,
	
			@capacity	int = NULL,
			@sf_type	varchar(20) = NULL,
			@surface	varchar(20) = NULL


AS

BEGIN
		IF (@operation = 'insert') BEGIN
			INSERT INTO MY_TEAM.Infrastructure VALUES (@iname, @inau_date, @c_cost, @m_cost, @infra_id);
			INSERT INTO MY_TEAM.Sport_Facility VALUES (@capacity, @sf_type, @surface, @infra_id);
		END

		IF (@operation = 'delete') BEGIN
				DECLARE @variavel int;
				SELECT @variavel = MY_TEAM.Matchday.matchday_id FROM MY_TEAM.Matchday WHERE MY_TEAM.Matchday.infra_id = @delValue;
				if exists ( select * from MY_TEAM.Matchday Where MY_TEAM.Matchday.infra_id = @delValue) begin
					DELETE FROM MY_TEAM.Matchday WHERE MY_TEAM.Matchday.infra_id = @delValue;
				end
				if exists (select * from MY_TEAM.Played_By Where MY_TEAM.Played_By.matchday_id = @variavel) begin
					DELETE FROM MY_TEAM.Played_By WHERE MY_TEAM.Played_By.matchday_id = @delValue;
				end
				DELETE FROM MY_TEAM.Sport_Facility WHERE MY_TEAM.Sport_Facility.infra_id = @delValue;
				DELETE FROM MY_TEAM.Infrastructure WHERE MY_TEAM.Infrastructure.infra_id = @delValue;
		END

END

GO
/****** Object:  StoredProcedure [MY_TEAM].[Staff_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[Staff_StoredProcedure]
			
			@operation varchar(20),
			@delValue  int = NULL,

			@fname		     varchar(20) = NULL,
			@lname           varchar(20) = NULL,
			@nationality	 varchar(20) = NULL,
			@age			 tinyint	 = NULL,     
			@citizen_card	 int		 = NULL,         
			@gender			 varchar(20) = NULL,

			@internal_id	 int		 = NULL,
			@internal_role   varchar(20) = NULL,
			@salary		     varchar(20) = NULL,

			@staff_role      varchar(20) = NULL
	

AS

BEGIN

	IF (@operation = 'insert') BEGIN
			INSERT INTO My_TEAM.Person VALUES (@fname, @lname, @nationality, @age, @citizen_card, @gender);
			INSERT INTO MY_TEAM.Club_Member VALUES (@internal_id, @internal_role, @salary, @citizen_card);
			INSERT INTO MY_TEAM.Staff VALUES (@internal_id, @internal_role, @staff_role, @citizen_card);
	END

	IF (@operation = 'delete') BEGIN
			DECLARE @citizen_card1 int;
				SELECT @citizen_card1 = MY_TEAM.Club_Member.citizen_card FROM MY_TEAM.Club_Member WHERE MY_TEAM.Club_Member.internal_id = @delValue;
				DELETE FROM MY_TEAM.Staff WHERE MY_TEAM.Staff.internal_id = @delValue;
				DELETE FROM MY_TEAM.Club_Member WHERE MY_TEAM.Club_Member.internal_id = @delValue;
			    DELETE FROM MY_TEAM.Person WHERE MY_TEAM.Person.citizen_card = @citizen_card1;
	END
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[Supporter_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[Supporter_StoredProcedure]
			@operation varchar(20),
			@delValue  int = NULL,
			@fname		     varchar(20) = NULL,
			@lname           varchar(20) = NULL,
			@nationality	 varchar(20) = NULL,
			@age			 tinyint = NULL,     
			@citizen_card	 int = NULL,         
			@gender			 varchar(20) = NULL,

			@supporter_id    int = NULL,
			@reserved_seat   int = NULL


AS

BEGIN

		IF (@operation = 'insert') BEGIN
			INSERT INTO My_TEAM.Person VALUES (@fname, @lname, @nationality, @age, @citizen_card, @gender);
		    INSERT INTO MY_TEAM.Club_Supporter VALUES (@supporter_id, @reserved_seat, @citizen_card);
		END 

		IF (@operation = 'delete') BEGIN
				DECLARE @citizen_card1 int;
				SELECT @citizen_card1 = MY_TEAM.Club_Supporter.citizen_card FROM MY_TEAM.Club_Supporter WHERE MY_TEAM.Club_Supporter.supporter_id = @delValue;
				DELETE FROM MY_TEAM.Club_Supporter WHERE MY_TEAM.Club_Supporter.supporter_id = @delValue;
			    DELETE FROM MY_TEAM.Person WHERE MY_TEAM.Person.citizen_card = @citizen_card1;
		END
END

GO
/****** Object:  StoredProcedure [MY_TEAM].[TeamSeason_StoredProcedure]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MY_TEAM].[TeamSeason_StoredProcedure]

	@operation       varchar(20),
	@delValue         int = NULL,
	
	@sport_type		varchar(20) = NULL,
	@season_year    int = NULL,
	@n_of_matches	int = NULL,
	@total_scored	int = NULL,
	@total_conceded	int = NULL,
	@season_mvp		int = NULL,
	@season_id		int = NULL


AS

BEGIN
		IF (@operation = 'insert') BEGIN

			INSERT INTO My_TEAM.Team_Season VALUES (@sport_type, @season_year, @n_of_matches, @total_scored, @total_conceded, @season_mvp, @season_id);
		END

		IF (@operation = 'delete') BEGIN
				DELETE FROM MY_TEAM.Team_Season WHERE MY_TEAM.Team_Season.season_id = @delValue;
				DELETE FROM MY_TEAM.Matchday    WHERE MY_TEAM.Matchday.season_id    = @delValue;
		END
END

GO
/****** Object:  Trigger [MY_TEAM].[playertrigger]    Script Date: 11/06/2018 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [MY_TEAM].[playertrigger] on [MY_TEAM].[Player]
after insert
as
	declare @p_id as int
	select @p_id = MY_TEAM.Player.internal_id from MY_TEAM.Player;
	if @p_id < 1000 begin
		raiserror ('Player id nao processado. valor muito baixo', 16,1);
		rollback tran;
	end
	else if (@p_id > 9999) begin
	     print 'log: Player id de valor elevado'
		 rollback tran;
	end
GO
ALTER TABLE [MY_TEAM].[Player] ENABLE TRIGGER [playertrigger]
GO
USE [master]
GO
ALTER DATABASE [p4g8] SET  READ_WRITE 
GO
