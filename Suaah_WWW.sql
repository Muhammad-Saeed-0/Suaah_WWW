create database Suaah_WWW

USE [Suaah_WWW]
GO

/****** Object:  Table [dbo].[Registration]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](max) NOT NULL,
	[last_name] [nvarchar](max) NOT NULL,
	[brithdate] [date] NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[usergroup] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Hotel]    Script Date: 5/31/2022 12:26:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HotelRoom]    Script Date: 5/31/2022 12:26:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HotelRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[CancelBeforeHours] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[HotelId] [int] NOT NULL,
 CONSTRAINT [PK_HotelRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Services]    Script Date: 5/31/2022 12:26:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[HotelRoom]  WITH CHECK ADD  CONSTRAINT [FK_HotelRoom_Hotel_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HotelRoom] CHECK CONSTRAINT [FK_HotelRoom_Hotel_HotelId]
GO


/****** Object:  Table [dbo].[HotelRoomServices]    Script Date: 5/31/2022 12:51:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HotelRoomServices](
	[HotelRoomId] [int] NOT NULL,
	[ServicesId] [int] NOT NULL,
 CONSTRAINT [PK_HotelRoomServices] PRIMARY KEY CLUSTERED 
(
	[HotelRoomId] ASC,
	[ServicesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HotelRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_HotelRoomServices_HotelRoom_HotelRoomId] FOREIGN KEY([HotelRoomId])
REFERENCES [dbo].[HotelRoom] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HotelRoomServices] CHECK CONSTRAINT [FK_HotelRoomServices_HotelRoom_HotelRoomId]
GO

ALTER TABLE [dbo].[HotelRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_HotelRoomServices_Services_ServicesId] FOREIGN KEY([ServicesId])
REFERENCES [dbo].[Services] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HotelRoomServices] CHECK CONSTRAINT [FK_HotelRoomServices_Services_ServicesId]
GO


/****** Object:  Table [dbo].[Airline]    Script Date: 5/31/2022 2:04:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airline](
	[Code] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Airport]    Script Date: 5/31/2022 2:05:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Flight]    Script Date: 5/31/2022 3:33:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Flight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartingGate] [nvarchar](max) NOT NULL,
	[ArriveGate] [nvarchar](max) NOT NULL,
	[NumberOfStops] [nvarchar](max) NOT NULL,
	[LeaveTime] [datetime2](7) NOT NULL,
	[AirlineCode] [nvarchar](450) NOT NULL,
	[DepartingAirportId] [int] NOT NULL,
	[ArrivingAirportId] [int] NOT NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FlightClass]    Script Date: 5/31/2022 3:33:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FlightClass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FlightClass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FlightsClasses]    Script Date: 5/31/2022 3:33:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FlightsClasses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[FlightId] [int] NOT NULL,
	[FlightClassId] [int] NOT NULL,
 CONSTRAINT [PK_FlightsClasses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [dbo].[Airline] ([Code])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airline_AirlineCode]
GO

ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_ArrivingAirportId] FOREIGN KEY([ArrivingAirportId])
REFERENCES [dbo].[Airport] ([Id])
GO

ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_ArrivingAirportId]
GO

ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_DepartingAirportId] FOREIGN KEY([DepartingAirportId])
REFERENCES [dbo].[Airport] ([Id])
GO

ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_DepartingAirportId]
GO

ALTER TABLE [dbo].[FlightsClasses]  WITH CHECK ADD  CONSTRAINT [FK_FlightsClasses_Flight_FlightId] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[FlightsClasses] CHECK CONSTRAINT [FK_FlightsClasses_Flight_FlightId]
GO

ALTER TABLE [dbo].[FlightsClasses]  WITH CHECK ADD  CONSTRAINT [FK_FlightsClasses_FlightClass_FlightClassId] FOREIGN KEY([FlightClassId])
REFERENCES [dbo].[FlightClass] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[FlightsClasses] CHECK CONSTRAINT [FK_FlightsClasses_FlightClass_FlightClassId]
GO

/****** PROCEDURES  ******/
create PROCEDURE insert_flight @dgate nvarchar(max),@agate nvarchar(max),@stops int,@leave datetime2(7),@airline nvarchar(450),@dair int,@aair int 
as
insert into Flight values(@dgate,@agate,@stops,@leave,@airline,@dair,@aair);
go

create PROCEDURE insert_class @name nvarchar(max) 
as
insert into FlightClass values(@name);
go

create PROCEDURE insert_flightclass @price float,@flight int,@class int 
as
insert into FlightsClasses values(@price,@flight,@class)
go

create PROCEDURE update_flightclass @price float,@flight int,@class int ,@id int
as
update FlightsClasses set Price= @price, FlightId= @flight, FlightClassId= @class where ID=@id; 
go

create PROCEDURE update_flight @dgate nvarchar(max),@agate nvarchar(max),@stops int,@leave datetime2(7),@airline nvarchar(450),@dair int,@aair int, @id int
as
update Flight set  DepartingGate=@dgate,ArriveGate=@agate,NumberOfStops=@stops,LeaveTime=@leave,AirlineCode=@airline,DepartingAirportId=@dair,ArrivingAirportId=@aair where Id=@id;
go

create PROCEDURE update_class @name nvarchar(max),@id int
as
update FlightClass set Class=@name where ID=@id;
go

create PROCEDURE delete_flightclass @id int
as
delete from FlightsClasses where ID=@id; 
go

create PROCEDURE delete_flight @id int
as
delete from Flight where Id=@id;
go

create PROCEDURE delete_class @id int
as
delete from FlightClass where ID=@id;
go

create PROCEDURE select_flightclass @id int
as
select * from FlightsClasses where ID=@id; 
go

create PROCEDURE select_all_flightclass 
as
select * from FlightsClasses ; 
go

create PROCEDURE select_flight @id int
as
select * from Flight where Id=@id;
go

create PROCEDURE select_all_flight
as
select * from Flight ;
go

create PROCEDURE select_class @id int
as
select * from FlightClass where ID=@id;
go

create PROCEDURE select_all_class 
as
select * from FlightClass ;
go

create PROCEDURE select_all_airline 
as
select * from Airline ;
go

create PROCEDURE select_all_airport 
as
select * from Airport ;
go



/****** insert admin into [dbo].[Registration]  ******/

INSERT INTO [dbo].[Registration] (first_name, last_name, brithdate, address, email, password, usergroup)
VALUES ('admin', 'admin', '1990-12-1', 'egypt', 'admin@gmail.com', '1234', '1');


/****** insert admin into [dbo].[Hotel]  ******/

INSERT INTO [dbo].[Hotel]
           ([Name]
           ,[Address]
           ,[Email]
           ,[PhoneNumber]
           ,[Description])
     VALUES
           ('Pullman Munich',
           'Munich, Germany',
            'PullmanMunich@gmail.com',
			'01111111100',
			'Pullman Hotel Munich Hotel in Hotel Munich is a wonderful 4-star hotel where you can enjoy watching the view of its contents from the inside as mentioned in some of its contents from the inside, tennis garden, garden, car park) provides you with the opportunity to return from the services. After that, you can enjoy watching your videos.')
GO

INSERT INTO [dbo].[Hotel]
           ([Name]
           ,[Address]
           ,[Email]
           ,[PhoneNumber]
           ,[Description])
     VALUES
           ('Rixos',
           'Egypt, Sharm el Sheikh',
            'Rixos@gmail.com',
			'011111111111',
			'Enjoy a stay in Rixos Sharm El Sheikh, which is considered one of the best five-star hotels in Sharm El Sheikh, which is part of the Rixos hotel chain. The location of the hotel will enable you to visit Naama Bay or Naama Bay, which is about 19.7 km away, which is one of the best tourist places in Sharm El Sheikh Egypt, which It is very popular with Sharm el-Sheikh tourists, so you will not find a tourist who sets foot in Sharm El-Sheikh but visits Naama Bay...')
GO

INSERT INTO [dbo].[Hotel]
           ([Name]
           ,[Address]
           ,[Email]
           ,[PhoneNumber]
           ,[Description])
     VALUES
           ('Le Commodore',
           'Beirut, Lebanon',
            'Commodore@gmail.com',
			'011111111100',
			'The 5-star Le Commode is considered one of the most luxurious eggs in Beirut, which makes it the ideal place for a wonderful and attractive vacation, and perhaps what distinguishes it most is the ingenuity of design and therefore its luxury. You can visit the city attractions, such as: Zaytouna Bay...')
GO


/****** insert admin into [dbo].[HotelRoom]  ******/

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Superior Room'
           ,500
           , 0
           ,'Twin Beds'
           ,1)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Superior Room'
           ,800
           , 0
           ,'Twin Beds'
           ,1)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Superior Room'
           ,1000
           , 10
           ,'1 Queen Bed'
           ,1)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Junior Suite'
           ,1500
           , 8
           ,'1 Double Bed'
           ,1)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Executive Twin Room'
           ,1300
           , 5
           ,'1 King Bed'
           ,1)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Superior Room'
           ,800
           , 0
           ,'Twin Beds'
           ,2)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Deluxe Room'
           ,900
           , 0
           ,'Twin Beds'
           ,2)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Family Room'
           ,900
           , 0
           ,'no description'
           ,2)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Double Or Twin Deluxe'
           ,900
           , 10
           ,'no description'
           ,3)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Superior Room or Twin Room'
           ,1500
           , 10
           ,'no description'
           ,3)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Business Suite'
           ,1500
           , 10
           ,'no description'
           ,3)
GO

INSERT INTO [dbo].[HotelRoom]
           ([Type]
           ,[Price]
           ,[CancelBeforeHours]
           ,[Description]
           ,[HotelId])
     VALUES
           ('Two bedroom suite'
           ,1500
           , 0
           ,'no description'
           ,3)
GO


/****** insert admin into [dbo].[Services]  ******/

INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Only Room')
GO

INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Wifi')
GO


INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Wifi')
GO

INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Breakfast')
GO

INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Pool')
GO

INSERT INTO [dbo].[Services]
           ([Name])
     VALUES
           ('Parking included')
GO


/****** insert admin into [dbo].[HotelRoomServices]  ******/

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(1,1)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(2,1)
GO


INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(3,1)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(4,1)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(5,2)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(5,3)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(6,3)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(6,5)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(7,5)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(7,4)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(9,3)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(10,5)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(11,3)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(12,5)
GO

INSERT INTO [dbo].[HotelRoomServices]
           ([HotelRoomId]
           ,[ServicesId])
     VALUES(8,3)
GO

/****** insert admin into [dbo].[Airline]  ******/
INSERT INTO [dbo].[Airline]
           ([Code]
           ,[Name]
           ,[Country]
           ,[Description])
     VALUES
           ('RBG'
           ,'Air Arabia Egypt'
           ,'Cairo, Egypt'
           ,'Air Arabia Egypt is an Alexandria-based Air Arabia Group company. The airline offers low-cost travel to a number of destinations across the region. The company focuses on booking online. Air Arabia Egypt also provides booking facilities through call centers, travel agents, appointed GSA and sales shops.')
GO

INSERT INTO [dbo].[Airline]
           ([Code]
           ,[Name]
           ,[Country]
           ,[Description])
     VALUES
           ('MSC'
           ,'Air Cairo'
           ,'Europe'
           ,'Air Cairo is a low-fare airline based in Cairo, Egypt.  The airline is part owned by Egyptair. Air Cairo operates scheduled flights to the Middle East and Europe and also operates charter flights to Egypt from Europe on behalf of tour operators. Its base is Cairo International Airport, Sharm El Sheikh International Airport and Hurghada International Airport with the company head office in the Sheraton Heliopolis Zone.')
GO

INSERT INTO [dbo].[Airline]
           ([Code]
           ,[Name]
           ,[Country]
           ,[Description])
     VALUES
           ('KHH'
           ,'Alexandria Airlines'
           ,'Cairo, Egypt'
           ,'The airline was established in 2006 and commenced its operations in March 2007.In April 2022, it was announced the airline would be resuming operations, from 23 April, from Alexandria to Amman and Kuwait.')
GO

INSERT INTO [dbo].[Airline]
           ([Code]
           ,[Name]
           ,[Country]
           ,[Description])
     VALUES
           ('MSR'
           ,'EgyptAir'
           ,'Cairo, Egypt'
           ,'Egyptair is the state-owned flag carrier of Egypt. The airline is headquartered at Cairo International Airport, its main hub, operating scheduled passenger and freight services to 70 destinations in the Middle East, Europe, Africa, Asia, and the Americas.')
GO

/****** insert admin into [dbo].[Airport]  ******/

INSERT INTO [dbo].[Airport]
           ([Name]
           ,[Country]
           ,[City]
           ,[Description])
     VALUES
           ('Cairo International Airport'
           ,'Egypt'
           ,'Cairo'
           ,'Cairo International Airport is the principal international airport of Cairo and the largest and busiest airport in Egypt and serves as the primary hub for EgyptAir and Nile Air as well as several other airlines. The airport is located in Heliopolis, to the northeast of Cairo around fifteen kilometres (eight nautical miles) from the business area of the city and has an area of approximately 37 km2 (14 sq mi). Since 2020, it is the busiest airport in Africa, in terms of total passengers.')
GO


INSERT INTO [dbo].[Airport]
           ([Name]
           ,[Country]
           ,[City]
           ,[Description])
     VALUES
           ('Gran Canaria Airport'
           ,'España'
           ,'Gran Canaria'
           ,'Gran Canaria Airport, sometimes also known as Gando Airport (Spanish: Aeropuerto de Gran Canaria), is a passenger and freight airport on the island of Gran Canaria. It is an important airport within the Spanish air-transport network (owned and managed by a public enterprise, AENA), as it holds the sixth position in terms of passengers, and fifth in terms of operations and cargo transported. It also ranks first of the Canary Islands in all three categories, although the island of Tenerife has higher passenger numbers overall if statistics from the two airports located on the island are combined.')
GO

INSERT INTO [dbo].[Airport]
           ([Name]
           ,[Country]
           ,[City]
           ,[Description])
     VALUES
           ('Hurghada International Airport'
           ,'Egypt'
           ,'Hurghada'
           ,'Hurghada International Airport is the international airport of Hurghada in Egypt. It is located inland, 5 km (3.1 mi) southwest of El Dahar, the downtown of Hurghada. It is the second busiest airport in Egypt after Cairo International Airport and an important destination for leisure flights mainly from Europe.')
GO

INSERT INTO [dbo].[Airport]
           ([Name]
           ,[Country]
           ,[City]
           ,[Description])
     VALUES
           ('Roland Garros Airport'
           ,'Egypt'
           ,'Sainte-Marie'
           ,'Hurghada International Airport is the international airport of Hurghada in Egypt. It is located inland, 5 km (3.1 mi) southwest of El Dahar, the downtown of Hurghada. It is the second busiest airport in Egypt after Cairo International Airport and an important destination for leisure flights mainly from Europe')
GO

/****** insert admin into [dbo].[FlightClass]  ******/
INSERT INTO [dbo].[FlightClass]
           ([Class])
     VALUES('First')
GO
INSERT INTO [dbo].[FlightClass]
           ([Class])
     VALUES('Business')
GO
INSERT INTO [dbo].[FlightClass]
           ([Class])
     VALUES('Economy')
GO

/****** insert admin into [dbo].[Flight]  ******/
INSERT INTO [dbo].[Flight]
           ([DepartingGate]
           ,[ArriveGate]
           ,[NumberOfStops]
           ,[LeaveTime]
           ,[AirlineCode]
           ,[DepartingAirportId]
           ,[ArrivingAirportId])
     VALUES
           ('G10'
           ,'G2'
           ,'0'
           ,'5/5/2022 5:5:0'
           ,'MSR'
           ,1
           ,2)
GO

INSERT INTO [dbo].[Flight]
           ([DepartingGate]
           ,[ArriveGate]
           ,[NumberOfStops]
           ,[LeaveTime]
           ,[AirlineCode]
           ,[DepartingAirportId]
           ,[ArrivingAirportId])
     VALUES
           ('G5'
           ,'G3'
           ,'0'
           ,'5/5/2022 5:5:0'
           ,'MSR'
           ,2
           ,1)
GO

INSERT INTO [dbo].[Flight]
           ([DepartingGate]
           ,[ArriveGate]
           ,[NumberOfStops]
           ,[LeaveTime]
           ,[AirlineCode]
           ,[DepartingAirportId]
           ,[ArrivingAirportId])
     VALUES
           ('G14'
           ,'G13'
           ,'3'
           ,'5/6/2022 5:5:0'
           ,'MSR'
           ,1
           ,2)
GO

INSERT INTO [dbo].[Flight]
           ([DepartingGate]
           ,[ArriveGate]
           ,[NumberOfStops]
           ,[LeaveTime]
           ,[AirlineCode]
           ,[DepartingAirportId]
           ,[ArrivingAirportId])
     VALUES
           ('G10'
           ,'G10'
           ,'2'
           ,'5/7/2022 5:5:0'
           ,'MSR'
           ,3
           ,3)
GO

/****** insert admin into [dbo].[FlightsClasses]  ******/
INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(1000,1,3)
GO

INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(2000,1,2)
GO
INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(3000,1,1)
GO

INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(1000,2,3)
GO

INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(2000,2,2)
GO
INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(3000,2,1)
GO

INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(1000,3,3)
GO

INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(2000,3,2)
GO
INSERT INTO [dbo].[FlightsClasses]
           ([Price]
           ,[FlightId]
           ,[FlightClassId])
     VALUES(3000,3,1)
GO