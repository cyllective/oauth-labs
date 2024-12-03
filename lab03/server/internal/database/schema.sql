CREATE TABLE IF NOT EXISTS users(
	id VARCHAR(36) PRIMARY KEY,
	username VARCHAR(60) UNIQUE NOT NULL,
	password VARCHAR(256) NOT NULL,
    avatar_url VARCHAR(256) DEFAULT "",
	firstname VARCHAR(60) DEFAULT "",
	lastname VARCHAR(60) DEFAULT "",
	email VARCHAR(120) DEFAULT "",
    extra VARCHAR(256) DEFAULT ""
);

CREATE TABLE IF NOT EXISTS clients(
	id VARCHAR(36) PRIMARY KEY,
	config TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS user_consents(
	user_id VARCHAR(36) NOT NULL,
	client_id VARCHAR(36) NOT NULL,
    PRIMARY KEY(user_id, client_id),
	CONSTRAINT fk_user_consents_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_user_consents_client_id FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE IF NOT EXISTS access_tokens(
	id VARCHAR(36) PRIMARY KEY,
	user_id VARCHAR(36) NOT NULL,
	client_id VARCHAR(36) NOT NULL,
    revoked BOOLEAN DEFAULT false,
	data TEXT NOT NULL,
	CONSTRAINT fk_access_tokens_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_access_tokens_client_id FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE IF NOT EXISTS refresh_tokens(
	id VARCHAR(36) PRIMARY KEY,
	user_id VARCHAR(36) NOT NULL,
	client_id VARCHAR(36) NOT NULL,
    revoked BOOLEAN DEFAULT false,
	data TEXT NOT NULL,
	CONSTRAINT fk_refresh_tokens_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_refresh_tokens_client_id FOREIGN KEY (client_id) REFERENCES clients (id)
);

INSERT IGNORE INTO users(id, username, password, firstname, lastname, email, extra) VALUES('18f0bcd3-d9b5-4310-98ee-031150d4f21e', 'admin', 'random-password', 'Dick', 'Hardt', 'admin@oauth.labs', 'flag{8d3784b3baf1e771f6004f4023d70f0fba2963fe}');
