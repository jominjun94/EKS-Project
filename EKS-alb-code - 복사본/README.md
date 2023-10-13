# backend

### JDK Version
- jDK 11 이상

### Modify with your MySQL info 
`path` : src/main/resources/config/application.properties
```
spring.datasource.url=jdbc:mysql://YOUR_MYSQL_URL/employee?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=
spring.datasource.password=
spring.jpa.hibernate.ddl-auto=update
```


### MySQL DB 
- Create DB Name : employee
- (생성할 필요 없음) Create Table : employee
- (생성할 필요 없음) Columns : id, email_address, first_name, last_name

```
create database employee;
show databases;
GRANT ALL PRIVILEGES ON employee.* TO root@localhost;
flush privileges;
```

### maven build
```
mvn clean
mvn package
```

### java 
```
java -jar employee-management-backend-0.0.1-SNAPSHOT.jar
```

