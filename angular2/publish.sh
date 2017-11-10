echo "Expected arguments: 1) version"

version=$1

if [ -z "$version" ]; then
  echo "version is not set"
  exit 1
fi

cd ./angular2

npm run build

generatedNpmVersion="$(npm version $version)"

cd ./dist

npm publish --access public

git tag "angular4-${generatedNpmVersion}"
