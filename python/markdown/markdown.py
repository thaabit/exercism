import re

def parse(markdown):
    lines = markdown.split('\n')
    res = ''
    list_ = []
    for line in lines:
        html = ''
        header = re.match('^(#+) (.*)', line)
        if header:
            num = len(header.group(1))
            if num <= 6:
                res += f"<h{num}>{header.group(2)}</h{num}>"
                continue

        line = em_strong(line)
        li = re.match(r'^\* (.*)', line)
        print(line)
        if li:
            list_.append("<li>" + li.group(1) + "</li>")
        elif len(list_):
            res += "<ul>" + "".join(list_) + "</ul>"
            list_ = []

        if not li:
            res += '<p>' + line + '</p>'

    if len(list_):
        res += "<ul>" + "".join(list_) + "</ul>"
    return res

def em_strong(text):
    return em(strong(text))

def strong(text):
    return re.sub(r'(.*)__(.*)__(.*)', r'\g<1><strong>\g<2></strong>\g<3>', text)

def em(text):
    return re.sub(r'(.*)_(.*)_(.*)', r'\g<1><em>\g<2></em>\g<3>', text)
