library(tictoc)

# Time original solution
tic("Original Script")
source("scripts/solution_original.r")
original_time <- toc()

# Time solution with parallel loop
tic("Parallel Loop Script")
source("scripts/solution_parallel_loop.r")
parallel_loop_time <- toc()

# Time solution with parallel function
tic("Parallel Function Script")
source("scripts/solution_parallel_function.r")
parallel_function_time <- toc()

# Create data frame with results
results_df <- data.frame(File = c("solution_original.r", "solution_parallel_loop.r", "solution_parallel_function.r"),
                         Seconds = c(original_time$toc - original_time$tic,
                                     parallel_loop_time$toc - parallel_loop_time$tic,
                                     parallel_function_time$toc - parallel_function_time$tic))

# Write results to CSV file
write.csv(results_df, file = "results.csv", row.names = FALSE)

# ------------------------------------------------------------------------
#Explanation:
# Original Solution: The original script did not utilize any parallel computing and executed all tasks serially, 
# making it the slowest.

# Parallel Loop: The parallel loop script reduced the time by parallelizing the main loop that iterates over 
# different values of N. However, it still executed the M simulations for each N serially, 
# which is why it's faster than the original but not the fastest.

# Parallel Function: This version is the fastest, and it achieved this by parallelizing the M simulations inside
# the function MTweedieTests_parallel. However, the main loop that iterates through different 
# N values remains serial.

# By focusing on parallelizing the part of the code that likely takes up the most time, which is the 
# M simulations inside the function, solution_parallel_function.r is able to achieve the best performance.
