"""
algoritimo quicksort, porém simplificado (confortos do python).
fiz isso para conseguir vizualizar melhor a ideia geral do algoritmo
e o papel da recursividade, o "dividir para conquistar".
"""

nums = [93, 84, 33, 95, 27, 49, 91, 38, 17, 38]

def order(nums):
    if len(nums) > 2:
        pivot = nums[0]        
        nums.pop(0)
        
        nums_a = [] # itens menores que o pivot
        nums_b = [] # itens maiores que o pivot

        for num in nums:
            if num < pivot:
                nums_a.append(num)
            else:
                nums_b.append(num)

        nums = order(nums_a) + [pivot] + order(nums_b)
        return nums
    
    if len(nums) == 2:
        if nums[0] > nums[1]:
            nums[0], nums[1] = nums[1], nums[0]

        return nums
    
    if len(nums) == 1:
         return nums
    
    return []

nums_ordered = order(nums)
print(nums_ordered)
