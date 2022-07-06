##
## Plot 2
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
           Date == as.Date("2007-02-02")) |>
  mutate(datetime = as.POSIXct(paste(Date, Time)), .after = "Time")

# Plot 2: time series of global active power
png("plot2.png")
plot(
  epc$datetime,
  epc$Global_active_power,
  t = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
)
dev.off()

