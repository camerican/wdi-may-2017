# Blog Test

### Starter Code

```
rails new blog-test
cd blog-test
rails g scaffold user fname:string lname:string email:string password:string
rails g scaffold post title:string body:text user:belongs_to
rails g scaffold comment body:string user:belongs_to post:belongs_to
subl .
```