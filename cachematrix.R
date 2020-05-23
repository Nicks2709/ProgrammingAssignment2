# Matrix inversion is usually a costly computation and there
# may be some benefit of caching the inverse of a matrix rather
# than compute it repeatedly. The following two functions are 
# used to cache the inverse of a matrix
#For example, If X is a square invertible matrix, then solve (X) returns the its inverse. 


# The following functions are used to create a speacial object that stores a matrix and caches its inverse. First function is to make  CacheMatrix this creats a special "matrix", which is a list containing function to:
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
set <- function(y) {
        x <<- y
        i <<- NULL    
}
get <- function()x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(set = set,
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}     

# This function computes the inverse of the special "matrix" retunred by makeCacheMatrix above.
# It first checkes if the inverse has already been calculated, If so, it gets the result and skips
# the computation. If not, it computes the inverse, sets the value in the cache via setinverse function.

# The function assumes that thr matrix is always invertible.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)){
          message("getting chached data")
          return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i
}
