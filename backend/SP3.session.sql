-- CREATE TABLE Login(
--     Id_User     INT             NOT NULL    PRIMARY KEY     AUTO_INCREMENT,
--     Password    NVARCHAR(255)   NOT NULL,
--     Email       NVARCHAR(255)   NOT NULL,
--     Fullname    NVARCHAR(255)   NOT NULL,
--     Pictures    NVARCHAR(255)   NULL,
--     City        NVARCHAR(255)   NULL,
--     Phones      NVARCHAR(255)   NOT NULL,
--     Status      NVARCHAR(255)   NOT NULL
-- )

CREATE TABLE Message(
    Id_Message          INT             NOT NULL        PRIMARY KEY         AUTO_INCREMENT,
    Send_User_Id        INT             NOT NULL,
    Receive_User_Id     INT             NOT NULL,
    Messages            NVARCHAR(255)   NOT NULL,
    Time                DateTime        NOT NULL,
    Type                NVARCHAR(255)   NOT NULL,
    FOREIGN KEY(Send_User_Id) REFERENCES Login(Id_User),
    FOREIGN KEY(Receive_User_Id) REFERENCES Login(Id_User)
)