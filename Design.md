## Framework
Since this is a light weight app, which doesn't require a database, I decided to move forward with Rack

## Solution 
- Threads were used to retrieve posts/tweets from social medias with out waiting for other to complete. 

- Used Recursion to call the api end_point until a valid json is recieved
