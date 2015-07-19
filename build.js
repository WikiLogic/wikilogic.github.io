var metalsmith = require('metalsmith'),
    markdown = require('metalsmith-markdown'),
    templates  = require('metalsmith-templates'),
    permalinks = require('metalsmith-permalinks'),
    navigation = require('metalsmith-navigation');


/* nav settings: https://github.com/unstoppablecarl/metalsmith-navigation
--------------------------------------------------*/
var navConfigs = {
    header: {
        sortBy: false,
        sortByNameFirst: true,
        filterProperty: false,
        filterValue: false,
        breadcrumbProperty: 'breadcrumb_path',
        pathProperty: 'nav_path',
        childrenProperty: 'nav_children',
        mergeMatchingFilesAndDirs: true,
        includeDirs: false,
    }
};
var navSettings = {
    navListProperty: 'navs',
    permalinks: true,
};

/*
------------------------------------------------------------*/

var siteBuild = metalsmith(__dirname)
  .metadata({
    site: {
      title: 'WikiLogic Docs',
      url: 'http://wikilogic.github.io/WikiLogic-0.3/'
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
  .use(navigation(navConfigs, navSettings))
  .build(function (err) {
    if (err) {
      console.log(err);
    }
    else {
      console.log('Site build complete!');
    }
  });