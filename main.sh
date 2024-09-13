mkdir foo
cd foo
pnpm init
echo "module.exports = { foo(){ console.log('foo') } }" > index.js
pnpm link --global

cd ..

mkdir test
cd test
pnpm init
echo "const { foo } = require('foo'); foo();" > index.js
pnpm link --global foo
node index.js
pnpm unlink foo

cd ..
cd foo
pnpm unlink # 但是不知道为何这个foo还是存在于global之中
