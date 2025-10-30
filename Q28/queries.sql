CREATE TABLE userDetails (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'editor', 'user'))
);


INSERT INTO userDetails (username,pwd,role)
VALUES ('admin', 'admin@123', 'admin');

INSERT INTO userDetails (username,pwd,role)
VALUES ('editor', 'editor@123', 'editor');

INSERT INTO userDetails (username,pwd,role)
VALUES ('user', 'user@123', 'user');


CREATE TABLE page (
    pageId INT IDENTITY(1,1) PRIMARY KEY,
    pageName VARCHAR(100) NOT NULL,
    pageDescription VARCHAR(MAX) NOT NULL
);