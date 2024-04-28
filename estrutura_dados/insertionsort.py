nums = [74, 91, 47, 40, 67, 90, 71, 33, 83, 35]
# nums = list('RODRIGOCOST')
# nums = [9, 6, 5, 4, 2, 1]

print(*nums, '<- desordenado\n')

# i -> do 1 ao último
for i in range(1, len(nums)):
    key = nums[i]
    print(f"\n({key}) <- chave\n") # debug

    for j in range(i-1, -1, -1):
        if key<nums[j] :
            nums[j+1] = nums[j]
            if j == 0:
                nums[j] = key

        else:
            nums[j+1] = key
            break

        print(*nums, f'({nums[j]})')

print('')
print(*nums, '<- ordenado')