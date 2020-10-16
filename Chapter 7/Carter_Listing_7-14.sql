--Create the endpoint
CREATE ENDPOINT AOAG_Endpoint
STATE = STARTED
AS TCP (   
	LISTENER_PORT = 5022,
	LISTENER_IP = ALL
)
FOR DATABASE_MIRRORING (
	AUTHENTICATION = CERTIFICATE Node1Cert,
	ROLE = ALL
)

--Grant each user permissions to connect to the endpoint
GRANT CONNECT ON ENDPOINT::AOAG_Endpoint TO ClusterNode1_AOAG;
GO

GRANT CONNECT ON ENDPOINT::AOAG_Endpoint TO ClusterNode2_AOAG;
GO
