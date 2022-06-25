Feature: Authorization token feature


Scenario: Add bearr Token from config

Given header Authorization = 'Bearer ' + authToken
Given url baseUrl + '/public/v2/users'
When method GET
Then status 200


