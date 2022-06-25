Feature: Validate the Users by its state

 Background:
  	Given url baseUrl + '/public/v2/users'
  	#And header Authorization = 'Bearer ' + authToken
 @Regression
 Scenario Outline: Get all the user which are "<Status>" and "<Gender>"
  * def query = {"status" : "<Status>","gender" : "<Gender>"}
 	And params query
	When method GET
	* def resp = response
	Then status 200
	* print response
	* def actlen = response.length
  * def resp = response
  * match actlen == 20
  * match each response[*].gender == "<Gender>"
  * match each response[*].status == "<Status>"
  
  Examples:
  	|Status|Gender|
  	|active|male  |
  	|active|female|