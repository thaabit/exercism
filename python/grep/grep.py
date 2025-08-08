def grep(pattern, flags, files):
    n, l, i, v, x = "-n" in flags, "-l" in flags, "-i" in flags, "-v" in flags, "-x" in flags
    if i: pattern = pattern.lower()
    multiple = len(files) > 1
    results = ""
    for f in files:
        for line_no, line in enumerate(open(f).readlines()):
            line_clean = line.lower() if i else line
            found = (x and pattern + "\n" == line_clean) or (not x and pattern in line_clean)
            if (found and not v) or (not found and v):
                if l:
                    results += f"{f}\n"
                    break
                results += (f"{f}:" if multiple else '') + (f"{line_no + 1}:" if n else '') + line
    return results
