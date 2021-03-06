	CREATE TABLE IF NOT EXISTS  "sym_node"(
		"node_id" VARCHAR NOT NULL PRIMARY KEY ,
		"node_group_id" VARCHAR NOT NULL,
		"external_id" VARCHAR NOT NULL,
		"sync_enabled" INTEGER DEFAULT 0,
		"sync_url" VARCHAR,
		"schema_version" VARCHAR,
		"symmetric_version" VARCHAR,
		"database_type" VARCHAR,
		"database_version" VARCHAR,
		"heartbeat_time" TIMESTAMP,
		"timezone_offset" VARCHAR,
		"batch_to_send_count" INTEGER DEFAULT 0,
		"batch_in_error_count" INTEGER DEFAULT 0,
		"created_at_node_id" VARCHAR,
		"deployment_type" VARCHAR
	);

	CREATE TABLE IF NOT EXISTS "sym_node_identity"(
		"node_id" VARCHAR NOT NULL PRIMARY KEY ,
		FOREIGN KEY ("node_id") REFERENCES "sym_node" ("node_id")
	);

	insert into sym_node (node_id,node_group_id,external_id,sync_enabled,sync_url,schema_version,symmetric_version,database_type,database_version,heartbeat_time,timezone_offset,batch_to_send_count,batch_in_error_count,created_at_node_id) 
	 values ('002','store','002',1,null,null,null,null,null,current_timestamp,null,0,0,'000');

	INSERT INTO "sym_node_identity" VALUES('002');
