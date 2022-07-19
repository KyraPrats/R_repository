##### Rice GHG Manuscript code #####
### Prepared by Jyoti Shankar and Kyra Prats ###
### Indigo Ag ###
### Updated 7/18/2022 ###

### Set working directory ###

setwd("/Users/kyraprats/Documents/Rice GHG Data")

### Installing relevant packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("cowplot")
install.packages("revtools")
install.packages("forcats")
install.packages("PRISMA2020")
install.packages("usethis")

### Loading relevant packages
library(ggplot2)
library(dplyr)
library(cowplot)
library(revtools)
library(forcats)
library(PRISMA2020)
library(usethis)

use_git_config(user.name = "KyraPrats", user.email = "kyraprats@gmail.com")


##### Playing with PRISMA #####
prisma <- read.table(file = "PRISMA.csv", sep = ",")
PRISMA_flowdiagram(prisma)




##### Figure 1 #####
# Histogram of literature metadata 

# Import metadata
rice_metadata <- read.table(file = "Rice Metadata.csv", header = TRUE, sep = ",")

# Figure 1a - Publication year
p1a <-
  ggplot(rice_metadata, 
         aes(Publication.Year)) +
  geom_bar(color = "gray65") +
  coord_flip() +
  ylim(0, 15) +
  labs(x = "Publication Year",
       y = "Count") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        axis.line = element_line(colour = "black"))
p1a

# Figure 1b - First author

p1b <-
  ggplot(rice_metadata, 
         aes(x = fct_rev(fct_infreq(First_Author)))) +
  geom_bar(color = "gray65", stat= "count") +
  coord_flip() +
  labs(x = "First Author",
       y = "Count") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        axis.line = element_line(colour = "black"))
p1b


# Figure 1c - First author institution
p1c <-
  ggplot(rice_metadata, 
         aes(x = fct_rev(fct_infreq(Institution)))) +
  geom_bar(color = "gray65", stat= "count") +
  coord_flip() +
  labs(x = "First Author Institution",
       y = "Count") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        axis.line = element_line(colour = "black"))
p1c


Figure1 <- plot_grid(p1a, p1b, p1c,
                     labels = c("A", "B", "C"), label_size = 11, align = "v", 
                     ncol = 1, nrow = 3)
Figure1
ggsave(Figure1, plot = Figure1, device = "pdf", scale = 1,
       width = 8, height = 11.5, units = c("in"), dpi = 600, limitsize = TRUE)

