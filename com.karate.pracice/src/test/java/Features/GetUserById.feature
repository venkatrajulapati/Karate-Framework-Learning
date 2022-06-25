Feature: Verify Get User by ID AP
  
  Background:
  	Given url baseUrl + '/public/v2/users'
  	* print env
  	
	@Regression
  Scenario Outline: Verify Use details
		And path <userId>
		* header Authorization = 'Bearer ' + authToken
		When method GET
		Then status 200
		* print response
		* def jsonResponse = response
		* print jsonResponse
		* def actgender = jsonResponse.gender
		* print actgender
		* def actname = jsonResponse.name
		* print actname
		#* match actname == 'Madhuri Butt DVM'
		#* match actgender == 'female'
		#* match jsonResponse.email contains 'butt'
		#* match jsonResponse.email == "#string"
		#* match jsonResponse.id == "#number"
		* def schema = 
		  """
		  {
		    "gender": "#string",
		    "name": "#string",
		    "id": "#number",
		    "email": "#string",
		    "status": "#string"
  		}
		  """
	  * match response == schema
	
	Examples:
		|userId|
	  |4472  |
	
	
	Scenario: Invalid Userid ---- User Not found
	
		And path 334111
		When method GET
		Then status 404
		* print response
		* def schema = 
		"""
		{
  		"message": "#string"
		}
		"""
		* match response == schema
	
	

