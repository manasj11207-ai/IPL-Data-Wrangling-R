library(tidyverse)

#importing the creeksheet csv data in R

IPL <- list.files("C:/Users/Hp/OneDrive/Desktop/2008",
                  pattern = "\\.csv$") 


# data cleanising 

readinfo <- function(X){
  lines <- readLines(X)
  info  <- lines[grepl("^info" , lines)]
  matchesinfo <- read.csv(text = info ,
                          header = F ,
                          fill = T ,
                          col.names = c("record", "field", "value_1", "value_2", "value_3") ,
                          stringsAsFactors = F)
  
  matchesinfo <- matchesinfo[ , c(-1, -4 ,-5)] 
  matchesinfo <- filter(matchesinfo ,field %in% c("match_number" ,"season" , "date","venue", "team" ,
                                                  "toss_winner", "toss_decision" , "player_of_match"  , "winner" ,"winner_runs" 
                                                  , "winner_wickets" ))
  matchesinfo <-  tidyr::pivot_wider(matchesinfo , 
                                     names_from = field, 
                                     values_from = value_1 )
  matchesinfo <- mutate( matchesinfo , match_ID = basename(X) )
  return(matchesinfo) }

IPL_info <-  lapply( IPL , readinfo)

IPL_info <- dplyr::bind_rows(IPL_info)


# analysing if the winning toss affects the match result 

IPL_info <-IPL_info %>% mutate(toss_winner = as.character(toss_winner),
                               winner = as.character(winner) ,
                               )


IPL_info <- IPL_info %>%
  mutate(toss_affect = ifelse( toss_winner == winner, 1, 0))


winning_rate_after_winning_toss <- sum(IPL_info$toss_affect)/length(IPL_info$toss_affect)*100

winning_rate_after_winning_toss

ggplot( IPL_info , aes(x =factor(toss_affect) , fill = factor(toss_affect))) +
  geom_bar(width = 0.6)+ scale_x_discrete(labels = c("0" = "toss winner lossing match" , "1" = "toss winner wining match"))+
  labs(
    title = "Does Winning the Toss Help Win the IPL Match?",
    subtitle = "Analysis of Toss Winners' match outcomes across all seasons",
    x = "",
    y = "Total Number of Matches"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 14),
    axis.text = element_text(size = 11)
  )

