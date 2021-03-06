use kylo;
delimiter //

create procedure remove_old_schema_040()

begin

DECLARE output VARCHAR(4000) DEFAULT '';
SELECT CONCAT(' STARTING Remove old schema') into output;

DROP TABLE IF EXISTS CHANGE_SET_FILES_PATH;
DROP TABLE IF EXISTS CHANGE_SET_HIVE_TABLE_PART_VALUE;
DROP TABLE IF EXISTS CHANGE_SET_HIVE_TABLE;

DROP TABLE IF EXISTS CHANGE_SET_FILES;
DROP TABLE IF EXISTS DATA_OPERATION;
DROP TABLE IF EXISTS CHANGE_SET;
DROP TABLE IF EXISTS DATASET;


DROP TABLE IF EXISTS FEED_DESTINATION;
DROP TABLE IF EXISTS FEED_SOURCE;
DROP TABLE IF EXISTS DATASOURCE;

DROP TABLE IF EXISTS FEED_PROPERTIES;
DROP TABLE IF EXISTS FM_TEMPLATE;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS FM_FEED;

IF EXISTS(SELECT table_name
            FROM INFORMATION_SCHEMA.COLUMNS
           WHERE table_schema = 'kylo'
             AND table_name LIKE 'FEED' and COLUMN_NAME = 'category_id')

-- If exists
THEN
ALTER TABLE`kylo`.`FEED`
DROP FOREIGN KEY `FKi6tlfq6nytlrb8429acoovlay`;
DROP TABLE FEED;
END IF;


DROP TABLE IF EXISTS FM_CATEGORY;
DROP TABLE IF EXISTS SLA_METRIC;
DROP TABLE IF EXISTS SLA_OBLIGATION_GROUP;
DROP TABLE IF EXISTS SLA_OBLIGATION;
DROP TABLE IF EXISTS SLA;
SELECT CONCAT(output,'\n','Removed Old schema.') into output;

SELECT output;

END//

delimiter ;
SET foreign_key_checks = 0;
-- Execute the procedure
call remove_old_schema_040();
SET foreign_key_checks = 1;

-- Drop the procedure
drop procedure remove_old_schema_040;

