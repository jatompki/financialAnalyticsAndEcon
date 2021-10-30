#install.packages("quantmod")
library(quantmod)

#install.packages("highcharter")
library(highcharter)

#install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

# Define the start and end dates
startDate <- "2021-6-13"
endDate <- "2021-8-13"

# Pull sector EFT data from Yahoo Finance
getSymbols("SPY", from=startDate, to=endDate)
getSymbols("XLP", from=startDate, to=endDate)
getSymbols("PPH", from=startDate, to=endDate)
getSymbols("XLU", from=startDate, to=endDate)
getSymbols("XLF", from=startDate, to=endDate)
getSymbols("XHB", from=startDate, to=endDate)
getSymbols("XLY", from=startDate, to=endDate)
getSymbols("IYT", from=startDate, to=endDate)
getSymbols("XLK", from=startDate, to=endDate)
getSymbols("XLI", from=startDate, to=endDate)
getSymbols("XLB", from=startDate, to=endDate)
getSymbols("XLE", from=startDate, to=endDate)


# Create variables for the daily returns for each sector
sNp <- dailyReturn(SPY$SPY.Adjusted)
consumerStaples <- dailyReturn(XLP$XLP.Adjusted)
pharma <- dailyReturn(PPH$PPH.Adjusted)
utilities <- dailyReturn(XLU$XLU.Adjusted)
financialSector <- dailyReturn(XLF$XLF.Adjusted)
homebuilders <- dailyReturn(XHB$XHB.Adjusted)
consumerCyclicals <- dailyReturn(XLY$XLY.Adjusted)
transportation <- dailyReturn(IYT$IYT.Adjusted)
technology <- dailyReturn(XLK$XLK.Adjusted)
capitalGoods <- dailyReturn(XLI$XLI.Adjusted)
materials <- dailyReturn(XLB$XLB.Adjusted)
energy <- dailyReturn(XLE$XLE.Adjusted)

# Define the wealth index for each sector
wiSnP <- Return.portfolio( sNp , wealth.index = TRUE )
wiConsumerStaples <- Return.portfolio( consumerStaples , wealth.index = TRUE )
wiPharma <- Return.portfolio( pharma , wealth.index = TRUE )
wiUtilities <- Return.portfolio( utilities , wealth.index = TRUE )
wiFinancialSector <- Return.portfolio( financialSector , wealth.index = TRUE )
wiHomebuilders <- Return.portfolio( homebuilders , wealth.index = TRUE )
wiConsumerCyclicals <- Return.portfolio( consumerCyclicals , wealth.index = TRUE )
wiTransportation <- Return.portfolio( transportation , wealth.index = TRUE )
wiTechnology <- Return.portfolio( technology , wealth.index = TRUE )
wiCapitalGoods <- Return.portfolio( capitalGoods , wealth.index = TRUE )
wiMaterials <- Return.portfolio( materials , wealth.index = TRUE )
wiEnergy <- Return.portfolio( energy , wealth.index = TRUE )

# Chart the comparable wealth index for all sectors (benchmarked against the S&P)
hc <- highchart() %>%
  hc_title(text="Sector Performance", align="left", style=list(color="black")) %>%
  hc_add_series(data=wiSnP, name="S&P 200", color="black") %>%
  hc_add_series(data=wiConsumerStaples, name="Consumer Staples", color="red") %>%
  hc_add_series(data=wiPharma, name="Pharmaceuticals", color="red3") %>%
  hc_add_series(data=wiUtilities, name="Utilities", color="orange") %>%
  hc_add_series(data=wiFinancialSector, name="Financial", color="yellow") %>%
  hc_add_series(data=wiHomebuilders, name="Home Builders", color="yellowgreen") %>%
  hc_add_series(data=wiConsumerCyclicals, name="Consumer Cyclicals", color="green") %>%
  hc_add_series(data=wiTransportation, name="Transportation", color="blue") %>%
  hc_add_series(data=wiTechnology, name="Technology", color="navy") %>%
  hc_add_series(data=wiCapitalGoods, name="Capital Goods", color="plum") %>%
  hc_add_series(data=wiMaterials, name="Materials", color="violet") %>%
  hc_add_series(data=wiEnergy, name="Energy", color="magenta")
  
hc

