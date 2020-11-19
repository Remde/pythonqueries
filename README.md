# Python Queries

This program runs 10 distinct queries from a MySQL database that mimics Steam. To properly run this application, you need to setup a local MySQL server and upload our "steamdb" database which is included in this repository. The separate files for table creations, inserts, and queries are in the *db* folder.

To run this application you will also need Python and the mysql-connector module.
Go to the main folder and type:
```
python main.py
```
Alternatively, if you're using Python 3.x
```
python3 main.py
```
Additional database setup configuration might be needed depending on your network, OS, and general settings.

## Queries Index

1. Groups with a minimum (parametrized) number of participants
2. Number of friend by profile
3. Number of news by publishing company
4. Categories with no programs
5. Programs produced by more than one company
6. Positive analysis by non-banned users
7. Number of users that earned an insignia before a (parametrized) year, for each insignia
8. Number of items for each user, ordered by the user's level
9. Chest items and cosmetics that can be obtained in them
10. Programs with a certain (parametrized) marker with a discount
