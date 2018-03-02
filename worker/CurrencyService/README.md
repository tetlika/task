This is very simple web service which emulates conversion of currency.

to start:

java -jar build/libs/CurrencyService-0.1.0.jar

to test:

http://localhost:8080/currency?price=123.45

expected output:

{"price":246.9}
