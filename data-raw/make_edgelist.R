df1 <- read.csv('factors.csv')
df2 <- cbind(df1[, c(2, 1)], 1/df1[, 3])
colnames(df2) <- colnames(df1)
df <- rbind(df1, df2)

devtools::use_data(df, internal=T)
