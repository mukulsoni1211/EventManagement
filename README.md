# EventManagement System


## PreRequistics:-
	* ruby 2.7.6
	* redis-server


### To install and use ruby, run these commands:-
	You can install ruby from any source but we are using rvm to install ruby.
   ```  
   		$ rvm install 2.7.6
   		$ rvm use 2.7.6 
   	```

###  To install redis-server
	```
		$ sudo apt update
		$ sudo apt install redis-server
	```


# you can take a clone of this EventManagement system.
	``` $ git clone https://github.com/mukulsoni1211/EventManagement```

Now, go to the application's repository:-
	``` cd EventManagement ```

Now run these commands to configure the application;-
	* setup the database- 
	  ``` $ rails db:create
	  	  $ rails db:migrate
	  	  $ rails db:seed```

    * then you can start the server
     ``` $ rails s```



Our points:-
  * We are using a sqllite database as it is a test task but sqllite is not good to create scalable application. We should use PSQL or MYSQL database.

  * As this is a EventManagement System, There is two type of users (1) EventOrganizer (2) Customer.
    
    There should be some APIs for EventOrganizer:-

      *  EventOrganizer should be able to fetch customers who is being coming in event.
      *  EventOrganizer should be able to fetch only his/her's events.

	There should be some APIs for Customer:-

	 * Customer should be able to fetch only upcoming/all events which he/she has booked.

  * We can soft-destroy the events and users.
  