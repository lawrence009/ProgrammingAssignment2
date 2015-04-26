## R Prorgramming Assignment 2

library(MASS)

# creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    # x is the matrix
    # m is the inverse matrix of x
    m <- NULL


    # computes the inverse of the special "matrix" returned by makeCacheMatrix
    # If the inverse has not been calculated (or the matrix has changed),
    # then calculate and cache the inverse
    cacheSolve <- function(y = x, inv = m, ...) {
        ## Cache a matrix that is the inverse of 'y' via Moore-Penrose
        ## generalized inverse

        #can this if, else if be simplifed?
        if(is.null(inv)) {
            print('init inverse')
            m <<- ginv(y)
        } else if(!identical(y, x)) {
            print('matrix changed; calc new inverse')
            x <<- y
            m <<- ginv(y)
        } else if(!identical(inv, m)) {
            print('inverse changed; calc new inverse')
            x <<- ginv(inv)
            m <<- inv
        }

    }


    #set or change the matrix
    set <- function(y) {
        cacheSolve(y, m)
    }


    #get the matrix
    get <- function() {
        x
    }

    #set the inverset of the matrix
    setInverse <- function(y) {
        cacheSolve(x, y)
    }

    #get the inverset of the matrix
    getInverse <- function() {
        m
    }


    #initializes
    if(is.matrix(x)) {
        print('Well done, Neo. I shall create the required matrix.')
        set(x)
    } else {
        stop('Sorry, Neo. I require a matrix to proceed')
    }


    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}
