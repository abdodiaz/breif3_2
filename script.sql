-- Creating Tables

CREATE TABLE
IF NOT EXISTS Projects
(
	code VARCHAR
(50),
    libelle VARCHAR
(50),
    description TEXT,
    amount FLOAT,
    start_date DATE,
	end_date DATE,
    state BIGINT,
    PRIMARY KEY
(code)
);

-- Creating Phases

CREATE TABLE
IF NOT EXISTS Phases
(
	id VARCHAR
(50) NOT NULL,
    libelle VARCHAR
(50),
    PhaseAmount VARCHAR
(50),
    PhaseStatus VARCHAR
(20),
    Facturation BOOLEAN,
	PaymentStatus BOOLEAN,
	id_projects VARCHAR
(50),
    PRIMARY KEY
(id)
);

-- Creating Employes

CREATE TABLE
IF NOT EXISTS Employes
(
	matricule VARCHAR
(50) NOT NULL,
    ContactNom VARCHAR
(50),
    ContactEmail VARCHAR
(50),
	ContactWeb VARCHAR
(50),
	id_users VARCHAR
(50),
	id_projects VARCHAR
(50),
    PRIMARY KEY
(matricule),
	FOREIGN KEY
(id_users)
REFERENCES users
(id),
FOREIGN KEY
(id_projects)
REFERENCES Projects
(code)
);

-- Creating Persons

CREATE TABLE
IF NOT EXISTS Persons
(
	matricule VARCHAR
(50) NOT NULL,
    nom VARCHAR
(50),
    prenom TEXT,
    tel BIGINT,
    email TEXT,
	login VARCHAR
(50),
    password VARCHAR
(50),
    PRIMARY KEY
(matricule)
);

-- Creating Users

CREATE TABLE
IF NOT EXISTS Users
(
	id VARCHAR
(50) NOT NULL,
	matricule_persons VARCHAR
(50),
	PRIMARY KEY
(id),
	FOREIGN KEY
(matricule_persons)
	REFERENCES Persons
(matricule);
);

-- Creating Organisme

CREATE TABLE
IF NOT EXISTS Organisme
(
	id VARCHAR
(50) NOT NULL,
	libelleContact VARCHAR
(50),
	id_users VARCHAR
(50),
	id_projects VARCHAR
(50),
	type VARCHAR
(50),
	PRIMARY KEY
(id),
	FOREIGN KEY
(id_users)
REFERENCES users
(id),
FOREIGN KEY
(id_projects)
REFERENCES Projects
(code);
);

-- Creating Roles

CREATE TABLE
IF NOT EXISTS Roles
(
	id VARCHAR
(50) NOT NULL,
	type VARCHAR
(50),
	PRIMARY KEY
(id)
);

CREATE TABLE
IF NOT EXISTS Employes_Roles
(
	id VARCHAR
(50) NOT NULL,
	id_roles VARCHAR
(20),
	id_Emp VARCHAR
(20),
	PRIMARY KEY
(id),
	FOREIGN KEY
(id_roles)
REFERENCES Roles
(id),
FOREIGN KEY
(id_emp)
REFERENCES Employes
(matricule)
);

CREATE TABLE
IF NOT EXISTS Droits_Roles
(
	id VARCHAR
(50) NOT NULL,
	id_roles VARCHAR
(20),
	id_Droits VARCHAR
(20),
	PRIMARY KEY
(id),
	FOREIGN KEY
(id_roles)
REFERENCES Roles
(id),
FOREIGN KEY
(id_Droits)
REFERENCES Droits
(id)
);

-- Creating Droits

CREATE TABLE
IF NOT EXISTS Droits
(
	id VARCHAR
(50) NOT NULL,
	libelle VARCHAR
(50),
	type VARCHAR
(50),
	PRIMARY KEY
(id)
);

-- Creating Documetns

CREATE TABLE
IF NOT EXISTS Documetns
(
	id VARCHAR
(50) NOT NULL,
	nom VARCHAR
(50)
);

-- Creating Delivery

CREATE TABLE
IF NOT EXISTS Delivery
(
	code VARCHAR
(50) NOT NULL,
	libelle VARCHAR
(50),
	linkDisc VARCHAR
(50)
);


