const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
  plugins: [
    new VueLoaderPlugin(),
  ],
  module: {
    rules: [
      {
      test: /\.vue$/,
      use: [
        {
          loader: 'vue-loader',
          options: {
            loaders: {
              js: {
                  loader: 'babel-loader',
                  options: { presets: ['@babel/preset-env'] },
              },
            },
          },
        },  
        {
          loader: 'eslint-loader',
          // enforce: 'pre',
          // options: {}
        }
      ]
    },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: [
                [
                  '@babel/preset-env',
                ],
              ],
            },
          },
          {
            loader: 'eslint-loader',
            // enforce: 'pre',
            // options: {}
          }
        ],
      },
    ],
  },
}