USE [master]
GO
/****** Object:  Database [HeroCards]    Script Date: 11/10/2020 1:35:58 PM ******/
CREATE DATABASE [HeroCards]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HeroCards', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HeroCards.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HeroCards_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HeroCards_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HeroCards] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HeroCards].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HeroCards] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HeroCards] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HeroCards] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HeroCards] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HeroCards] SET ARITHABORT OFF 
GO
ALTER DATABASE [HeroCards] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HeroCards] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HeroCards] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HeroCards] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HeroCards] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HeroCards] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HeroCards] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HeroCards] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HeroCards] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HeroCards] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HeroCards] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HeroCards] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HeroCards] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HeroCards] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HeroCards] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HeroCards] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HeroCards] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HeroCards] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HeroCards] SET  MULTI_USER 
GO
ALTER DATABASE [HeroCards] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HeroCards] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HeroCards] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HeroCards] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HeroCards] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HeroCards] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HeroCards] SET QUERY_STORE = OFF
GO
USE [HeroCards]
GO
/****** Object:  User [csharp]    Script Date: 11/10/2020 1:35:58 PM ******/
CREATE USER [csharp] FOR LOGIN [csharp] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [csharp]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [csharp]
GO
/****** Object:  Table [dbo].[CardCollection]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardCollection](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[playerID] [int] NULL,
	[cardID] [int] NULL,
	[card_level] [tinyint] NULL,
 CONSTRAINT [PK_CardCollection] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deck]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deck](
	[DeckCardID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NULL,
	[CollectionID] [int] NULL,
	[DeckNumber] [int] NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Deck] PRIMARY KEY CLUSTERED 
(
	[DeckCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeroActionCard]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeroActionCard](
	[Card_id] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [varchar](25) NULL,
	[Rarity] [varchar](15) NULL,
	[PlaySpeed] [tinyint] NULL,
	[ActionText] [varchar](50) NULL,
	[ManaCost] [smallint] NULL,
	[HealthCost] [smallint] NULL,
	[TimeCost] [smallint] NULL,
	[Target] [varchar](15) NULL,
	[PhysAtk] [smallint] NULL,
	[Slashing] [bit] NULL,
	[SlashBleed] [smallint] NULL,
	[SlashBleedDuration] [tinyint] NULL,
	[Piercing] [bit] NULL,
	[PierceArmor] [smallint] NULL,
	[Bludgeon] [bit] NULL,
	[BludgeonLower] [smallint] NULL,
	[BludgeonLowerDuration] [tinyint] NULL,
	[Shield] [bit] NULL,
	[ShieldArmor] [smallint] NULL,
	[ShieldResistance] [smallint] NULL,
	[ShieldDuration] [tinyint] NULL,
	[Crush] [bit] NULL,
	[CrushLower] [smallint] NULL,
	[CrushLowerDuration] [tinyint] NULL,
	[MagicAtk] [smallint] NULL,
	[Fire] [bit] NULL,
	[FireBurn] [smallint] NULL,
	[FireBurnDuration] [tinyint] NULL,
	[Electric] [bit] NULL,
	[ElectricSpeed] [smallint] NULL,
	[Ice] [bit] NULL,
	[IceSlow] [smallint] NULL,
	[IceSlowDurability] [tinyint] NULL,
	[Earth] [bit] NULL,
	[EarthAbsorb] [smallint] NULL,
	[Holy] [bit] NULL,
	[HolyHeal] [smallint] NULL,
	[Dark] [bit] NULL,
	[DarkSteal] [smallint] NULL,
	[Time] [bit] NULL,
	[TimeSpeed] [smallint] NULL,
	[Taunt] [bit] NULL,
	[Dispel] [bit] NULL,
	[MultiCast] [tinyint] NULL,
	[ManaManipulate] [smallint] NULL,
 CONSTRAINT [PK_HeroActionCard] PRIMARY KEY CLUSTERED 
(
	[Card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeroDoll]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeroDoll](
	[StuffyID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[Name] [varchar](25) NULL,
	[Class] [varchar](25) NULL,
	[Type] [varchar](25) NULL,
	[PrimaryAffinity] [varchar](25) NULL,
	[SecondaryAffinity] [varchar](25) NULL,
	[Health] [smallint] NULL,
	[Mana] [smallint] NULL,
	[Time] [tinyint] NULL,
	[Armor] [smallint] NULL,
	[Resistance] [smallint] NULL,
	[AbsorbPhys] [smallint] NULL,
	[AbsorbMgk] [smallint] NULL,
	[Speed] [smallint] NULL,
	[Initiative] [smallint] NULL,
	[Strength] [smallint] NULL,
	[Intellect] [smallint] NULL,
 CONSTRAINT [PK_HeroDoll] PRIMARY KEY CLUSTERED 
(
	[StuffyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Currency] [int] NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCards]    Script Date: 11/10/2020 1:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCards](
	[ShopCardID] [int] IDENTITY(1,1) NOT NULL,
	[card_id] [int] NULL,
 CONSTRAINT [PK_ShopCards] PRIMARY KEY CLUSTERED 
(
	[ShopCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CardCollection] ON 
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (2, 6, 4, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (3, 1, 5, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (4, 1, 3, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (5, 1, 4, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (7, 1, 3, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (8, 1, 5, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (9, 1, 1, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (10, 1, 3, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (11, 6, 3, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (12, 6, 5, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (13, 3, 11, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (14, 3, 5, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (15, 3, 7, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (16, 3, 1, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (17, 3, 5, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (18, 7, 6, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (19, 7, 6, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (20, 7, 8, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (21, 7, 7, 1)
GO
INSERT [dbo].[CardCollection] ([CollectionID], [playerID], [cardID], [card_level]) VALUES (22, 7, 10, 1)
GO
SET IDENTITY_INSERT [dbo].[CardCollection] OFF
GO
SET IDENTITY_INSERT [dbo].[HeroActionCard] ON 
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (1, N'Punch', NULL, 3, N'punches', 0, 0, 0, N'enemy', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (2, N'Test Punch', NULL, 3, N'punches', 0, 0, 0, N'enemy', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (3, N'Happy Dance', NULL, 0, N'dances and spreads joy healing', 5, -15, 0, N'allAllies', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 25, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (4, N'Zombie Call', NULL, 5, N'summons a small zombie to bite', 3, 0, 1, N'enemy', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (5, N'Claw', N'uncommon', 0, N'swipes his claws scratching', 0, 0, 0, N'enemy', 5, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (6, N'Bite', N'common', 1, N'bites', 0, 0, 0, N'enemy', 3, 0, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (7, N'Charge', N'common', 2, N'charges at', 0, 1, 0, N'enemy', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (8, N'Meal Time', N'common', 1, N'sits down to eat with', 0, -5, 0, N'ally', -4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (9, N'Stomp', N'common', 1, N'stomps angrily on the ground and shakes the ', 0, 0, 0, N'allEnemy', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (10, N'Windstorm', N'common', 1, N'flaps wings towards', 0, 0, 0, N'allEnemy', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
INSERT [dbo].[HeroActionCard] ([Card_id], [CardName], [Rarity], [PlaySpeed], [ActionText], [ManaCost], [HealthCost], [TimeCost], [Target], [PhysAtk], [Slashing], [SlashBleed], [SlashBleedDuration], [Piercing], [PierceArmor], [Bludgeon], [BludgeonLower], [BludgeonLowerDuration], [Shield], [ShieldArmor], [ShieldResistance], [ShieldDuration], [Crush], [CrushLower], [CrushLowerDuration], [MagicAtk], [Fire], [FireBurn], [FireBurnDuration], [Electric], [ElectricSpeed], [Ice], [IceSlow], [IceSlowDurability], [Earth], [EarthAbsorb], [Holy], [HolyHeal], [Dark], [DarkSteal], [Time], [TimeSpeed], [Taunt], [Dispel], [MultiCast], [ManaManipulate]) VALUES (11, N'Lightning Strike', N'uncommon', 2, N'calls lightning to strike', 3, 0, 0, N'enemy', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 4, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[HeroActionCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Player] ON 
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (1, N'DHeizer', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (2, N'Amber', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (3, N'Ben', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (4, N'James', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (5, N'Kathryn', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (6, N'Test', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (7, N'Dave', 10000)
GO
INSERT [dbo].[Player] ([PlayerID], [Name], [Currency]) VALUES (8, N'Dave', 10000)
GO
SET IDENTITY_INSERT [dbo].[Player] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopCards] ON 
GO
INSERT [dbo].[ShopCards] ([ShopCardID], [card_id]) VALUES (1, 4)
GO
INSERT [dbo].[ShopCards] ([ShopCardID], [card_id]) VALUES (2, 11)
GO
INSERT [dbo].[ShopCards] ([ShopCardID], [card_id]) VALUES (3, 7)
GO
SET IDENTITY_INSERT [dbo].[ShopCards] OFF
GO
ALTER TABLE [dbo].[CardCollection]  WITH CHECK ADD  CONSTRAINT [CardIdentifier] FOREIGN KEY([cardID])
REFERENCES [dbo].[HeroActionCard] ([Card_id])
GO
ALTER TABLE [dbo].[CardCollection] CHECK CONSTRAINT [CardIdentifier]
GO
ALTER TABLE [dbo].[CardCollection]  WITH CHECK ADD  CONSTRAINT [PlayerCollection] FOREIGN KEY([playerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[CardCollection] CHECK CONSTRAINT [PlayerCollection]
GO
ALTER TABLE [dbo].[Deck]  WITH CHECK ADD  CONSTRAINT [CollectionDeckLink] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[CardCollection] ([CollectionID])
GO
ALTER TABLE [dbo].[Deck] CHECK CONSTRAINT [CollectionDeckLink]
GO
ALTER TABLE [dbo].[Deck]  WITH CHECK ADD  CONSTRAINT [PlayerDeckLink] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[Deck] CHECK CONSTRAINT [PlayerDeckLink]
GO
ALTER TABLE [dbo].[HeroDoll]  WITH CHECK ADD  CONSTRAINT [DollPlayerLink] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[HeroDoll] CHECK CONSTRAINT [DollPlayerLink]
GO
ALTER TABLE [dbo].[ShopCards]  WITH CHECK ADD  CONSTRAINT [FK_ShopCards_HeroActionCard] FOREIGN KEY([card_id])
REFERENCES [dbo].[HeroActionCard] ([Card_id])
GO
ALTER TABLE [dbo].[ShopCards] CHECK CONSTRAINT [FK_ShopCards_HeroActionCard]
GO
USE [master]
GO
ALTER DATABASE [HeroCards] SET  READ_WRITE 
GO
