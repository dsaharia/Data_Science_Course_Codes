library(ggplot2)
bonds_df = read.delim('data/bonds.txt', row.names = 1)

str(bonds_df)
summary(bonds_df)
bonds_model <- lm(bonds_df$BidPrice ~ bonds_df$BidPrice)
ggplot(bonds_df, aes(x=bonds_df$CouponRate, y=bonds_df$BidPrice)) + 
  geom_point() +
  geom_smooth(method='lm') +
  xlab('Coupon Rate') +
  ylab('Bonds Price') +
  ggtitle('Coupon Rate vs Bonds Price')

summary(bonds_model)
