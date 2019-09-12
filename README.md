# Funbook 

> The facebook clone built in Ruby on Rails by remote pair programming.
![Screen Shot](./app/assets/images/funbook.png)



## Summary
<hr/>
Full stack social app built in Ruby on Rails framework. <br/>
Current version supports:

- signing user up
- posting the content in the form of the text or an image
- liking and commenting the posts
- adding users as friends 

__Working version of app you can find on [Funbook](https://mighty-earth-63985.herokuapp.com/users/sign_in)__. Deployed version runs on [heroku](https://www.heroku.com/) platform and is using [AWS S3](https://aws.amazon.com/s3/) as storage.

## Getting started
<hr/>

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes. 

## Prerequisites

This project runs with Ruby and RVM. If you don't have those installed, follow this [guide](https://rvm.io/rvm/install).

After installation, run `ruby -v` to make sure Ruby installed correctly.
```
$ ruby -v
> 2.6.3
```

Also make sure that RVM is installed by running `rvm -v`.

```
$ rvm -v
> 1.29.9
```

## Installations

Run &nbsp; `bundle install` to install all project gems.

## Database Setup

Run &nbsp; `rails db:migrate` to setup database and tables.

## Serve project

Start the application with the following command:

```
rails s
```
## Future Features
- Implement React as front-end
- Setup Docker image
- Sending and receiving messages 
- Mailer with notifications

## Authors: 
- [Zlaya](https://github.com/zlayabekrija) and [Inzi](https://github.com/inhaq)




