m1 <- matrix(9, 3, 3)
m2 <- matrix(9, 3, 3)
m3 <- matrix(8, 4, 4)
m4 <- matrix(rnorm(7 * 3), 7, 3)

#initialize
m <- makeCacheMatrix(m1)
print(m$get())
print(m$getInverse())

#should re-calc
m$set(m3)
print(m$get())
print(m$getInverse())

#should not re-calc
m$set(m3)
print(m$get())
print(m$getInverse())

#should re-calc
m$set(m1)
print(m$get())
print(m$getInverse())
