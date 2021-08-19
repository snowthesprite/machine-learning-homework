import time
total_time = 0

for _ in range(10) :
    start_time = time.time()
    sum = 0
    for num in range(1000000) :
        sum += num
    total_time += time.time() - start_time

print(total_time/10)