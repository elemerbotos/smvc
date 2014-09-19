$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("com/epam/cooking/login.feature");
formatter.feature({
  "id": "logging-in-to-homepage",
  "description": "",
  "name": "Logging in to homepage",
  "keyword": "Feature",
  "line": 1
});
formatter.before({
  "duration": 1350857388,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;correct-login-data-should-be-accepted-by-the-homepage",
  "description": "",
  "name": "Correct login data should be accepted by the homepage",
  "keyword": "Scenario",
  "line": 3,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 4
});
formatter.step({
  "name": "The user tries username: \"botose\"",
  "keyword": "When ",
  "line": 5
});
formatter.step({
  "name": "password: \"1234\"",
  "keyword": "And ",
  "line": 6
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 7
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/\"",
  "keyword": "Then ",
  "line": 8
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 1104552935,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "botose",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 118997100,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1234",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 64741206,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 534054334,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 11001335,
  "status": "passed"
});
formatter.after({
  "duration": 1115702439,
  "status": "passed"
});
formatter.before({
  "duration": 1535808621,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;wrong-login-password,-login-should-be-declined",
  "description": "",
  "name": "Wrong login password, login should be declined",
  "keyword": "Scenario",
  "line": 10,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 11
});
formatter.step({
  "name": "The user tries username: \"botose\"",
  "keyword": "When ",
  "line": 12
});
formatter.step({
  "name": "password: \"123456\"",
  "keyword": "And ",
  "line": 13
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 14
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 15
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 601065850,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "botose",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 99313487,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "123456",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 70390202,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 135409464,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 8828200,
  "status": "passed"
});
formatter.after({
  "duration": 1097090000,
  "status": "passed"
});
formatter.before({
  "duration": 953922547,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;wrong-login-username,-login-should-be-declined",
  "description": "",
  "name": "Wrong login username, login should be declined",
  "keyword": "Scenario",
  "line": 17,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 18
});
formatter.step({
  "name": "The user tries username: \"booe\"",
  "keyword": "When ",
  "line": 19
});
formatter.step({
  "name": "password: \"1234\"",
  "keyword": "And ",
  "line": 20
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 21
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 22
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 728076865,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "booe",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 110104436,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1234",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 64644351,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 106740503,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 7663700,
  "status": "passed"
});
formatter.after({
  "duration": 1083400789,
  "status": "passed"
});
formatter.before({
  "duration": 1580878080,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;wrong-login-empty-username,-login-should-be-declined",
  "description": "",
  "name": "Wrong login empty username, login should be declined",
  "keyword": "Scenario",
  "line": 24,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 25
});
formatter.step({
  "name": "password: \"1234\"",
  "keyword": "When ",
  "line": 26
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 27
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 28
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 685853392,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1234",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 113155677,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 156111333,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 8063306,
  "status": "passed"
});
formatter.after({
  "duration": 1083136203,
  "status": "passed"
});
formatter.before({
  "duration": 832912668,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;wrong-login-empty-password,-login-should-be-declined",
  "description": "",
  "name": "Wrong login empty password, login should be declined",
  "keyword": "Scenario",
  "line": 30,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 31
});
formatter.step({
  "name": "The user tries username: \"botose\"",
  "keyword": "When ",
  "line": 32
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 33
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 34
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 887515891,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "botose",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 112650557,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 136043188,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 7650551,
  "status": "passed"
});
formatter.after({
  "duration": 1086178785,
  "status": "passed"
});
formatter.before({
  "duration": 1602529252,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;wrong-login,-empty-fields,-login-should-be-declined",
  "description": "",
  "name": "Wrong login, empty fields, login should be declined",
  "keyword": "Scenario",
  "line": 36,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 37
});
formatter.step({
  "name": "click on submit",
  "keyword": "When ",
  "line": 38
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 39
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 503420699,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 139181341,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 7559149,
  "status": "passed"
});
formatter.after({
  "duration": 1091204961,
  "status": "passed"
});
formatter.uri("com/epam/cooking/registration.feature");
formatter.feature({
  "id": "logging-in-to-homepage",
  "description": "",
  "name": "Logging in to homepage",
  "keyword": "Feature",
  "line": 1
});
formatter.before({
  "duration": 1534733919,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;successfull-registration",
  "description": "",
  "name": "Successfull registration",
  "keyword": "Scenario",
  "line": 3,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 4
});
formatter.step({
  "name": "click on register",
  "keyword": "When ",
  "line": 5
});
formatter.step({
  "name": "The user tries username: \"newBotose\"",
  "keyword": "And ",
  "line": 6
});
formatter.step({
  "name": "password: \"1234\"",
  "keyword": "And ",
  "line": 7
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 8
});
formatter.step({
  "name": "the user should be at \"http://localhost:8080/login\"",
  "keyword": "Then ",
  "line": 9
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 591086298,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.click_on_register()"
});
formatter.result({
  "duration": 532748721,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "newBotose",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 73899096,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1234",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 64519274,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
formatter.result({
  "duration": 91068017,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "http://localhost:8080/login",
      "offset": 23
    }
  ],
  "location": "HomeTest.the_user_should_be_at(String)"
});
formatter.result({
  "duration": 3127249,
  "status": "failed",
  "error_message": "org.openqa.selenium.UnhandledAlertException: unexpected alert open\n  (Session info: chrome\u003d37.0.2062.120)\n  (Driver info: chromedriver\u003d2.10.267521,platform\u003dWindows NT 6.1 SP1 x86_64) (WARNING: The server did not provide any stacktrace information)\nCommand duration or timeout: 2 milliseconds: null\nBuild info: version: \u00272.42.2\u0027, revision: \u00276a6995d31c7c56c340d6f45a76976d43506cd6cc\u0027, time: \u00272014-06-03 10:52:47\u0027\nSystem info: host: \u0027EPHUBUDW0543\u0027, ip: \u002710.0.13.36\u0027, os.name: \u0027Windows 7\u0027, os.arch: \u0027amd64\u0027, os.version: \u00276.1\u0027, java.version: \u00271.7.0_55\u0027\nSession ID: dfa47efe09cd93904320a970b782e9f3\nDriver info: org.openqa.selenium.chrome.ChromeDriver\nCapabilities [{platform\u003dXP, acceptSslCerts\u003dtrue, javascriptEnabled\u003dtrue, browserName\u003dchrome, chrome\u003d{userDataDir\u003dC:\\Users\\elemer_botos\\AppData\\Local\\Temp\\scoped_dir2644_4070}, rotatable\u003dfalse, locationContextEnabled\u003dtrue, version\u003d37.0.2062.120, takesHeapSnapshot\u003dtrue, cssSelectorsEnabled\u003dtrue, databaseEnabled\u003dfalse, handlesAlerts\u003dtrue, browserConnectionEnabled\u003dfalse, nativeEvents\u003dtrue, webStorageEnabled\u003dtrue, applicationCacheEnabled\u003dfalse, takesScreenshot\u003dtrue}]\r\n\tat sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\r\n\tat sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)\r\n\tat sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\r\n\tat java.lang.reflect.Constructor.newInstance(Constructor.java:526)\r\n\tat org.openqa.selenium.remote.ErrorHandler.createThrowable(ErrorHandler.java:204)\r\n\tat org.openqa.selenium.remote.ErrorHandler.throwIfResponseFailed(ErrorHandler.java:162)\r\n\tat org.openqa.selenium.remote.RemoteWebDriver.execute(RemoteWebDriver.java:599)\r\n\tat org.openqa.selenium.remote.RemoteWebDriver.execute(RemoteWebDriver.java:614)\r\n\tat org.openqa.selenium.remote.RemoteWebDriver.getCurrentUrl(RemoteWebDriver.java:319)\r\n\tat com.epam.cooking.HomeTest.the_user_should_be_at(HomeTest.java:55)\r\n\tat ✽.Then the user should be at \"http://localhost:8080/login\"(com/epam/cooking/registration.feature:9)\r\n"
});
formatter.after({
  "duration": 1089786137,
  "status": "passed"
});
formatter.before({
  "duration": 1493224989,
  "status": "passed"
});
formatter.scenario({
  "id": "logging-in-to-homepage;registration-with-already-existing-username",
  "description": "",
  "name": "Registration with already existing username",
  "keyword": "Scenario",
  "line": 11,
  "type": "scenario"
});
formatter.step({
  "name": "The user is on the homepage",
  "keyword": "Given ",
  "line": 12
});
formatter.step({
  "name": "click on register",
  "keyword": "When ",
  "line": 13
});
formatter.step({
  "name": "The user tries username: \"botose\"",
  "keyword": "And ",
  "line": 14
});
formatter.step({
  "name": "password: \"1234\"",
  "keyword": "And ",
  "line": 15
});
formatter.step({
  "name": "click on submit",
  "keyword": "And ",
  "line": 16
});
formatter.step({
  "name": "the user gets and alert with message: \"Already existing username! Please specify another!\"",
  "keyword": "Then ",
  "line": 17
});
formatter.match({
  "location": "HomeTest.The_user_is_on_the_homepage()"
});
formatter.result({
  "duration": 611083886,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.click_on_register()"
});
formatter.result({
  "duration": 381657792,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "botose",
      "offset": 26
    }
  ],
  "location": "HomeTest.The_user_tries_username(String)"
});
formatter.result({
  "duration": 68722828,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1234",
      "offset": 11
    }
  ],
  "location": "HomeTest.password(String)"
});
formatter.result({
  "duration": 63679012,
  "status": "passed"
});
formatter.match({
  "location": "HomeTest.and_clicks_on_submit()"
});
