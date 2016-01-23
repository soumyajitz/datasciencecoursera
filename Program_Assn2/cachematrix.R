## makeCacheMatrix:
## To facilitate this caching, you first create a special
## matrix that will help us with this by using the
## makeCacheMatrix function.  The input into this function
## is simply a variable of type matrix.
##
## Usage example:
## x <- matrix(1:4, nrow=2, ncol=2)
## m <- makeCacheMatrix(x)

makeCacheMatrix <- function(x = matrix()) {
    # Following the same format as the assignment example
    # Creating a makeCacheMatrix object will consist of
    # four functions encapsulated in a list
    # 1. set the matrix
    # 2. get the matrix
    # 3. set the inverse of the matrix
    # 4. get the inverse of the matrix
    
    # Initially set the inverse value to NULL
    # Changes when the user sets the value
    inv <- NULL
    
    # set function just like setter method
    # Sets the matrix itself but not the inverse
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    # get function just like getter method
    # Gets the matrix itself but not the inverse
    get <- function() x
    
    # Setting the inverse
    setinverse <- function(inverse) inv <<- inverse
    
    # Getting the inverse
    getinverse <- function() inv
    
    # Put in a list
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
}

## cacheSolve:
## The cahceSolve Matrix can be obtained to get the inverse
##
## ##
## Usage example:
## x <- matrix(1:4, nrow=2, ncol=2)
## k <- makeCacheMatrix(x)
## s <- cacheSolve(k)
## print(s)
## s should return:
##     [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
##
## s2 <- cacheSolve(k)
## This should display a "Getting cached matrix" message
## print(s2)
## s2 should return
##     [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of x
    # Following the same format as the assignment example
    
    # Get the current state of the inverse and see if it
    # has been computed yet
    inv <- x$getinverse()
    
    if(!is.null(inv)) {
        # Return the computed inverse
        message("Getting cached matrix")
        return(inv)
    }
    
    data <- x$get()
    
    # Lets find the inverse
    inv <- solve(data, ...)
    
    # Also cache this result
    x$setinverse(inv)
    
    # Return this new result as the last line of the function represents the return statement
    inv
}