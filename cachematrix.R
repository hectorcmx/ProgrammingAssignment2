## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix containes 4 functions set, get, setinverse, getinverse.
## get.-returns de vector x    set.- change the vectore stored in the main function just in case of a new valor
## the variable m is used to determinate when the matrix inverse has been already calculated
## getinverse and setinverse are used to put the value in m variable.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse, 
       getinverse = getinverse)

}


## cacheSolve check if the valu of m is empty in that case it calculate the inverse, otherwaze returns the value that has been already calated

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
