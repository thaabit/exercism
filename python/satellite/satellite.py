def tree_from_traversals(preorder, inorder):
    if len(preorder) != len(inorder): raise ValueError("traversals must have the same length")
    if len(list(set(preorder))) != len(preorder): raise ValueError("traversals must contain unique items")
    if set(preorder) != set(inorder): raise ValueError("traversals must have the same elements")

    tree = _traverse(preorder, inorder)
    return tree

def _traverse(preorder, inorder):
    if not len(preorder) and not len(inorder): return {}
    tree = {}
    v = preorder[0]
    tree['v'] = v
    left_inorder = inorder[:inorder.index(v):]
    right_inorder = inorder[inorder.index(v) + 1::]
    left_preorder, right_preorder = [], []
    for p in preorder[1::]:
        if p in left_inorder:
            left_preorder.append(p)
        else:
            right_preorder.append(p)
    tree['l'] = _traverse(left_preorder, left_inorder)
    tree['r'] = _traverse(right_preorder, right_inorder)
    return tree
