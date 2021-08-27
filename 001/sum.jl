global total_time = 0

for _ in 1:10 
    current_time = time_ns();
    sum = 0;
    for num in 0:1000000
        sum += num;
    end
    global total_time += time_ns() - current_time;
end

#print(total_time)
println(total_time/10^10)

