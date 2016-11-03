# The structure I've used here is to just take the original Make Vector functions and then change them to Make Inverse.
# This seems to be line for line the same fuction only it's a matrix and the calculation at the end is different.


# this is the example given in the assignment text.
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
m <- x$getmean()
    if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
data <- x$get()
    m <- mean(data, ...)
  x$setmean(m)
  m
}




# Original   makeVector <- function(x = numeric()) {
makeCacheMatrix <- function(x = matrix()) {

# Original   m <- NULL
i <= NULL
  
# Original   set <- function(y) {
set = function(y) {

  # Original     x <<- y
  x <<- y

    # Original     m <<- NULL
  i <<- NULL
}

# Original   get <- function() x
get = function() x

# Original   setmean <- function(mean) m <<- mean
setinv = function(inverse) i <<- inverse 

# Original   getmean <- function() m
getinv = function() i

# Original   list(set = set, get = get, setmean = setmean, getmean = getmean)
list(set = set, get = get, setinv = setinv, getinv = getinv)
}




# Original   cachemean <- function(x, ...) {
cacheSolve <- function(x, ...) {
  
# Original  m <- x$getmean()
i <- x$getinv()
  
  # Original  if(!is.null(m)) {
if (!is.null(i)){
    
# Original    message("getting cached data")
  message("getting cached data")
  
  # Original   return(m)
  return(i)
}

# Original  data <- x$get()
data <- x$get()

# Original  m <- mean(data, ...)
i <- solve(data, ...)

# Original  x$setmean(m)
x$setinv(i)

# Original  m
return(i)
}



# to test this fuction works we can make a little matrix and then put it through funtion.  To make sure it can be inverted as a matrix I've striped it with a vector of a prime number.

test_matrix <- matrix(data=1:997, nrow=100, ncol=100)
str(test_matrix)

test_vector <- c(1:19997)
str (test_vector)

# 4 commands to test 


test_vector <- makeVector (test_vector)
str(test_vector)
# this produces a long set of memory locations

test_cache_mean <- cachemean (test_vector) 
str(test_cache_mean)
# this produces also returns a memory location and then an error - but this is the original example so I expect this is the intended result.


# now test the new fuctions

test_matrix_with_cache <- makeCacheMatrix (test_matrix)
str(test_matrix_with_cache)
# this produces the same sort of errors - so I think it's behaving the same as the example given.

inv_test_matrix <- cacheSolve (test_matrix)
# same errors as the example given in the outline