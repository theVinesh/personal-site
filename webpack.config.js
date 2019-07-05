const path = require('path');
const CssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ScriptExtHtmlWebpackPlugin = require('script-ext-html-webpack-plugin');
const WebpackPwaManifest = require('webpack-pwa-manifest')
const workboxPlugin = require('workbox-webpack-plugin');
const fs = require('fs')

function generateHtmlPlugins(templateDir) {
    const templateFiles = fs.readdirSync(path.resolve(__dirname, templateDir))
    return templateFiles.map(item => {
        const parts = item.split('.')
        const name = parts[0]
        const extension = parts[1]
        return new HtmlWebpackPlugin({
            filename: `${name}.html`,
            template: path.resolve(__dirname, `${templateDir}/${name}.${extension}`),
            'meta': {
                "language": "English",
                "charset": "utf-8",
                "viewport": "width=device-width, initial-scale=1",
                "theme-color": "#d50000",
                "keywords":"vinesh raju,theVinesh,android,web,developer,india,tirunelveli",
                "robots": "index,follow",
                "article:author": "Vinesh Raju",
                "twitter:card": "summary",
                "twitter:site": "@theVinesh",
                "twitter:creator": "@theVinesh",
            }
        })
    })
}

const htmlPlugins = generateHtmlPlugins('./src/pages')

module.exports = {
    entry: ['./src/js/app.js'],
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: 'js/bundle.js',
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                use: [
                    {
                        loader: 'babel-loader',
                        options: {
                            presets: ['es2015']
                        }
                    }
                ]
            },
            {
                test: /\.scss$/,
                use: [CssExtractPlugin.loader, 'css-loader', 'sass-loader']
            },
            {
                test: /\.html$/,
                use: ['html-loader']
            },
            {
                test: /\.(png|ico)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]',
                            outputPath: 'img/',
                            publicPath: 'img/'
                        }
                    }
                ]
            },
            {
                test: /robots.txt$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]'
                        }
                    }
                ]
            },
        ]
    },
    plugins: htmlPlugins.concat([
        new ScriptExtHtmlWebpackPlugin({
            // sync: 'js/bundle.js',
            defaultAttribute: 'async'
        }),
        new CssExtractPlugin({
            filename: 'style/main.css'
        }),
        new workboxPlugin.InjectManifest({
            swSrc: './src/js/sw.js',
            swDest: 'sw.js',
        }),
        new WebpackPwaManifest({
            name: "Vinesh Raju's Site",
            short_name: "Vinesh Raju",
            lang: "en-US",
            start_url: "/",
            description: "Hi, I am Vinesh Raju. I am an Android developer currently working at Swiggy.",
            background_color: "#9b0000",
            theme_color: "#d50000",
            display: "standalone",
            inject: true,
            fingerprints: false,
            ios: {
                'apple-mobile-web-app-title': 'Vinesh Raju',
                'apple-mobile-web-app-status-bar-style': 'white'
            },
            icons: [
                {
                    src: path.resolve('src/assets/favicon.png'),
                    sizes: [120, 152, 167, 180, 1024],
                    destination: path.join('icons', 'ios'),
                    ios: true
                },
                {
                    src: path.resolve('src/assets/favicon.png'),
                    size: 1024,
                    destination: path.join('icons', 'ios'),
                    ios: 'startup'
                },
                {
                    src: path.resolve('src/assets/favicon.png'),
                    sizes: [36, 48, 72, 96, 144, 192, 512],
                    destination: path.join('icons', 'android')
                }
            ]
        })
    ])
};