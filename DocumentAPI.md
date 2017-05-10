#Document API

##JSON Objects returned by API:

### Users (for authentication)

```javascript

	{
	  "user": {
	    "id": "1",
	    "email": "tnkttruong@gmail.com",
	    "first_name": "Truong",
	    "last_name": "Cong Trang",
	    "role": 1,
	    "avatar": "avatar.png",
	    "birthday": 21/11/1994,
	    "sex": 1
	  }
	}

```

###Profile

```javascript

	{
	  "user": {
	    "id": "1",
	    "email": "tnkttruong@gmail.com",
	    "first_name": "Truong",
	    "last_name": "Cong Trang",
	    "role": 1,
	    "avatar": "avatar.png",
	    "birthday": 21/11/1994,
	    "sex": 1,
	    "following": true
	  }
}

```

###List_users

	{
	  "users": [
		  {
		    "id": "1",
		    "email": "tnkttruong@gmail.com",
		    "first_name": "Truong",
		    "last_name": "Cong Trang",
		    "role": 1,
		    "avatar": "avatar.png",
		    "birthday": 21/11/1994,
		    "sex": 1,
		  },
		{
		    "id": "2",
		    "email": "trangnguyen@gmail.com",
		    "first_name": "Nguyen",
		    "last_name": "Thi Trang",
		    "role": 1,
		    "avatar": "avatar.png",
		    "birthday": 21/11/1994,
		    "sex": 0,
		  }
		]	
	}

###Categories

	{
		"categories": 
			[
				{
					"id": 1,
					"name": "sport"
				},
				{
					"id": 2,
					"name": "social"
				}
			]
	}

### Category
	{
		"category": 
				{
					"id": 1,
					"name": "sport"
				}
	}

### Comment
	{
		"comment":
			{
				"id": 1,
				"article_id": 1,
				"user":{
					"id": 1,
					"email": "tnkttruong@gmail.com",
					"first_name": "Truong",
					"last_name": "Cong Trang",
					"avatar": "avatar.png"
				},
				"created_at": "09/05/2017 10:00:00",
				"updated_at": "09/05/2017 10:00:00",
				"content": "hello"
			}
	}
###Comments

	{
		"comments": 
			[
				{
					"id": 1,
					"article_id": 1,
					"user":{
						"id": 1,
						"first_name": "Truong",
						"last_name": "Cong Trang",
						"email": "tnkttruong@gmail.com",
						"avatar": "avatar.png"
					},
					"created_at": "09/05/2017 10:00:00",
					"updated_at": "09/05/2017 10:00:00",
					"content": "hello"
				},
				{
					"id": 2,
					"article_id": 1,
					"user":{
						"id": 2,
						"first_name": "Truong",
						"last_name": "Cong Trang",
						"email": "trangnguyen@gmail.com",
						"avatar": "avatar.png"
					},
					"created_at": "09/05/2017 10:00:00",
					"updated_at": "09/05/2017 10:00:00",
					"content": "hellu"
				}
				
			]
	}


###Tags

	{
	  "tags": [
	    "sport",
	    "football"
	  ]
	}

### Article

	{
		"article": 
		{
			"id": 1,
			"name": "introduce myself",
			"description": "About my life",
			"detail": "hello, my name is Tnkt",
			"created_at": "09/05/2017 10:00:00",
			"updated_at": "09/05/2017 10:00:00",
			"picture": "picture.png",
			"category":{
				"id": 1,
				"name": "sport"
			},
			"user":{
				"id": 2,
				"first_name": "Truong",
				"last_name": "Cong Trang",
				"email": "trangnguyen@gmail.com",
				"avatar": "avatar.png",
				"following": true
			}
			"favorited": false,
			"favorites_count": 1
		}
	}

###Articles

	{
		"articles":
			[
				{
					"id": 1,
					"name": "introduce myself",
					"description": "About my life",
					"detail": "hello, my name is Tnkt",
					"created_at": "09/05/2017 10:00:00",
					"updated_at": "09/05/2017 10:00:00",
					"picture": "picture.png",
					"category":{
						"id": 1,
						"name": "sport"
					},
					"user":{
						"id": 2,
						"first_name": "Truong",
						"last_name": "Cong Trang",
						"email": "trangnguyen@gmail.com",
						"avatar": "avatar.png",
						"following": true,
					},
					"favorited": false,
					"favorites_count": 1
				},
				{
					"id": 2,
					"name": "introduce myself",
					"description": "About my life",
					"detail": "hello, my name is Tnkt",
					"created_at": "09/05/2017 10:00:00",
					"updated_at": "09/05/2017 10:00:00",
					"picture": "picture.png",
					"category":{
						"id": 1,
						"name": "sport"
					},
					"user":{
						"id": 2,
						"first_name": "Truong",
						"last_name": "Cong Trang",
						"email": "trangnguyen@gmail.com",
						"avatar": "avatar.png",
						"following": true,
					},
					"favorited": false,
					"favorites_count": 1
				}
			]
	}
	
##Endpoints:

### Sign up

- Url: /signup
- Method: POST
- URL Params:
- Data Params:

```javascript

{
	"user": {
	    "email": "tnkttruong@gmail.com",
	    "password": "12345",
	    "password_confirmation": "12345",
	    "first_name": "Truong",
	    "last_name": "Cong Trang",
	    "avatar": "avatar.png",
	    "birthday": 21/11/1994,
	    "sex": 1
	  }
}

```

###Login

- Url: /login
- Method: POST
- URL Params:
- Data Params:

```javascript
	{
		"user":{
			"email": "tnkttruong@gmail.com",
			"password": "12345",
		}
	
```

###update user

- Url: /users/id
- Method: PUT
- URL Params: {id: integer}
- Data Params:

```javascript
	{
		"user":{
			"email": "tnkttruong@gmail.com",
		    "password": "12345",
		    "password_confirmation": "12345",
		    "first_name": "Truong",
		    "last_name": "Cong Trang",
		    "avatar": "avatar.png",
		    "birthday": 21/11/1994,
		    "sex": 1
		}
	
```


###update category

- Url: /categories/id
- Method: PUT
- URL Params: {id: integer}
- Data Params:

```javascript
	{
		"category":{
			"name": "travels",
		}
	
```


###search

- Url: /search
- Method: GET
- URL Params: {keyword: string}
- Data Params:


###favorited

- Url: /favorites
- Method: POST
- URL Params:
- Data Params:

```javascript

$.ajax({
  url: "/favorites",
  dataType: "json",
  data : { 
    favorite: { 
      user_id : 1,
      article_id: 1
    }
  },
  type : "POST",
  success : function(r) {
    console.log(r);
  }
});
	
```

###follow

- Url: /followes
- Method: POST
- URL Params:
- Data Params:

```javascript

$.ajax({
  url: "/followes",
  dataType: "json",
  data : { 
    favorite: { 
      follower_user_id : 1,
      followed_user_id: 1
    }
  },
  type : "POST",
  success : function(r) {
    console.log(r);
  }
});
	
```

###update comment

- Url: /comments/id
- Method: PUT
- URL Params: {id: integer}
- Data Params:

```javascript
	
	{
		"comment":{
			"content": "oh my got"
		}
	}

```

###update article

- Url: /articles/id
- Method: PUT
- URL Params: {id: integer}
- Data Params:

```javascript

	"article":{
			"name": "introduce myself",
			"description": "About my life",
			"detail": "hello, my name is Tnkt",
			"created_at": "09/05/2017 11:29:00",
			"updated_at": "09/05/2017 10:29:00",
			"picture": "picture.png",
			"category_id": 1
	}	

```







