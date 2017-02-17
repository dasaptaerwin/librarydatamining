# Codes from Jon Tennant

# Using R to visualise Paleontology publications in PLOS ONE through time

# Install package from within R
install.packages("rplos")

# Load package from library
library("rplos")

# Search for the term 'paleontology'
searchplos('paleontology', 'id,publication_date', limit = 10000)

# So there's a lot of data..
# Let's try plotting it!

# Plot results through time, no limit on data
plot_throughtime(terms='paleontology',limit=10000)

# You can try this with any field really
plot_throughtime(terms='political science',limit=3000)
plot_throughtime(terms='earth science',limit=3000)
plot_throughtime(terms='hydrogeology',limit=3000)
plot_throughtime(terms='hydrology',limit=3000)
plot_throughtime(terms='groundwater',limit=3000)
plot_throughtime(terms='river',limit=3000)
plot_throughtime(terms='bottled water',limit=3000)
plot_throughtime(terms='Indonesia',limit=3000)
plot_throughtime(terms='obesity',limit=3000)
plot_throughtime(terms='obesity and stunting',limit=3000)
plot_throughtime(terms='groundwater and river interaction',limit=3000)

# Pubmed Mine R
# Still trying to find out how it works

install.packages("pubmed.mineR")
library(pubmed.mineR)
abstracts <- readabs(“pubmed_result.txt”)

# PubMedWordcloud
# Still trying to find out how it works

install.packages("PubMedWordcloud")
library(PubMedWordcloud)
getPMIDsByKeyWords(keys="paleontology", 
                   journal = "science",
                   n = 30)
getPMIDsByKeyWords(journal="science",
                   n = 3000)

# Using FLINK PMC (https://www.ncbi.nlm.nih.gov/Structure/flink/flink.cgi)
# Do some queries
# Download the data
# Make some plots
# ggplot2

pmcdata <- read.csv('pmc.csv')
hist(pmcdata$PubDate.Year., 
     main='Papers in hydrogeology on PMC',
     xlab='year',
     col='grey')

library(ggplot2)
ggplot(data=pmcdata, aes(pmcdata$PubDate.Year.)) + geom_histogram() +
  ggtitle("Histogram of papers in -hydrogeology- on PMC dbase") +
         xlab("year") + 
         ylab("No of papers")

pmc2 <- read.csv('pmc2.csv')
ggplot(data=pmc2, aes(pmc2$PubDate.Year.)) + geom_histogram() +
  ggtitle("Histogram of papers in -river-groundwater interactions- on PMC dbase") +
  xlab("year") + 
  ylab("No of papers")

install.packages("plotly")
library(plotly)
plot_ly(data = pmcdata, alpha = 0.6) %>% 
  add_histogram(x = pmcdata$PubDate.Year.) %>%
  layout(                        # all of layout's properties: /r/reference/#layout
    title = "Histogram of papers in -hydrogeology- on PMC dbase", # layout's title: /r/reference/#layout-title
    xaxis = list(           # layout's xaxis is a named list. List of valid keys: /r/reference/#layout-xaxis
      title = "year",      # xaxis's title: /r/reference/#layout-xaxis-title
      showgrid = F),       # xaxis's showgrid: /r/reference/#layout-xaxis-showgrid
    yaxis = list(           # layout's yaxis is a named list. List of valid keys: /r/reference/#layout-yaxis
      title = "No. of papers")     # yaxis's title: /r/reference/#layout-yaxis-title
  )

plot_ly(data = pmc2, alpha = 0.6) %>% 
  add_histogram(x = pmc2$PubDate.Year.) %>%
  layout(                        # all of layout's properties: /r/reference/#layout
    title = "Histogram of papers in -river-groundwater interactions- on PMC dbase", # layout's title: /r/reference/#layout-title
    xaxis = list(           # layout's xaxis is a named list. List of valid keys: /r/reference/#layout-xaxis
      title = "year",      # xaxis's title: /r/reference/#layout-xaxis-title
      showgrid = F),       # xaxis's showgrid: /r/reference/#layout-xaxis-showgrid
    yaxis = list(           # layout's yaxis is a named list. List of valid keys: /r/reference/#layout-yaxis
      title = "No. of papers")     # yaxis's title: /r/reference/#layout-yaxis-title
  )
         