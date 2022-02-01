import sys
def miniMaxSum(arr: list[str]):
    arr.pop(0)
    num = [int(x) for x in arr]
    num.sort()
    _sum = sum(num)
    min = str(_sum-num[-1])
    max = str(_sum-num[0])
    print(min + ' ' + max)

miniMaxSum(sys.argv)