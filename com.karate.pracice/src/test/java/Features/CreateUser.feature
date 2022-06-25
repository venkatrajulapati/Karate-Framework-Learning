Feature: Create user Feature

  Background: 
    * def fakerObj = Java.type("utilities.commonutils");
    * def email = new fakerObj().generateRandomString() + "@gmail.com";
    * print email
    * url baseUrl
  	* def requestPayload = karate.read('classpath:src/test/resources/payloads/createUser.json')
  	* print requestPayload
  @Smoke
  Scenario: Validat create the user
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + authToken
    When method post
    Then status 201
    * print response
    And match $.id == "#present"
    And match $.name == "#present"
    And match $.email == "#present"
    And match $.gender == "#present"
    And match $.status == "#present"
    And match $.id == "#number"
    And match $.name == "#string"
    And match $.email == "#string"
    And match $.gender == "#string"
    And match $.status == "#string"
    And match $.email == email
    * def UserID = $.id
    Given path '/public/v2/users/' + UserID
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
