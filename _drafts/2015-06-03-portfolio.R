op <- options(width = 50, digits = 4, scipen = 5)
library(portfolio)
data(dow.jan.2005)
summary(dow.jan.2005)
head(dow.jan.2005)

options(digits = 3)
p <- new("portfolioBasic", 
         instant = as.Date("2004-12-31"),
         id.var  = "symbol",
         in.var  = "price",
         sides   = "long", 
         ret.var = "month.ret", 
         data    = dow.jan.2005)
summary(p)
exposure(p, exp.var = c("price", "sector"))
performance(p)
contribution(p, contrib.var = c("sector"))
contribution(p, contrib.var = c("cap.bil"))

p <- new("portfolioBasic",
         instant = as.Date("2004-12-31"),
         id.var  = "symbol",
         in.var  = "price",
         type    = "linear",
         sides   = c("long", "short"),
         ret.var = "month.ret",
         data    = dow.jan.2005)
summary(p)
plot(p)
exposure(p, exp.var = c("price", "sector"))
plot(exposure(p, exp.var = c("price", "sector")))
performance(p)
contribution(p, contrib.var = c("cap.bil", "sector"))
plot(contribution(p, contrib.var = c("cap.bil", "sector")))

options(op)