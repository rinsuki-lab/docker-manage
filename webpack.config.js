const webpack = require("webpack")

module.exports = {
    entry: "./assets/index.js",
    output: {
        path: __dirname+"/dist",
        filename: "bundle.js"
    },
    devServer: {
        contentBase: "dist",
        proxy: {
            "/": "http://localhost:5000"
        }
    },
    plugins: [
        new webpack.ProvidePlugin({
            riot: "riot",
            "$": "jquery"
        })
    ],
    module: {
        loaders: [
            {test: /\.css$/, loader: 'style-loader!css-loader'},
            {test: /\.tag$/, exclude: /node_modules/, loader: 'riot-tag-loader', query: {
                type: "none",
                template: "pug"
            }},
            {test: /\.(woff2?|ttf|eot|svg)$/, loader: 'file-loader'}
        ]
    }
}