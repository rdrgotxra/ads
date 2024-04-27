nums = [74, 91, 47, 40, 67, 90, 71, 33, 83, 35]


print(*nums, '\n')

for i in range(len(nums)):
    for j in range(1, len(nums)-i):
        if nums[j] < nums[j-1]:
            nums[j], nums[j-1] = nums[j-1], nums[j]

        print(*nums)

    print("\n")