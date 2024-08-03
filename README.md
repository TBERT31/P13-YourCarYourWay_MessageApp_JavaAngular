[![forthebadge](https://forthebadge.com/images/badges/cc-0.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-javascript.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-java.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

# PROJECT - YOUR CAR YOUR WAY (YCYW)

## Start the frontend

The frontend of this project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 16.2.0.

1. **Git clone:**

    ```sh
    git clone https://github.com/TBERT31/P13-YourCarYourWay
    ```

2. **Go inside folder:**

    ```sh
    cd front
    ```

3. **Install dependencies:**

    ```sh
    npm install
    ```

4. **Development server:**

> Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

5. **Build**

> Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Start the backend

The backend of this project is built with Java version 17 and Spring Boot version 3.3.2.

### Prerequisites

- [Java JDK 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html) or later
- [Maven](https://maven.apache.org/download.cgi)
- [MySQL](https://dev.mysql.com/downloads/installer/) or [XAMPP](https://www.apachefriends.org/index.html)

### MySQL Setup

1. **Install MySQL or XAMPP:**

    - **MySQL:** Download and install from [here](https://dev.mysql.com/downloads/installer/).
    - **XAMPP:** Download and install from [here](https://www.apachefriends.org/index.html).

2. **Create the database:**

    - If using MySQL, open MySQL Workbench and create a new schema.
    - If using XAMPP, start the Apache and MySQL modules from the XAMPP Control Panel and use phpMyAdmin to create a new database.

3. **Run the SQL script:**

    The SQL script to create the schema is available at `ressources/sql/your_car_your_way.sql`.

    ```sh
    mysql -u your_username -p your_car_your_way < ressources/sql/your_car_your_way.sql
    ```

### Running the backend

1. **(If you haven't already done so) Clone the repository:**

    ```sh
    git clone https://github.com/TBERT31/P13-YourCarYourWay
    ```

2. **Go inside the backend folder:**

    ```sh
    cd back
    ```

3. **Configure the application properties:**

    Open `src/main/resources/application.yml` and configure the following properties with your MySQL database details:

    ```properties
    spring:
		application:
			name: back
		datasource:
			url: jdbc:mysql://${APP_DB_HOST}:${APP_DB_PORT}/${APP_DB_NAME}?allowPublicKeyRetrieval=true
			username: ${APP_DB_USER}
			password: ${APP_DB_PASS}
		jpa:
			hibernate:
				ddl-auto: update
				naming:
					physical-strategy: org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
			show-sql: true
	security:
		jwt:
			jwtSecret: ${APP_JWT_SECRET}
			jwtExpirationMs: ${APP_JWT_EXPIRATION_MS}
	server:
		port: ${APP_PORT}
    ```

	IMPORTANT: preferably change ${APP_PORT} to 8080 and ${APP_DB_PORT} to 3306, otherwise make the necessary DB and frontend configurations to plug everything in.

4. **Install dependencies and run the application:**

    ```sh
    mvn clean install
    mvn spring-boot:run
    ```

    The backend server will start on `http://localhost:8080`.

5. **API documentation**

> Once the application has started, you can access and analyze the Swagger documentation by navigating to: `http://localhost:8080/swagger-ui/index.html`.


## Resources

### Postman collection

For Postman import the collection:

> ressources/postman/YourCarYourWay.postman_collection.json

by following the documentation:

[Importing Data into Postman](https://learning.postman.com/docs/getting-started/importing-and-exporting-data/#importing-data-into-postman)


## Try App

All users have been registered with the password: `Test!1234`, I'll let you browse the app to find out how it works.


## Authors

Main developer: Thomas Berteau
