Feature: Logging in to homepage
 
Scenario: Correct login data should be accepted by the homepage
Given The user is on the homepage
When The user tries username: "botose"
And password: "1234"
And click on submit
Then the user should be at "http://localhost:8080/"

Scenario: Wrong login password, login should be declined
Given The user is on the homepage
When The user tries username: "botose"
And password: "123456"
And click on submit
Then the user should be at "http://localhost:8080/login"

Scenario: Wrong login username, login should be declined
Given The user is on the homepage
When The user tries username: "booe"
And password: "1234"
And click on submit
Then the user should be at "http://localhost:8080/login"

Scenario: Wrong login empty username, login should be declined
Given The user is on the homepage
When password: "1234"
And click on submit
Then the user should be at "http://localhost:8080/login"

Scenario: Wrong login empty password, login should be declined
Given The user is on the homepage
When The user tries username: "botose"
And click on submit
Then the user should be at "http://localhost:8080/login"

Scenario: Wrong login, empty fields, login should be declined
Given The user is on the homepage
When click on submit
Then the user should be at "http://localhost:8080/login"