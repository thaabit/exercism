class TreeNode:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        return f'TreeNode(data={self.data}, left={self.left}, right={self.right})'


class BinarySearchTree:
    def __init__(self, tree_data):
        self.head = TreeNode(tree_data.pop(0))
        for d in tree_data:
            cur_node = self.head
            former = None
            while 1:
                if int(d) > int(cur_node.data):
                    if not cur_node.right:
                        cur_node.right = TreeNode(d)
                        break
                    else:
                        cur_node = cur_node.right
                elif int(d) <= int(cur_node.data):
                    if not cur_node.left:
                        cur_node.left = TreeNode(d)
                        break
                    else:
                        cur_node = cur_node.left

    def data(self):
        return self.head

    def tree(self, node, out):
        if not node: return
        self.tree(node.left, out)
        out.append(node.data)
        self.tree(node.right, out)

    def sorted_data(self):
        out = []
        self.tree(self.head, out)
        return out
