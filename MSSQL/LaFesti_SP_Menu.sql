--- MENU ---

 

CREATE TABLE tbl_MENU(MENU_ID INT PRIMARY KEY,
                      IMG IMAGE NOT NULL,
                      NAME NVARCHAR(100) NOT NULL,
                      M_DESCRIPTION VARCHAR(500) NOT NULL,
                      PRICE FLOAT NOT NULL,
                      M_STATUS BIT NOT NULL,
                      RESTAURANT_ID INT REFERENCES tbl_RESTAURANT(RESTAURANT_ID),
                      CREATED_DATE DATETIME,
                      LAST_MODIFIED DATETIME
                      )
                       
SELECT * FROM tbl_MENU

 

--CREATE SEQUENCE FOR MENU_ID--
CREATE SEQUENCE seq_MENU_ID AS INT START WITH 1 INCREMENT BY 1; 

 

INSERT INTO tbl_MENU VALUES(NEXT VALUE FOR seq_MENU_ID,'C:\Users\Merit\Desktop\Pk\Sat\Day 14\steam_momo.png','Steam Momo','Momo stuffed with freshly chopped Vegetable?s (Onion, carrot, cabbage, beans & Coriander), herbs and Tinch of Spices (5 Pcs).',119,1,101,GETDATE(),GETDATE());
INSERT INTO tbl_MENU VALUES(NEXT VALUE FOR seq_MENU_ID,'C:\Users\Merit\Desktop\Pk\Sat\Day 14\Chocolate Momo (1 Pc).png','Chocolate Momo ','Crunchy Momo filled with Brownie, topped with Chocolate Fudge & Garnished with Chocolate flakes. ',45,1,101,GETDATE(),GETDATE());
INSERT INTO tbl_MENU VALUES(NEXT VALUE FOR seq_MENU_ID,'C:\Users\Merit\Desktop\Pk\Sat\Day 14\Paneer Pan Fried Momo.png','Paneer Pan Fried Momo','Hot & Spongy Paneer Fried Momo Tossed in Spicy Schezwan Sauce and Garnished with Coriander',166,1,101,GETDATE(),GETDATE());
INSERT INTO tbl_MENU VALUES(NEXT VALUE FOR seq_MENU_ID,'C:\Users\Merit\Desktop\Pk\Sat\Day 14\Chicken_Pan_Fried_Momo.png','Chicken Pan Fried Momo','Hot & Crispy Fried Chicken Momo Tossed in Spicy Schezwan Sauce and Garnished with Coriander',156,1,101,GETDATE(),GETDATE());

 

---------------------------------------------
     --- PROCEDURE : SELECT_MENU ---
---------------------------------------------
CREATE PROCEDURE SELECT_ALL
AS
BEGIN
SELECT * FROM TBL_MENU
END

 

EXEC SELECT_ALL;

 

----------------------------------------

 

CREATE PROCEDURE SELECT_MENU
@NAME VARCHAR(100)
AS
BEGIN
SELECT * FROM tbl_MENU WHERE  NAME=@NAME
END

 

 

EXECUTE [DBO].[SELECT_MENU]
@NAME = 'steam momo'

 


---------------------------------------------
      --- PROCEDURE : INSERT_MENU ---
---------------------------------------------
CREATE PROCEDURE INSERT_MENU
@IMG IMAGE,
@NAME VARCHAR(100),
@M_DESCRIPTION VARCHAR(100),
@PRICE float,
@M_STATUS BIT,
@RESTAURANT_ID INT
AS
BEGIN
INSERT INTO tbl_MENU(MENU_ID,IMG,NAME,M_DESCRIPTION,PRICE,M_STATUS,RESTAURANT_ID,CREATED_DATE,LAST_MODIFIED) 
                           VALUES 
                          (NEXT VALUE FOR seq_MENU_ID, @IMG, @NAME, @M_DESCRIPTION,@PRICE,@M_STATUS,@RESTAURANT_ID,GETDATE(),GETDATE())
END;

 

EXECUTE [DBO].[INSERT_MENU]
@IMG='C:\Users\Merit\Desktop\Pk\Sat\Day 14\Chicken Schezwan Steam Momo.png',
@NAME='Chicken Schezwan Momo',
@M_DESCRIPTION='Minced soft Juicy boneless Chicken, Coriander & Celery leaf cooked in blend of herbs and spices comes with hot Schezwan flavour',
@PRICE=145,
@M_STATUS=1,
@RESTAURANT_ID=101;

 

EXEC SELECT_ALL;

 

---------------------------------------------
     --- PROCEDURE : UPDATE_MENU ---
---------------------------------------------

 

CREATE PROCEDURE UPDATE_MENU
@MENU_ID INT,
@IMG IMAGE,
@NAME VARCHAR(100),
@M_DESCRIPTION VARCHAR(100),
@PRICE float,
@M_STATUS BIT,
@RESTAURANT_ID INT
AS
BEGIN
UPDATE tbl_MENU SET IMG=@IMG,
                    NAME=@NAME, 
                    M_DESCRIPTION = @M_DESCRIPTION, 
                    PRICE=@PRICE, 
                    M_STATUS=@M_STATUS, 
                    RESTAURANT_ID=@RESTAURANT_ID,
                    CREATED_DATE=GETDATE(),
                    LAST_MODIFIED= GETDATE() 
              WHERE MENU_ID=@MENU_ID; 
END;

 

EXECUTE [DBO].[UPDATE_MENU]
@MENU_ID=5,
@IMG='C:\Users\Merit\Desktop\Pk\Sat\Day 14\Chicken Schezwan Steam Momo.png',
@NAME='Chicken Schezwan Momo',
@M_DESCRIPTION='Minced soft Juicy boneless Chicken, Coriander & Celery leaf cooked in blend of herbs and spices comes with hot Schezwan flavour',
@PRICE=200,
@M_STATUS=1,
@RESTAURANT_ID=101;

 

EXEC SELECT_ALL;

 


DROP PROCEDURE UPDATE_MENU
---------------------------------------------
     --- PROCEDURE : DELETE_MENU ---
---------------------------------------------
CREATE PROCEDURE DELETE_MENU
@MENU_ID INT
AS
BEGIN
DELETE FROM TBL_MENU WHERE MENU_ID=@MENU_ID
END

 

EXECUTE [DBO].[DELETE_MENU]
@MENU_ID = 5

 

EXEC SELECT_ALL;

 

------------------------------------------------------------------------