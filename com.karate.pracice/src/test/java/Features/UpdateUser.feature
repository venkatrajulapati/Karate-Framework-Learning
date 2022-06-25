Feature: Update user details

Background:

    * def fakerObj = Java.type("utilities.commonutils");
    * def email = new fakerObj().generateRandomString() + "@gmail.com";
    * print email
    * url baseUrl
  	* def requestPayload = read('classpath:src/test/resources/payloads/createUser.json')
  	* print requestPayload
@Smoke
Scenario: Udate User Details

# Create User with Post Call
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
	And match $.name == "billy"
  And match $.email == email
 
 # Update user with Put Call
  * def userID = $.id
  * print userID
  * def requestUpdatePayload = 
  """
    {
      "status":"inactive",
      "name":"berry"
    }
  """
  Given path '/public/v2/users/' + userID
  And request requestUpdatePayload
  And header Authorization = "Bearer " + authToken
  When method put
  Then status 200
  * match $.status == "inactive"
  * match $.name == "berry"
  
  
  
