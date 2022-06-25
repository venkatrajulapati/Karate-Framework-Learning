Feature: Delete User Feature

Background:

    * def fakerObj = Java.type("utilities.commonutils");
    * def email = new fakerObj().generateRandomString() + "@gmail.com";
    * print email
    * url baseUrl
  	* def requestPayload = read('classpath:src/test/resources/payloads/createUser.json')
  	* print requestPayload
@Regression  	
Scenario: Delete User Details

# Create User with Post Call
	Given path '/public/v2/users'
	And request requestPayload
	And header Authorization = 'Bearer ' + authToken
	When method post
	Then status 201
	* print response
	And match $.name == "billy"
  And match $.email == "#(email)"
 
 # Delete user with Delete Call
  * def userID = $.id
  * print userID
  Given path '/public/v2/users/' + userID
  And header Authorization = "Bearer " + authToken
  When method delete
  Then status 204
 # Get user with Get Call
  Given path '/public/v2/users/' + userID
  And header Authorization = "Bearer " + authToken
  When method get
  Then status 404
  * match $.message == "Resource not found"
 
  
  
  
