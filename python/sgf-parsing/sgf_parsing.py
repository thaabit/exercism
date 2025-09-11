import re
class SgfTree:
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for key, value in self.properties.items():
            if key not in other.properties:
                return False
            if other.properties[key] != value:
                return False
        for key in other.properties.keys():
            if key not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for child, other_child in zip(self.children, other.children):
            if child != other_child:
                return False
        return True

    def __ne__(self, other):
        return not self == other

    def __str__(self):
        out = f"SGFTree: {self.properties}"
        chil = ", ".join(map(str, self.children))
        if len(chil): chil = f" [{chil}]"
        return out + chil


def parse(input_string):
    if not len(input_string): raise ValueError("tree missing")
    if input_string == "()": raise ValueError("tree with no nodes")
    node_markers = []
    not_escape = {
        "OPENPAREN": "(",
        "CLOSEPAREN": ")",
        "SEMICOLON": ";"
    }
    for replace, unescaped in not_escape.items():
        input_string = re.sub(r"(\[[^]]*)" + re.escape(unescaped) + r"([^]]*\])", r"\g<1>" + replace + r"\g<2>", input_string)

    def find_tree(rest, parent_children=[]):
        if rest[0] != "(": raise ValueError("tree missing")
        openers = 0
        grab_idx = 0
        for idx, char in enumerate(rest):
           if char == ")": openers -= 1
           if char == "(": openers += 1
           grab_idx += 1
           if openers == 0: break
        node = rest[:grab_idx]
        siblings = rest[grab_idx:]

        m = re.fullmatch(r"\(;(.*?)([\(\)].*)?\)", node, re.DOTALL)
        prop_string, rest = m.groups()

        props = {}
        nodes = prop_string.split(";")
        prop_string = nodes.pop(0)

        out = ""
        for node in nodes: out += f"(;{node}"
        out += ")" * len(nodes)
        rest = out + (rest or "")

        prop_string = prop_string.replace("\\\\", "BACKSLASH")
        prop_string = re.sub(r"\\]", "CLOSE_BRACKET", prop_string)
        prop_string = re.sub(r"\\\n", "", prop_string)
        prop_string = re.sub(r"\\\t", " ", prop_string)
        prop_string = re.sub(r"\\([tn])", r"\g<1>", prop_string)
        while m := re.fullmatch(r";?([^\[]+)(.*)$", prop_string, re.DOTALL):
            key, prop_string = m.groups()
            if re.search(r"[^A-Z]", key): raise ValueError(f"property must be in uppercase")
            props[key] = []
            while m := re.fullmatch(r"\[(.*?)\](.*)", prop_string, re.DOTALL):
                val, prop_string = m.groups()
                for replace, unescaped in not_escape.items():
                    val = val.replace(replace, unescaped)
                val = val.replace("BACKSLASH", "\\").replace("CLOSE_BRACKET", "]").replace("\t", " ")
                props[key].append(val)
            if not props[key]: raise ValueError(f"properties without delimiter")
        if len(prop_string): raise ValueError(f"bad property list: {prop_string}")

        children = []
        if len(rest): children.insert(0, find_tree(rest, children))
        if siblings: parent_children.append(find_tree(siblings, parent_children))
        return SgfTree(children=children, properties=props)

    return find_tree(input_string)
