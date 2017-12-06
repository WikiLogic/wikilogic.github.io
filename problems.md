# Problems

_Set up / local environment issues and hopefully the steps to resolve them._

**It won't let me sign up / log in**: Currently the API is only set up to allow certain emails to sign up. To add your email to this list on local, go into the API repo/guestlist.js and add your email to the people array. If guestlist.js doesn't exist, use the guestlist-example.js as a template. Note that the 2 test emails are required for the testing to run so they will need to be in your guestlist.js file as well. To help debug you can click on the users collection through the [db interface](http://localhost:8529/_db/wl_dev/_admin/aardvark/index.html#collections) when it's running locally.

**Issues with shared drives**. Go into your settings for docker and enable it.

**File updates not triggering webpack / nodemon**. On Windows or OSX, due to the docker host being inside a Virtualbox VM, FS events are not supported (by Virtualbox). Webpack has been set to polling and nodemon has been set to it's legacy watcher (also polling). Check that these polling options are still set.

**File updates are not being served by nginx**. The production build turns on some caching goodness and nginx's `sendfile`. Turns out `sendfile` doesn't play well with the VM (not sure of the reaons, add them here / link to a stackoverflow if you know!). So these have both been turned off in nginx.dev.conf. Check they're still off.

**Docker won't build** (eg `readdirent: not a directory`): stop the containers, clear out your images, run the build again. If that doesn't work, submit an issue and we'll try and get it worked out.

_Any more problems that you're stuck on, open an issue here https://github.com/WikiLogic/wikilogic.github.io/issues - we want to help! Even if you had a problem which you managed to resolve, we would still welcome an issue - it might help someone else._