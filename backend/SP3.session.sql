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
    Id_Message INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Sendby INT NOT NULL,
    Messages NVARCHAR(255) NOT NULL,
    Time NVARCHAR(255) NOT NULL,
    Type INT NOT NULL,
    FOREIGN KEY(Sendby) REFERENCES Login(Id_User)
)

CREATE TABLE GroupChat(
    Id_Group            INT             NOT NULL        DEFAULT  0,
    Last_Message        INT             NOT NULL,
    Id_Member           INT             NOT NULL,
    GroupType           NVARCHAR(255)   NOT NULL,
    GroupName           NVARCHAR(255)   NULL,
    Pictures            NVARCHAR(255)   NULL,
    FOREIGN KEY(Last_Message) REFERENCES Message(Id_Message)
)