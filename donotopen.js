const fs = require('fs');

const str = fs.createWriteStream('./isOdd.rb')


const start = `
def isOdd(num)
\tif num == 1\n\t\treturn true
`;

const end = `
\telse
\t\traise "A dalshe bilo v padlu"
\tend\n
end
`;

str.write(start)
  ; (async () => {
    for (let i = 2; i < 2497; i++) {
      str.write(`\telsif num == ${i}\n\t\treturn ${i % 2 === 1}\n`);
    }
    str.write(end)
  })();
