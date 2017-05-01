# README

Given user is registered.
Get token by sending a POST request to http://localhost:3000/api/v1/users
With Content-Type application/vnd.api+json and Authorization Bearer your_token_here

Update user
{
   "data": {
		"type": "users",
		"id": "2",
       	"attributes": {
        	"email": "test02@test.com",
            "password": "123456"
       }
   }
}