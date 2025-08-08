from grep_test import FILE_TEXT
def grep(pattern, flags, files):
    for f in files:
        print(FILE_TEXT[f])

print(grep('asdf','', ['iliad.txt']))
