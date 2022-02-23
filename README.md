# README

Versions:-
   Ruby:- 2.7.2
   Rails:-  6.1.4.4
   
Install and run instruction:-
 -bundle install
 -rails db:create,rails db:migrate
 -rails s
 
Description:
  -Implement social login(google,facebook,twitter,linkedin,github)
  
Details:-
   Google:-
       -Used omni-auth gem for authorization.
       -onclick connectwithgoogle asked for google details and redirect back to app with details.
       -We save related details to database.
     Requirement:-
       -Need to create credentials for web and allow domain and set redirect url.
       -Here is url for create credentials:-https://console.cloud.google.com/apis/credentials?project=local-alignment-334007
       
 facebook:-
       -Used omni-auth gem for authorization.
       -onclick connectwithfacebook asked for facebook details and redirect back to app with details.
       -We save related details to database.
     Requirement:-
       -Need to create App allow domain and set redirect url.
       -Need to get keys and set in configuration file.
       -Here is url for create app:-https://developers.facebook.com/apps
       
 twitter:-
       -Used omni-auth gem for authorization.
       -onclick connectwithtwitter asked for twitter details and redirect back to app with details.
       -We save related details to database.
     Requirement:-
       -Need to create App allow domain and set redirect url.
       -Need to get keys and set in configuration file.
       -Here is url for create app:-https://developer.twitter.com/en/portal/projects/1
       
 linkedin:-
       -Used omni-auth gem for authorization.
       -onclick connectwithlinkedin asked for linkedin details and redirect back to app with details.
       -We save related details to database.
     Requirement:-
       -Need to create App allow domain and set redirect url.
       -Need to get keys and set in configuration file.
       -Here is url for create app:-https://www.linkedin.com/developers/apps/134547296/auth
       
github:-
       -Used omni-auth gem for authorization.
       -onclick connectwithgithub asked for github details and redirect back to app with details.
       -We save related details to database.
     Requirement:-
       -Need to create App allow domain and set redirect url.
       -Need to get keys and set in configuration file.
       -Here is url for create app:-https://github.com/settings/developers
 
