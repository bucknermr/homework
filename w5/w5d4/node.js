const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(){
  let first, second;
  reader.question('Would you like some tea?', (res) => {
    first = res
  });

  // reader.question()
}
