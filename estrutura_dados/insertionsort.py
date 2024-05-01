nums = list('RODRIGOCOST')
# nums = [74, 91, 47, 40, 67, 90, 71, 33, 83, 35]
# nums =[2,1,6,4,5,3]

print('')
print(*nums, '              |   desordenado...')

for i in range(1, len(nums)): # começa em 1, pois em 0, por definição, já está ordenado
    key = nums[i]
    print(f"---------------------\nchave = ({key}) no index = {i}\n") # debug

    # começa do maior pro menor, de i-1 até -1 (ou seja, index 0)
    for j in range(i-1, -1, -1):    
        if key<nums[j] :
            print(*nums, f'  index = {j}   |   {nums[j]}...({key}) -> desordenado, insere "{nums[j]}" em index = {j}+1')
            nums[j+1] = nums[j] # move o valor pra posição seguinte

            if j == 0:
                print(*nums, f'              |              último loop, insere chave em index = {j}')
                nums[j] = key

        else:
            print(*nums, f'  index = {j}   |   {nums[j]}...({key}) -> ordenado,    insere chave em index = {j}')
            nums[j+1] = key
            break

print('---------------------')
print(*nums, '              |   ordenado!\n')