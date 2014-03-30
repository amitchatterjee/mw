INSERT INTO MWC_DOMAIN (NAME) VALUES ('DEFAULT');

INSERT INTO MWC_ROLE (NAME) VALUES ('SYS');
INSERT INTO MWC_ROLE (NAME) VALUES ('ADMIN');
INSERT INTO MWC_ROLE (NAME) VALUES ('MANAGER');
INSERT INTO MWC_ROLE (NAME) VALUES ('USER');

-- Change the password and other columns as needed in the following insert statement for security reasons
INSERT INTO MWC_CLIENT (USERID, PASSWORD, LAST_NAME, FIRST_NAME, EMAIL)
	VALUES ('sys', PASSWORD('a1b2c3d4'), 'Administrator', 'System', 'info@quik-j.com');

INSERT INTO MWC_CLIENT_DOMAIN_MAP (CLIENT_ID, DOMAIN_ID)
	SELECT ID,
		(SELECT ID FROM MWC_DOMAIN WHERE NAME = 'DEFAULT')
		FROM MWC_CLIENT
		WHERE USERID = 'sys';
		
INSERT INTO MWC_CLIENT_DOMAIN_ROLE_MAP (CLIENT_DOMAIN_ID, ROLE_ID)
	SELECT m.ID, 
		(SELECT ID FROM MWC_ROLE WHERE NAME = 'SYS')
	FROM MWC_CLIENT c, MWC_CLIENT_DOMAIN_MAP m, MWC_DOMAIN d
	WHERE c.ID = m.CLIENT_ID AND d.ID = m.DOMAIN_ID
		AND c.USERID = 'sys' AND d.NAME = 'DEFAULT';

-- Change the password and other columns as needed in the following insert statement for security reasons
INSERT INTO MWC_CLIENT (USERID, PASSWORD, LAST_NAME, FIRST_NAME, EMAIL)
	VALUES ('activiti', PASSWORD('a1b2c3d4'), 'Client', 'Middleware', 'info@quik-j.com');

INSERT INTO MWC_CLIENT_DOMAIN_MAP (CLIENT_ID, DOMAIN_ID)
	SELECT ID,
		(SELECT ID FROM MWC_DOMAIN WHERE NAME = 'DEFAULT')
		FROM MWC_CLIENT
		WHERE USERID = 'activiti';
		
INSERT INTO MWC_CLIENT_DOMAIN_ROLE_MAP (CLIENT_DOMAIN_ID, ROLE_ID)
	SELECT m.ID, 
		(SELECT ID FROM MWC_ROLE WHERE NAME = 'SYS')
	FROM MWC_CLIENT c, MWC_CLIENT_DOMAIN_MAP m, MWC_DOMAIN d
	WHERE c.ID = m.CLIENT_ID AND d.ID = m.DOMAIN_ID
		AND c.USERID = 'activiti' AND d.NAME = 'DEFAULT';