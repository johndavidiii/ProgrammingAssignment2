## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # This function creates a special vector which is a list that
  # contains a function to set the matrix, get the matrix, set the inverse of the matrix
  # and get the inverse of the matrix
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- funtion(solve) m <<- solve
  getinv <- function() m
  # build the list
  list(set = set, get = get,setinv = setinv, getinv = getinv)
}

cacheSolve <- function(x, ...) {
  # This function calculates the inverse of the special matrix created by
  # makeCacheMatrix. 
  # This function first checks to see if the inverse already exists (has previously been calculated)
  # if the inverse exists then this function gets it from the cache and skips calculating 
  # the inverse.  Otherwise it calculates the inverse of the matrix and sets the value of the 
  # inverse in the cache via the setinv function.
  m <- x$getinv()
  # So if m is not null then get the cached inverse. if it is null then calculate it
  if(!is.null(m)){
    message("getting cached inverse")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinv(m)
  m
}
