#Run the Polymer shop app with HTTP 2.0 and server push
This repo contains a Vagrantfile that sets up an Apache server with HTTP 2.0 and server push. It runs the Polymer shop app by default.

##Running the code

```
vagrant up
```
After Vagrant has finished booting go to *https://localhost:4433* in your host browser to see the app.

##Setup

The Apache config is stored in *000-default.conf*. This is copied over the top of the default one after Apache installation.

##TODO

* Make the polymer-cli tool install properly
* Remove the pre-built html from repo
* Generate the Apache config from polymer-cli