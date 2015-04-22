## R Prorgramming Assignment 2

library(MASS)

# creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    # m is the inverse matrix of x
    m <- NULL


    # computes the inverse of the special "matrix" returned by makeCacheMatrix
    # If the inverse has already been calculated (and the matrix has not changed),
    # then retrieve the inverse from the cache
    cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ginv(x)
    }


    set <- function(y) {
        x <<- y
        m <<- cacheSolve(y)
    }


    get <- function() {
        x
    }


    setInverse <- function(matrix) {
        m <<- matrix
    }


    getInverse <- function() {
        m
    }


    if(is.matrix(x)) {
        print('Well done, my young Padawan.')
        print('I shall create the required matrix.')
        set(x)
    } else {
        stop('Sorry, Neo. I require a matrix.')
    }


    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}
