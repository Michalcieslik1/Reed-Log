# General Tests:

## How large is the app: 

2MB

# Execution Time tests:

## Adding Reeds:
#### Adding of 1 took 0.009860038757324219 seconds
#### Adding of 100 took 0.13290798664093018 seconds
#### Adding of 1000 took 1.1014540195465088 seconds
#### 10000 reeds is the limit

## Converting reeds to JSON:
#### One reed: 0.003345966339111328 seconds
#### 100 reeds: 0.05687296390533447 seconds
#### 1000 reeds:  0.20592999458312988 seconds
#### 10000 reeds: 9.874783992767334 seconds, hits the limit

# Core Data test:

## How much memory each reed takes up:
There are 3 Sqlite databases present in standard use of Core Data. The measuring of storage present in the sqlite database is difficult because of swift's NSPersistentStoreManager's functionalities that does not remove the data completely, rather keeps the data there to be reused later. 

The central database that collects all of the data is the first one mentioned. the Wrte-Ahead Logging (WAL) database serves as a mediator between the central database and the model used in the app. All of the changes are first saved into the wal and later are added to the main database by Swift's Core Data implementation. Contrasting this with making a simple copy of the main database to account for rollbacks, this approach allows for a faster "journaling mode", allowing the saving of data to be faster, and rollbacks easier. Because of this functionality, the data is distributed between these two databases, making it hard to calculate exactly. Here is the memory breakup of these databases given different amount of reeds:
### 0 reeds:
The size of the store is: 74 KB

The size of the wal is: nil

The size of the shm is: 33 KB

##### Since the app has no data yet, the WAL database is completely empty.
### 1 reed:
The size of the store is: 74 KB

The size of the wal is: 41 KB

The size of the shm is: 33 KB

##### After adding one reed, the database is created with one reed in it.
### 2 reeds:
The size of the store is: 74 KB

The size of the wal is: 62 KB

The size of the shm is: 33 KB

### 3 reeds:
The size of the store is: 74 KB

The size of the wal is: 82 KB

The size of the shm is: 33 KB

##### After seeing the database's size change between adding 3 reeds, one reed can be estimated to take up around 20KB. This accounts for all of the tests and data present within the reed, but does NOT account for the notes present in reeds. The notes serve as their own entities that are pointing to the reeds rather than being within them.
### 5 reeds:
The size of the store is: 74 KB

The size of the wal is: 107 KB

The size of the shm is: 33 KB

### 10 reeds:
The size of the store is: 74 KB

The size of the wal is: 185 KB

The size of the shm is: 33 KB

### 100 reeds:
The size of the store is: 74 KB

The size of the wal is: 1,739 KB

The size of the shm is: 33 KB

### 1000 reeds:
The size of the store is: 311 KB

The size of the wal is: 766 KB

The size of the shm is: 33 KB

##### This is the point at which the WAL storage finally saves the reeds into the slower, but larger database. 
### 5000 reeds:
The size of the store is: 1,290 KB

The size of the wal is: 1,121 KB

The size of the shm is: 33 KB

## Data Size Chart:
![Screenshot 2023-04-09 at 2 12 58 PM](https://user-images.githubusercontent.com/60623457/230789545-ad4d8581-b98a-44ff-9774-8bbd1f632ede.png)

## Resources for Core Data Databases:
https://www.avanderlee.com/swift/write-ahead-logging-wal/
