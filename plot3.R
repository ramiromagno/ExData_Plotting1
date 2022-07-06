##
## Plot 3
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

# Plot 3: Energy sub metering
png("plot3.png")
plot(
  epc$datetime,
  epc$Sub_metering_1,
  xlab = "",
  ylab = "Energy sub metering",
  type = "n"
)
lines(epc$datetime, epc$Sub_metering_1, col = "black")
lines(epc$datetime, epc$Sub_metering_2, col = "red")
lines(epc$datetime, epc$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1)
dev.off()
