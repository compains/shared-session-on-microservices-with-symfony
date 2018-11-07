# Description

Project to test user authentication on an aplication based on microservices using Symony.

# Usage

Clone the repo to the desired location

cd path-to-project

 cd app1 && composer install
 
 cd ..
 
 cd app2 && composer install 
 
 cd ..
 
 docker-compose -f docker/docker-compose.yml up -d
 
 update App1/.env with
 DATABASE_URL=mysql://root:password@mysql:3306/db
 
 docker exec docker_app1_1 /usr/local/bin/php bin/console doctrine:database:create
 
 docker exec docker_app1_1 /usr/local/bin/php bin/console doctrine:migrations:migrate
 
 Create user directly in database 
 
 ```sql
 INSERT INTO `user` (`id`, `email`, `password`)
 VALUES
  (1, 'admin@test.com','$argon2i$v=19$m=1024,t=2,p=2$TWJpUkV4VEJaOUtxU1BQbg$dGjMHDzlybtrTmbk5zQJfeGvDZLVtejf+TpB+2YHVCQ');
 ```
 Add Roles
 ```sql
 UPDATE user set roles='["ROLE_ADMIN"]' where id = 1
  ```
  
  Go to http://localhost:90/login and login with admin@test.com and 1234
  
  Test that you can access to 
  * /user-profile
  * /app2-test-user
  
  then logout visiting /logout and check that you __can't__ access to previous url's.
  