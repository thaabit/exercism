NODE, EDGE, ATTR = range(3)


class Node:
    def __init__(self, name, attrs):
        if not isinstance(attrs, dict): raise ValueError("Node is malformed")
        self.name = name
        self.attrs = attrs

    def __eq__(self, other):
        return self.name == other.name and self.attrs == other.attrs


class Edge:
    def __init__(self, src, dst, attrs):
        self.src = src
        self.dst = dst
        self.attrs = attrs

    def __eq__(self, other):
        return (self.src == other.src and
                self.dst == other.dst and
                self.attrs == other.attrs)


class Graph:
    def __init__(self, data=None):
        if not data: data = []
        if not isinstance(data, list): raise TypeError("Graph data malformed")
        self.nodes, self.edges, self.attrs = [], [], {}
        for d in data:
            if len(d) == 0: raise TypeError("Graph item incomplete")
            if d[0] == NODE:
                if len(d) < 3: raise TypeError("Graph item incomplete")
                self.nodes.append(Node(d[1], d[2]))
            elif d[0] == EDGE:
                if len(d) < 4: raise ValueError("Edge is malformed")
                self.edges.append(Edge(d[1], d[2], d[3]))
            elif d[0] == ATTR:
                if len(d) < 3: raise TypeError("Graph item incomplete")
                if len(d) > 3: raise ValueError("Attribute is malformed")
                self.attrs[d[1]] = d[2]
            else: raise ValueError("Unknown item")
