#Myhub#

##Description##

Complete a sinatra app for displaying github issues assigned to you as described here.
myhub

Make a basic interface to your open issues on github repo.

Accessing the site root should display the github issues assigned to you along with a button to toggle whether they are open or closed.

##Objectives##

After completing this, you should ...

Be comfortable integrating information from an external API into your controllers
Be able to build a basic form
Understand the place of views in a web app
Performance Objectives

Be able to use forms to make requests in the browser
Understand how to use *ERB* templates
Details


##Requirements##

Add wrappers for any needed Github API calls to the `lib/myhub/github.rb` class.

Use your Github API wrapper to retrieve issues assigned to you from the assignments repo.

Make a request for the homepage ```(GET '/')``` retrieve your issues and pass the to an ERB template for display.

The template should include a button to close or reopen each issue, based on its present state.
