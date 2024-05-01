nums = [74, 91, 47, 40, 67, 90, 71, 33, 83, 35]

print(*nums, '  |   desordenado...')

for i in range(len(nums)):
    print('-----------------------------')
    for j in range(1, len(nums)-i):
        if nums[j] < nums[j-1]:
            # em c eu não poderia fazer isso
            print(*nums, f'  |   {nums[j-1]}, {nums[j]} -> {nums[j]}, {nums[j-1]}')
            nums[j], nums[j-1] = nums[j-1], nums[j]    
        else:
            print(*nums, f'  |   {nums[j-1]}, {nums[j]} -> mantém')
    
print(*nums, '  |   ordenado!')
