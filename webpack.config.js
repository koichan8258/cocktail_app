const path = require('path');

module.exports = {
  mode: 'development', // この行を追加します。あるいは 'production' を指定します
  entry: './app/javascript/packs/main.js', 
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  }
};