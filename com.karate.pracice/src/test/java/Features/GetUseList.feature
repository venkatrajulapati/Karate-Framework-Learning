Feature: Verify User details feature
  
  Background:
  	Given url baseUrl
  	And header Authorization = 'Bearer ' + authToken
  	* print env
  	* def scheema = 
  	"""
  	 {
	    "gender": "#string",
	    "name": "#string",
	    "id": "#number",
	    "email": "#string",
	    "status": "#string"
     }
  	"""
	@Smoke	
  Scenario: Validate the Get use List 
	
	And path "/public/v2/users"
	When method GET
	Then status 200
	* print response
	* match response == "#array"
	* match each response[*] == scheema
	
	Scenario: Validate the Get use List with invalid path
	
	And path "/public/v2/user"
	When method GET
	Then status 404
	
	
	
	

