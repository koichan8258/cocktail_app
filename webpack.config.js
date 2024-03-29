const path = require('path');

module.exports = {
  entry: './src/main.js', // エントリーポイントを指定する
  output: {
    path: path.resolve(__dirname, 'dist'), // 出力先ディレクトリを指定する
    filename: 'bundle.js' // 出力ファイル名を指定する
  }
};
