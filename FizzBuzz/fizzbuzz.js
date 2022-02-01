for(i=0;++i<101;)console.log(i%15<1&&"FizzBuzz"||i%3<1&&"Fizz"||i%5<1&&"Buzz"||i)
for(i=0;++i<101;){console.log("Fizz".repeat(+i%3<1)+"Buzz".repeat(+i%5<1)||i)}
