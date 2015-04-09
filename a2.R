## Assignment 2

setwd("C:/Chris/R/rProgramming/ProgrammingAssignment2")

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

v <- makeVector(1:5)
v$get()
v
cachemean(v) # calculates the mean
v
cachemean(v) # gets the cached mean, where exactly is it stored?
search()
objects(.GlobalEnv)
objects(v)


source("cachematrix.R")

x<-matrix(c(1,2,4,7),nrow=2,ncol=2)
solve(x)
m<-makeCacheMatrix(x)
cacheSolve(m)
cacheSolve(m)
