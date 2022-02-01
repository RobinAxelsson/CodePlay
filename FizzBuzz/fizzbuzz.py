for i in range(1, 101):
    a = ''
    if not i % 3:
        a += 'Fizz'
    if i % 5:
        a += 'Buzz'
    if a == '':
        a = str(i)
    print(a)

for i in range(1,101):print("Fizz"*(i%3<1)+(i%5<1)*"Buzz"or i)
