IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='CAR' AND xtype='U')
	BEGIN
	CREATE TABLE MANUFACTURER
		(
			ManuID VARCHAR(60) NOT NULL PRIMARY KEY,
			OwnerID VARCHAR(60),
			Sales INT,
			PercentShare Decimal(2,2),
			Country VARCHAR(60)
		);
	CREATE TABLE CAR
		(
			CarID VARCHAR(60) NOT NULL PRIMARY KEY,
			Model VARCHAR(60) NOT NULL,
			Year INT,
			VehicleType VARCHAR(60),
			ManuID VARCHAR(60),
			EngineID VARCHAR(60),
			TranID INT,
			GasID INT     
		);
	CREATE TABLE ENGINE
		(
			EngineID VARCHAR(60) NOT NULL PRIMARY KEY,
			CarID VARCHAR(60),
			Cylinders INT,
			Displacement DECIMAL(3,1),
			Horsepower INT
			FOREIGN KEY (CarID) REFERENCES CAR(CarID)
		);
	CREATE TABLE TRANSMISSION
		(
			TranID INT PRIMARY KEY AUTO_INCREMENT,
			CarID VARCHAR(60),
			Type VARCHAR(60),
			Gears INT,
			FOREIGN KEY (CarID) REFERENCES CAR(CarID),
			Drivetrain VARCHAR(60) 
		);
	CREATE TABLE GAS_INFO
		(
			GasID INT PRIMARY KEY AUTO_INCREMENT,
			CarID VARCHAR(60) NOT NULL,
			CO DECIMAL(10,5),
			COO DECIMAL(10,5),
			NOX DECIMAL(10,5),
			MPG DECIMAL(10,5),
			FOREIGN KEY (CarID) REFERENCES CAR(CarID)
		);
	END
INSERT INTO CAR (CarId, Model, Year, VehicleType, ManuId, EngineID) VALUES (cid, m, y, v, mid, eid);
INSERT INTO ENGINE (EngineID, Cylinders, Displacement, Horsepower) VALUES (cid, eid, c, d, h);
INSERT INTO TRANSMISSION (Type, Gears, Drivetrain) VALUES(cid, t, g, d);
INSERT INTO GAS_INFO (CarID, CO, COO, NOX, MPG) VALUES(cid, co, coo, nox, mpg);

