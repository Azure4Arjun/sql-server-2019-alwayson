USE master
GO

CREATE AVAILABILITY GROUP Customers_Clusterless
WITH (
	AUTOMATED_BACKUP_PREFERENCE = SECONDARY,
	CLUSTER_TYPE = NONE
)
FOR DATABASE Customers
REPLICA ON 'PROD' WITH (
	ENDPOINT_URL = 'TCP://PROD.AlwaysOn.com:5022', 
	FAILOVER_MODE = MANUAL, 
	AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT, 
	SEEDING_MODE = AUTOMATIC,
	SECONDARY_ROLE(ALLOW_CONNECTIONS = ALL)
),
'READSCALE' WITH (
	ENDPOINT_URL = 'TCP://READSCALE.AlwaysOn.com:5022', 
	FAILOVER_MODE = MANUAL, 
	AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT, 
	SEEDING_MODE = AUTOMATIC,
	SECONDARY_ROLE(ALLOW_CONNECTIONS = ALL)
) ;
GO
