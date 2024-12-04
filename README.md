# Notes
- H2 is set to persists across SpringBoot restarts currently. This can be modified in `application.properties` file.

# Starting the application
- Run `mvn clean install` or Reload pom.xml dependencies from IntelliJ
- Run the `CryptoTradingSystemV2Application` class
- To view the DB, go to http://localhost:8080/h2-console/login.jsp 
	- Example username and password are found in `application.properties` file

### Useful SQL Commands to query H2 DB

```sql
SELECT * FROM CRYPTO_PRICE;
SELECT * FROM CRYPTO_PRICE order by TIMESTAMP DESC LIMIT 10; 

SELECT * FROM WALLET;
```

```sql
SHOW COLUMNS FROM CRYPTO_PRICE; 
```

![](README_images/h2-console-columns.png)