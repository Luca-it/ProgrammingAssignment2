## Put comments here that give an overall description of what your
## functions do

## Functions below are designed to save computation time when reversing matrix
## by caching the results and using them when base matrix has not been changed



## Write a short comment describing this function
## The first function, makeCacheMatrix creates a special "Matrix",
## which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x', where x is a matrix
## set by the function above
## tipical usage:
## x<-makeCacheMatrix()
## x$set(matrix)
## cacheSolve (x)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m  
}
