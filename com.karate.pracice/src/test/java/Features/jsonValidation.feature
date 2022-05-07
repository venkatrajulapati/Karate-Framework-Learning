Feature: Read the Values from Json Object and Json array

Scenario: read Values from Json Array

* def jsonObject = 
"""
[
{
  "name" : "Ranga",
  "city" : "Bangalore",
  "age"  : "37"
},
{
  "name" : "Rao",
  "city" : "Bangalore",
  "age"  : "36",
  "nicknames" : ["Ranga","Rao","Rajulapati"]
}
]
	  
"""
* print jsonObject
* print jsonObject[0]
* print jsonObject[0].name
* print jsonObject[1].name
* print jsonObject[1].nicknames[2]