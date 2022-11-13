binarySearch = function(arr,item) {
  low <- 1; high <- length(arr)
  while (low <= high){
    mid <- as.integer(round((low + high) / 2)) 
    if (abs(arr[mid] - item) ==0) {
      return(mid)
    } else if (arr[mid] < item) {
      low <- mid + 1
    } else {
      high <- mid - 1
    }
  }
  return(0)
}
arr <- c(4, 0, 3, 1, 5, 6, 2)
sorted_arr <- sort(arr)
item=as.integer(readline(prompt="Enter the search element:"))
cat("Array ", arr, "\nSorted array ",sorted_arr,"\nitem = ", item, "\n")
index <- binarySearch(sorted_arr, item)
if (index!=0){
  cat("Element is present at index ", index, "\n")
}else{
  cat("Element not found")
}
