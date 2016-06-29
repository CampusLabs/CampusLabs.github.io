library(ggplot2)

dd <- data.frame(prices=rnorm(1000,3.5,.3))

# prediction with expected value and uncertainty range
ggplot(dd, aes(prices))  +
  geom_density() + labs(list(title="Expected Value\n and Uncertainty", y="",x="range of outcomes"))+
  xlim(2.25, 4.75) + theme_classic() +
  annotate("text", x=3.3 , y=0.4, label="expected\nvalue", color="orange", size=5.5) +
  geom_vline(xintercept = 3.5, linetype="dotted", color="blue")+
  annotate("text", x=4.15 , y=1, label="likelihood of values\nover\nobserved range", color="red", size=6.5) + ggsave("./images/predict_expected_value_range.png", width=8,height = 6)



# milk example
p <-ggplot(dd, aes(prices))  +
  geom_density() + labs(list(title="Milk Prices", y=""))+
  xlim(2.25, 4.75) + theme_classic()  +
  annotate("text", x=c(2.5,4.5) , y=.15, label=c("bargain!","ripoff!"), color="blue", size=8.5) +
  annotate("text", x=3.3 , y=0.4, label="expected\nprice", color="orange", size=5.5) +
  annotate("text", x=4.15 , y=1, label="frequency of prices\nover\nobserved range", color="red", size=6.5) +
  geom_vline(xintercept = 3.5, linetype="dotted") +  annotate("text", x=c(2.95,3.65,4) , y=.1, label=c("Aldi\n$2.95","Tops\n$3.65","Wegmans\n$4.00"), color="black", size=5.5)

p + ggsave("./images/milk_expected_value_range.png", width=8,height = 6)



# shrinking uncertainty

ggplot()  +
  geom_density(data=data.frame(prices=rnorm(1000,3.5,.3)), aes(prices), color="blue") +
  geom_density(data=data.frame(prices=rnorm(1000,3.5,3)), aes(prices), color="red") +
  geom_density(data=data.frame(prices=rnorm(1000,3.5,1)), aes(prices), color="purple") +
  annotate("text", x=5.5 , y=1, label="highly certain", color="blue", size=5.5) +
  annotate("text", x=6 , y=.25, label="certain", color="purple", size=5.5) +
  annotate("text", x=9 , y=.1, label="highly uncertain", color="red", size=5.5) +
  geom_vline(xintercept = 3.5, linetype="dotted", color="black")+
  labs(list(title="Ranges of Uncertainty", y="",x="range of outcomes")) + theme_classic()  +
  ggsave("./images/ranges_of_uncertainty.png", width=8,height = 6)
