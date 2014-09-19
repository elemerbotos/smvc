Feature: Logging in to homepage

Scenario: Successfull registration
Given The user is on the homepage
When click on register
And The user tries username: "newBotose"
And password: "1234"
And click on submit
Then the user should be at "http://localhost:8080/login"

Scenario: Registration with already existing username
Given The user is on the homepage
When click on register
And The user tries username: "botose"
And password: "1234"
And click on submit
Then the user gets and alert with message: "Already existing username! Please specify another!"

Scenario: Registration with empty username field
Given The user is on the homepage
When click on register
And password: "1234"
And click on submit
Then the user gets and alert with message: "Password and username can only contain a-Z, 0-9, _, ? !"

Scenario: Registration with empty password field
Given The user is on the homepage
When click on register
And The user tries username: "botose"
And click on submit
Then the user gets and alert with message: "Password and username can only contain a-Z, 0-9, _, ? !"

Scenario: Registration with both fields empty
Given The user is on the homepage
When click on register
And click on submit
Then the user gets and alert with message: "Password and username can only contain a-Z, 0-9, _, ? !"