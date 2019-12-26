const path = require('path');
const CssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const marked = require("marked");
marked.setOptions({ headerIds: false });
const MinifyPlugin = require("babel-minify-webpack-plugin");
const WebpackPwaManifest = require('webpack-pwa-manifest');
const workboxPlugin = require('workbox-webpack-plugin');
const fs = require('fs');

const readFileContents = (filePath) => fs.readFileSync(path.join(__dirname, filePath), "utf8");

const makeHtmlPlugin = (templateFilename, bodyHtml) => {
    const filename = templateFilename.split('.')[0];
    return new HtmlWebpackPlugin({
        filename: `${filename}.html`,
        favicon: path.resolve(__dirname, `./src/assets/favicon.png`),
        template: path.resolve(__dirname, `./src/pages/${filename}.html`),
        templateParameters: {
            content: bodyHtml,
            header: readFileContents("./src/partials/header.html"),
            footer: readFileContents("./src/partials/footer.html"),
            ga: readFileContents("./src/partials/ga.html"),
            nl_signup: readFileContents("./src/partials/newsletter_signup.html"),
        },
        meta: {
            "language": "English",
            "charset": "utf-8",
            "viewport": "width=device-width, initial-scale=1",
            "theme-color": "#d50000",
            "keywords": "vinesh raju,theVinesh,android,web,developer,designer,india,tirunelveli",
            "robots": "index,follow",
            "article:author": "Vinesh Raju",
            "twitter:card": "summary",
            "twitter:site": "@theVinesh",
            "twitter:creator": "@theVinesh",
        }
    });
}

function generateHtmlPlugins(templateDir) {
    const pathName = path.resolve(__dirname, templateDir);
    const templateFiles = fs.readdirSync(pathName);
    const htmls = templateFiles.filter(filename => /\.html$/.test(filename));
    const mds = templateFiles.filter(filename => /\.md$/.test(filename));
    return htmls.map(filename => makeHtmlPlugin(filename, null)).concat(
        mds.map(filename => makeHtmlPlugin(
            filename,
            marked(readFileContents(path.join(templateDir, filename)))
        )));
}

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
                        loader: 'babel-loader'
                    }
                ]
            },
            {
                test: /\.scss$/,
                use: [CssExtractPlugin.loader, 'css-loader', 'sass-loader']
            },
            {
                test: /\.(html)$/,
                use: ['ejs-loader', 'extract-loader', 'html-loader']
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
        ]
    },
    plugins: ([
        new workboxPlugin.InjectManifest({
            swSrc: './src/js/sw.js',
            swDest: 'sw.js',
        }),
        new MinifyPlugin({}, {
            comments: false
        }),
        new CssExtractPlugin({
            filename: 'style/main.css'
        }),
        new WebpackPwaManifest({
            name: "Vinesh Raju's Site",
            short_name: "Vinesh Raju",
            lang: "en-US",
            start_url: "/",
            description: "I am Vinesh Raju, Android and Web Developer, Designer, Tech Enthusiast. I am currently an Android Developer at Swiggy, I am curious about almost everything. When I am not sleeping, eating or coding, I like to Sing, Sketch and dream up about all the cool stuffs to do; which I almost always procrastinate.",
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
        }),
        ...generateHtmlPlugins('./src/pages'),
    ])
};