var path = require('path');
var cooking = require('cooking');
var webpack = require('webpack');
var examples = './examples';

cooking.set({
  entry: {
    app: examples + '/index.js'
  },
  dist: examples + '/build',
  template: examples + '/index.tpl',
  publicPath: '/examples/build',
  hash: true,
  devServer: {
    hostname: '0.0.0.0',
    port: 7070,
    log: false,
    publicPath: '/'
  },
  minimize: true,
  chunk: true,
  extractCSS: true,
  sourceMap: true,
  urlLoaderLimit: 200000,
  extends: ['vue2', 'lint', 'sass'],
  alias: {
    'API': path.join(__dirname, '../examples/api'),
    'CommonStyle': path.join(__dirname, '../examples/Common/styles')
  },
  postcss: function (webpack){
    return [
      require('postcss-salad')({
        browsers: ['ie > 8', 'last 2 versions', 'Chrome > 24'],
        features: {
          'partialImport': {
            addDependencyTo: webpack
          },
          'bem': {
            'shortcuts': {
              'component': 'b',
              'modifier': 'm',
              'descendent': 'e'
            },
            'separators': {
              'descendent': '__',
              'modifier': '--'
            }
          }
        }
      })
    ];
  }
});
cooking.add('devtool', 'source-map');

cooking.add('plugins.Define', new webpack.DefinePlugin({
  'process.env.NODE_ENV': JSON.stringify('development')
}));

module.exports = cooking.resolve();
