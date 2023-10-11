# README

To run the application, run the following commands in the application root

bundle i

rails db:create db:migrate db:seed

To test the application, there is a test.http file in the root directory that can be used to call the apis

Admin user to be used to login and create other users:

Username: abdullahnegm
Password: 123



Schema:

User:
name                 String
username             String
password             String
password_digest      String
phone_number         String
ssn                  String
admin                Boolean

Room:
number               INT
price                Decimal   precision: 16   scale: 2
room_type            INT
floor_number         INT

Reservation:
room_id              BigInt
user_id              BigInt
date_from            Date
date_to              Date

