var metalsmith = require('metalsmith'),
    markdown = require('metalsmith-markdown'),
    templates  = require('metalsmith-templates'),
    permalinks = require('metalsmith-permalinks'),
    navigation = require('metalsmith-navigation');


/* nav settings: https://github.com/unstoppablecarl/metalsmith-navigation
--------------------------------------------------*/
var navConfigs = {
    primary:{
        sortBy: 'nav_sort',
        filterProperty: 'nav_groups',
        includeDirs: true

    },
    footer: {
        sortBy: 'nav_sort',
        filterProperty: 'nav_groups',
        includeDirs: true

    }
};
var navSettings = {
    navListProperty: 'navs',
    permalinks: true,
};

var navTask = navigation(navConfigs, navSettings);

/* The docs site
------------------------------------------------------------*/

var docsBuild = metalsmith(__dirname)
  .metadata({
    site: {
      title: 'WikiLogic Docs',
      url: 'http://wikilogic.github.io/docs/'
    }
  })
  .source('./src')
  .destination('./docs')
  // build plugins go here
  .use(markdown({
    smartypants: true,
    gfm: true,
    tables: true
  }))
  .use(templates('handlebars'))
  .use(permalinks({
    pattern: ':title'
  }))
  .use(navTask)
  .build(function (err) {
    if (err) {
      console.log(err);
    }
    else {
      console.log('Site build complete!');
    }
  });