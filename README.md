# README

#### How to Run

1. go to root directory of project
2. run `docker-compose up --build` to build whole system
3. go to another window and connect to db using `docker exec -it <container_id_of_db> bash` ( `docker container ls` to see id)
  * create both databases specified in `config/shards.yml`
  * run the migration using rake task from web container as specified in step 4 
  * create table `ar_internal_metadata` for `transport_dev_new` db. refer to same table from `transport_dev` db
  
  ```
CREATE TABLE ar_internal_metadata (
        key character varying NOT NULL,
        value character varying,
        created_at timestamp without time zone NOT NULL,
        updated_at timestamp without time zone NOT NULL
    );
    
    ALTER TABLE ONLY ar_internal_metadata
        ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
    
    INSERT INTO ar_internal_metadata(key, value, created_at, updated_at) values('environment', 'development', NOW(), NOW());
```
  
  * clean all rows from `schema_migration_table` from `transport_dev_new` db
  * Re run he migration using rake task specified in step 4 
4. go to another window and connect to rails app using `docker exec -it <container_id> bash` ( `docker container ls` to see id)
  * run `rake db:migrate`
  * run `rake octopus:copy_schema_versions`
  
  
#### Problems yet to tackle
1. Creating databases automatically with `rake db:setup`
2. Running Schema migration for only one shard initially and then for another shard