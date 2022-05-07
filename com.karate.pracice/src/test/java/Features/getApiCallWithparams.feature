Feature: API Call with Query Parameters

 Background:
  	Given url baseUrl + '/public/v2/users'

 Scenario: Get all the user which are active and male
  * def query = {"status" : "active","gender" : "male"}
 	And params query
	When method GET
	Then status 200
	* def actlen = response.length
  * def resp = response
  * match actlen == 20