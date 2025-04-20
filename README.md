# 📦 Product API

A Spring Boot REST API built with **Java 17** and **Gradle** to manage products using CRUD operations. It uses an in-memory H2 database and is testable via Postman or cURL.

---

## 🧰 Tech Stack

- Java 17
- Spring Boot
- Spring Data JPA
- H2 Database
- Gradle
- Postman / cURL

---

## 🛠️ How to Run the Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/shrishti83340/edstruments-assesment.git
   cd edstruments-assesment
   

//Build the project using Gradle

./gradlew build

// Run the application
./gradlew bootRun

The application will start at:
http://localhost:8080

if 8080 port is already in used then use below command

    lsof -i :8080 //This will list the process using port 8080. The PID will be in the second column.
    kill -9 12345

application.properties (already configured)

spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=

spring.h2.console.enabled=true
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update


H2 Console: http://localhost:8080/h2-console
JDBC URL: jdbc:h2:mem:testdb

API Endpoints

Get All Products
curl http://localhost:8080/api/products

Get Product by ID

curl http://localhost:8080/api/products/1

Create Product

curl -X POST http://localhost:8080/api/products \
-H "Content-Type: application/json" \
-d '{"name":"Book","description":"Smartphone","price":699.99}'

Update Product
curl -X PUT http://localhost:8080/api/products/1 \
-H "Content-Type: application/json" \
-d '{"name":"Phone","description":"Android Tablet","price":399.99}'

Delete Product
curl -X DELETE http://localhost:8080/api/products/1