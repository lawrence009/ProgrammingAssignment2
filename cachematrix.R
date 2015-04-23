## R Prorgramming Assignment 2

library(MASS)

# creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    # m is the inverse matrix of x
    m <- NULL


    # computes the inverse of the special "matrix" returned by makeCacheMatrix
    # If the inverse has already been calculated (and the matrix has not changed),
    # then retrieve the inverse from the cache
    cacheSolve <- function(y, ...) {
        ## Return a matrix that is the inverse of 'y' via Moore-Penrose
        ## generalized inverse

        if(all(y == x) & !is.null(m)) {
            print('use cached')
            m
        } else {
            print('new calc')
            ginv(y)
        }
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


    #initializes
    if(is.matrix(x)) {
        print('Well done, my young Padawan. I shall create the required matrix.')
        set(x)
    } else {
        stop('Sorry, Neo. I require a matrix.')
    }


    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}
