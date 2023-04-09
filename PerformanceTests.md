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
There are 3 Sqlite databases present in standard use of Core Data. The measuring of storage present in the sqlite database is difficult because of swift's NSPersistentStoreManager's functionalities that does not remove the data completely, rather keeps the data there to be reused later. The size question gets handled by Swift's functionality so these are just estimates. Here is the memory breakup of these databases given different amount of reeds:
### 0 reeds:
The size of the store is: 74 KB
The size of the wal is: nil
The size of the shm is: 33 KB
### 1 reed:
The size of the store is: 74 KB
The size of the wal is: 41 KB
The size of the shm is: 33 KB
### 2 reeds:
The size of the store is: 74 KB
The size of the wal is: 62 KB
The size of the shm is: 33 KB
### 3 reeds:
The size of the store is: 74 KB
The size of the wal is: 82 KB
The size of the shm is: 33 KB
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
### 5000 reeds:
The size of the store is: 1,290 KB
The size of the wal is: 1,121 KB
The size of the shm is: 33 KB
