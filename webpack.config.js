const path = require('path');

module.exports = {
  entry: 'index.js', // エントリーポイントを指定する
  output: {
    path: path.resolve(__dirname, 'dist'), 
    filename: 'bundle.js' 
  }
};
