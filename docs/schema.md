# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
first_name      | string    | not null
last_name       | string    | not null
phone_number    | string    | not null, indexed
country_code    | integer   | not null, indexed
sms_veri_code   | integer   | not null, indexed

## patients
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
first_name      | string    | not null
last_name       | string    | not null
user_id         | integer   | not null, foreign key (references user), indexed

## doctors
column name       | data type | details
------------------|-----------|-----------------------
id                | integer   | not null, primary key
salutation        | string    | not null
first_name        | string    | not null
last_name         | string    | not null
street            | string    | not null
number            | string    | not null
city              | string    | not null
lat               | float     | not null, indexed
lng               | float     | not null, indexed

## dates
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
date        | date      | not null

## time_slots
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
time        | time      | not null
status      | string    | not null
date_id     | integer   | not null, foreign key (references date), indexed

## appointments
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
doctor_id    | integer   | not null, foreign key (references doctors), indexed
time_slot_id | integer   | not null, foreign key (references time_slots), indexed
patient_id   | string    | not null, foreign key (references patients), indexed
