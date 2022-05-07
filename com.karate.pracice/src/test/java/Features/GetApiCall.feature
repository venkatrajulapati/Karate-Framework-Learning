Feature: Verify User details feature
  
  Background:
  	Given url baseUrl + '/public/v2/users'
		
  Scenario: Get User details
	
	And path 3341
	When method GET
	Then status 200
	* print response
	* def jsonResponse = response
	* print jsonResponse
	* def actgender = jsonResponse.gender
	* print actgender
	* def actname = jsonResponse.name
	* print actname
	* match actname == 'Bala Acharya'
	* match actgender == 'female'
	
	Scenario: Invalid Userid ---- User Not found
	
		And path 334111
		When method GET
		Then status 404
		* print response
	

