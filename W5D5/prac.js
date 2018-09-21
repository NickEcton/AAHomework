const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});



  reader.question('Would you like some tea?', (tea) => {
    reader.question('Would you like some biscuits?', (bis) => {
    const firstRes = (tea === 'yes') ? 'do' : 'don\'t';
    const secondRes = (bis === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
    });
  });
