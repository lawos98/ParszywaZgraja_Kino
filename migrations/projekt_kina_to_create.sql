-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-12-07 15:04:45.826

-- tables
-- Table: cinema_hall
CREATE TABLE CINEMA_HALL (
    ID INT  NOT NULL,
    SIZE INT  NOT NULL,
    NAME INT  NOT NULL,
    CONSTRAINT CINEMA_HALL_PK PRIMARY KEY (ID)
);

-- TABLE: MOVIE
CREATE TABLE MOVIE (
    ID INT  NOT NULL,
    NAME INT  NOT NULL,
    DURATION INT  NOT NULL,
    COVER_URL VARCHAR  NOT NULL,
    DESCRIPTION VARCHAR  NOT NULL,
    CONSTRAINT MOVIE_PK PRIMARY KEY (ID)
);

-- TABLE: PERMISSION
CREATE TABLE PERMISSION (
    ID INT  NOT NULL,
    NAME VARCHAR  NOT NULL,
    ROLE_ID INT  NOT NULL,
    CONSTRAINT PERMISSION_PK PRIMARY KEY (ID)
);

-- TABLE: ROLE
CREATE TABLE ROLE (
    ID INT  NOT NULL,
    NAME VARCHAR  NOT NULL,
    DESCRIPTION VARCHAR  NOT NULL,
    USER_ID INT  NOT NULL,
    CONSTRAINT ROLE_PK PRIMARY KEY (ID)
);

-- TABLE: SCHEDULE
CREATE TABLE SCHEDULE (
    ID INT  NOT NULL,
    START_DATE TIMESTAMP  NOT NULL default now(),
    NR_OF_SEATS INT  NOT NULL,
    MOVIE_ID INT  NOT NULL,
    CINEMA_HALL_ID INT  NOT NULL,
    CONSTRAINT SCHEDULE_PK PRIMARY KEY (ID)
);

-- Table: user
CREATE TABLE LOGIN_USER (
    ID INT  NOT NULL,
    FIRST_NAME VARCHAR  NOT NULL,
    LAST_NAME VARCHAR  NOT NULL,
    EMAIL VARCHAR  NOT NULL,
    ROLE_ID INT  NOT NULL,
    CONSTRAINT USER_PK PRIMARY KEY (ID)
);

-- foreign keys
-- Reference: Movie_Schedule (table: schedule)
ALTER TABLE SCHEDULE ADD CONSTRAINT MOVIE_SCHEDULE_FK
    FOREIGN KEY (MOVIE_ID)
    REFERENCES MOVIE (ID)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

CREATE table PERMISSION_ROLE (
    PERMISSION_ID INT NOT NULL,
    ROLE_ID INT NOT NULL,
    CONSTRAINT PERMISSION_ROLE_PK PRIMARY KEY (PERMISSION_ID, ROLE_ID),
    CONSTRAINT PERMISSION_ROLE_PERMISSION_FK FOREIGN KEY (PERMISSION_ID) REFERENCES PERMISSION (ID),
    CONSTRAINT PERMISSION_ROLE_ROLE_FK FOREIGN KEY (ROLE_ID) REFERENCES ROLE (ID)
);

-- Reference: Role_User (table: role)
ALTER TABLE LOGIN_USER ADD CONSTRAINT ROLE_USER_FK
    FOREIGN KEY (ROLE_ID)
    REFERENCES ROLE (ID)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Schedule_cinema_hall (table: schedule)
ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE_CINEMA_HALL_FK
    FOREIGN KEY (CINEMA_HALL_ID)
    REFERENCES CINEMA_HALL (ID)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: cinema_hall_seq
CREATE SEQUENCE cinema_hall_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: movie_seq
CREATE SEQUENCE movie_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: permission_seq
CREATE SEQUENCE permission_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: role_seq
CREATE SEQUENCE role_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: user_seq
CREATE SEQUENCE user_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- End of file.
