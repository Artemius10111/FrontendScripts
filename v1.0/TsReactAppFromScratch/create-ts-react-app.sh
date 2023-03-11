while getopts d:s: flag
do
    case "${flag}" in
		s) is_starting=${OPTARG};; 
        d) dir=${OPTARG};;
    esac
done

if [ -z "${dir}" ]
then
    echo "Error! dir argument wasn't setted. Preventing execution!"
    exit 0
fi

mkdir ${dir}

cd ${dir}

mkdir "src"

npm init -y

npm i --save-dev typescript

cp ./../sources/tsconfig-prototype.json "./tsconfig.json"

cp ./../sources/webpack.config.js "./webpack.config.js"

cp ./../sources/index.html "./index.html"

cp ./../sources/index.tsx "./src/index.tsx"

cp ./../sources/package.json "./package.json"

npm i --save-dev webpack webpack-cli webpack-dev-server css-loader html-webpack-plugin mini-css-extract-plugin ts-loader

npm i react react-dom

npm i --save-dev @types/react @types/react-dom

case ${is_starting} in "1")
    npm start
esac
