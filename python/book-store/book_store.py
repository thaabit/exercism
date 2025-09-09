def total(basket):
    groups = []
    while basket.size > 0
        size = basket.unique().size
        groups[size] += 1
        for i in basket.unique()
            basket.remove(i)
    print(groups)

basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
print(total(basket))

