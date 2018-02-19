## Put comments here that give an overall description of what your
## functions do

## The first function, `makeCacheMatrix` creates a special "matrix", which is
## really a list containing a function to

## 1.  set the value of the vector
## 2.  get the value of the vector
## 3.  set the value of the mean
## 4.  get the value of the meanWrite a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) i <<- solve
  getInverse <- function() i
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}

## The following function calculates the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setmean`
## function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i
}

