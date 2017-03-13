module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
    plugins: [
      require('karma-jasmine'),
      require('karma-phantomjs-launcher')
    ],
    files: [
      'src/oakdex_pokedex.js',
      'spec/javascripts/*.js'
    ],
    exclude: [],
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    browsers: ['PhantomJS'],
    captureTimeout: 60000,
    autoWatch: true,
    singleRun: true
  });
};
