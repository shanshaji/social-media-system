## Installation

Install the dependencies and start the server.

```sh
cd social-media-stadium-goods
bundle install
bundle exec rackup
```

## To Run Tests

```sh
rspec specs/
```
## How To Test


```sh
curl localhost:9292 --header 'Authorization: Basic OnBhc3N3b3Jk'
```
##### or
* Create a get request using postman http://localhost:9292/
* Use basic auth from authorization and add password as `password`