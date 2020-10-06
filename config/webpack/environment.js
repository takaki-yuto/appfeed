const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const webpack = require('webpack')
const eslint =  require('./loaders/eslint')

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

environment.loaders.append('vue', vue)
environment.loaders.append('eslint', eslint)
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())

module.exports = environment
