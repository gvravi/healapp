x <- Sys.Date()
x <- as.Date(x,format='%d/%m/%Y')
x
y <- as.Date('28/6/2016',format='%d/%m/%Y')
weekdays(y)
days <- mydates[1] - mydates[2]
days <- y - x
days <- as.numeric(days)
days%%7

5%%2 


weekdays(x)
