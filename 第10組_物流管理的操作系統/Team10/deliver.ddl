-- 產生者Oracle SQL Developer Data Modeler 21.4.2.059.0838
-- 於:2022-06-17 12:19:22 TST
-- 位置:Oracle Database 11g
-- 類型:Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE car (
    car_id            CHAR(26) NOT NULL,
    car_type          CHAR(26),
    car_driver        NUMBER(38) NOT NULL,
    car_position      CHAR(26) NOT NULL,
    car_maintain_cost NUMBER(38),
    car_fuel_cost     NUMBER(38),
    car_remarks       CHAR(200)
);

ALTER TABLE car ADD CONSTRAINT car_pk PRIMARY KEY ( car_id );

CREATE TABLE drive (
    drive_id        CHAR(26) NOT NULL,
    drive_driver    NUMBER(38) NOT NULL,
    drive_location  CHAR(200) NOT NULL,
    drive_condition CHAR(200) NOT NULL,
    drive_goods     NUMBER(38)
);

ALTER TABLE drive ADD CONSTRAINT drive_pk PRIMARY KEY ( drive_id );

CREATE TABLE employee (
    employee_id         NUMBER(38) NOT NULL,
    employee_name       CHAR(26) NOT NULL,
    employee_phone      CHAR(26) NOT NULL,
    employee_email      CHAR(100),
    employee_adress     CHAR(200) NOT NULL,
    employee_start      DATE NOT NULL,
    employee_department CHAR(26),
    employee_position   CHAR(26) NOT NULL,
    employee_stituation CHAR(26) NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE extra_cost (
    extra_cost_id        NUMBER(38) NOT NULL,
    extra_cost_name      CHAR(100) NOT NULL,
    extra_cost_use       CHAR(200),
    extra_cost_cost      NUMBER(38) NOT NULL,
    extra_cost_principal NUMBER(38) NOT NULL
);

ALTER TABLE extra_cost ADD CONSTRAINT extra_cost_pk PRIMARY KEY ( extra_cost_id );

CREATE TABLE member (
    member_id        NUMBER(38) NOT NULL,
    member_name      CHAR(26) NOT NULL,
    member_phone     CHAR(26) NOT NULL,
    member_mail      CHAR(100),
    member_type      CHAR(200) NOT NULL,
    member_principal NUMBER(38) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( member_id );

CREATE TABLE order_information (
    order_id                CHAR(38) NOT NULL,
    order_date              DATE,
    order_sender_id         NUMBER(38) NOT NULL,
    order_receiver_id       NUMBER(38) NOT NULL,
    order_receiver_name     CHAR(26),
    order_receiver_phone    CHAR(26) NOT NULL,
    order_receiver_adress   CHAR(200) NOT NULL,
    order_receiver_area     NUMBER(38) NOT NULL,
    order_type              CHAR(100) NOT NULL,
    order_deliveryfee       NUMBER(38) NOT NULL,
    order_pay               NUMBER(38),
    order_pay_position      CHAR(100),
    order_position          CHAR(100) NOT NULL,
    order_delivery_position CHAR(100),
    order_expect_date       DATE,
    order_principal         NUMBER(38) NOT NULL,
    order_remarks           CHAR(500)
);

ALTER TABLE order_information ADD CONSTRAINT order_pk PRIMARY KEY ( order_id );

CREATE TABLE receiver (
    receiver_id     NUMBER NOT NULL,
    receiver_name   CHAR(26) NOT NULL,
    receiver_phone  CHAR(26) NOT NULL,
    receiver_adress CHAR(200) NOT NULL,
    receiver_mail   CHAR(100)
);

ALTER TABLE receiver ADD CONSTRAINT senderv1_pk PRIMARY KEY ( receiver_id );

CREATE TABLE sender (
    sender_id     NUMBER(38) NOT NULL,
    sender_name   CHAR(26) NOT NULL,
    sender_phone  CHAR(26) NOT NULL,
    sender_adress CHAR(200) NOT NULL,
    sender_mail   CHAR(100)
);

ALTER TABLE sender ADD CONSTRAINT sender_pk PRIMARY KEY ( sender_id );

CREATE TABLE warehouse (
    warehouse_area      NUMBER(38) NOT NULL,
    warehouse_car       CHAR(26),
    warehouse_cost      NUMBER(38),
    warehouse_principal NUMBER(38) NOT NULL
);

ALTER TABLE warehouse ADD CONSTRAINT warehouse_pk PRIMARY KEY ( warehouse_area );

ALTER TABLE car
    ADD CONSTRAINT car_drive_fkv1 FOREIGN KEY ( car_driver )
        REFERENCES employee ( employee_id );

ALTER TABLE drive
    ADD CONSTRAINT drive_employee_fk FOREIGN KEY ( drive_driver )
        REFERENCES employee ( employee_id );

ALTER TABLE extra_cost
    ADD CONSTRAINT extra_cost_employee_fk FOREIGN KEY ( extra_cost_principal )
        REFERENCES employee ( employee_id );

ALTER TABLE member
    ADD CONSTRAINT member_employee_fk FOREIGN KEY ( member_principal )
        REFERENCES employee ( employee_id );

ALTER TABLE order_information
    ADD CONSTRAINT order_employee_fk FOREIGN KEY ( order_principal )
        REFERENCES employee ( employee_id );

ALTER TABLE order_information
    ADD CONSTRAINT order_receiver_fk FOREIGN KEY ( order_receiver_id )
        REFERENCES receiver ( receiver_id );

ALTER TABLE order_information
    ADD CONSTRAINT order_sender_fk FOREIGN KEY ( order_sender_id )
        REFERENCES sender ( sender_id );

ALTER TABLE order_information
    ADD CONSTRAINT order_warehouse_fk FOREIGN KEY ( order_receiver_area )
        REFERENCES warehouse ( warehouse_area );



-- Oracle SQL Developer Data Modeler 摘要報表:
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
