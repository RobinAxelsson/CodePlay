with open("./tree_end.txt") as f:
    text = f.read()
text = text.split()
text.reverse()
newtext = []
for index, line in enumerate(text):
    line += str(index+1)
    newtext.append(line)
newtext.reverse()
for line in newtext:
    print(line)
