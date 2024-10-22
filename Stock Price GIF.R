library(ggplot2)
library(gganimate)
library(gifski)
library(dplyr)
library(magick)
library(readxl)


data <- read_excel("C:/Users/DELL/Documents/SBI Stock Data.xlsx", sheet = 1)

head(data)

data_time_series=data[,c(3,5)]

# 3. Plot and animate using gganimate
p <- ggplot(data_time_series, aes(x = Date, y = OpenPrice)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Stock Price of SBI Over time", x = "Date", y = "Opening Price") +
  theme_minimal() +
  transition_reveal(Date)+
  ease_aes('linear') +
  geom_text(aes(label = as.Date(Date)))

# 4. Animate and save the GIF
anim <- animate(p, nframes = 200, fps = 20, width = 600, height = 400, renderer = magick_renderer())

# Save the animation as a GIF
anim_save("stock_price_SBI_animation.gif", animation = anim)

