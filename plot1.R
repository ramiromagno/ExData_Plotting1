##
## Plot 1
## 

library(tidyverse)
library(here)

# Importing the data set on household energy usage. Data set is imported as a
# data frame named `epc`.
epc <-
  read_delim(
    file = unz("household_power_consumption.zip", "household_power_consumption.txt"),
    delim = ";",
    col_types = cols(
      Date = col_date(format = "%d/%m/%Y"),
      Time = col_time(format = "%H:%M:%S"),
      .default = "d"
    ),
    na = c("", "NA", "?")
  ) |>
  filter(Date == as.Date("2007-02-01") |
           Date == as.Date("2007-02-02"))

# Plot 1: histogram of global active power
png("plot1.png")
hist(
  epc$Global_active_power,
  col = "red",
  xlab = "Global Active Power (kilowatts)",
  main = "Global Active Power"
)
dev.off()

