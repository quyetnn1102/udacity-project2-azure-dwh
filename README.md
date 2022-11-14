# Building an Azure Data Warehouse for Bike Share Data Analytics 
# Submitter: Quyet, Nguyen

Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data. The dataset looks like this:

<img src="screenshots/data-model.png" title="data model"  width="500">

## The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. You will:

### Design a star schema based on the business outcomes listed below;
- Import the data into Synapse;
- Transform the data into the star schema;
- Finally, view the reports from Analytics.

### The business outcomes you are designing for are as follows:
- Analyze how much time is spent per ride
- Based on date and time factors such as day of week and time of day
- Based on which station is the starting and / or ending station
- Based on age of the rider at time of the ride
- Based on whether the rider is a member or a casual rider
- Analyze how much money is spent
- Per month, quarter, year
- Per member, based on the age of the rider at account start

### Analyze how much money is spent per member
- Based on how many rides the rider averages per month
- Based on how many minutes the rider spends on a bike per month

# TASKS NEED TO DO FOR THIS PROJECT

## Task1 : Create your Azure resources

## Task 2: Design a star schema
<img src="screenshots/bikeshare_star_schema.png" title="star model"  width="500">

## Task 3: Create the data in PostgreSQL

## Task 4: EXTRACT the data from PostgreSQL

## Task 5: LOAD the data into external tables in the data warehouse

## Task 6: TRANSFORM the data to the star schema

## Task 7: Write the query to answer business questions