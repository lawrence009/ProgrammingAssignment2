## R Prorgramming Assignment 2

library(MASS)

# creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    # x is the matrix
    # m is the inverse matrix of x
    m <- NULL


    # computes the inverse of the special "matrix" returned by makeCacheMatrix
    # If the inverse has already been calculated (and the matrix has not changed),
    # then retrieve the inverse from the cache
    cacheSolve <- function(y, ...) {
        ## Return a matrix that is the inverse of 'y' via Moore-Penrose
        ## generalized inverse

        if(is.null(m) |!identical(y, x)) {
            print('calc new inverse')
            m <<- ginv(y)
        }
    }


    #set or change the matrix
    set <- function(y) {
        cacheSolve(y, m)
        x <<- y

    }


    #get the matrix
    get <- function() {
        x
    }

    #setInverse <- function(matrix) {}

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
#         setInverse = setInverse,
         getInverse = getInverse)
}
