import subprocess
args = ("/Users/RAX/Code/CommandLine_Play/helloc")
#Or just:
#args = "bin/bar -c somefile.xml -d text.txt -r aString -f anotherString".split()
popen = subprocess.Popen(args, stdout=subprocess.PIPE)
popen.wait()
output = popen.stdout.read().decode('utf8')
print(output)