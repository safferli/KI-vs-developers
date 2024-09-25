library(tidyverse)

# https://www.heise.de/news/Entwickler-sind-von-KI-nicht-begeistert-ihre-Manager-schon-9808503.html
# https://www.atlassian.com/software/compass/resources/state-of-developer-2024
# https://oobeya.io/blog/state-of-developer-experience-in-2024-key-findings-and-highlights/

# How much AI tools are improving developer productivity today
dta <- tribble(
  ~role, ~horizon, ~answer, ~percentage,
  "manager", "today", "not at all", 0,
  "manager", "today", "slightly", 0,
  "manager", "today", "moderately", 0,
  "manager", "today", "very", 0,
  "manager", "today", "extremely", 0,
  "dev", "today", "not at all", 30,
  "dev", "today", "slightly", 32,
  "dev", "today", "moderately", 22, 
  "dev", "today", "very", 11, 
  "dev", "today","extremely", 5,
  "dev", "in two years", "not at all", 12,
  "dev", "in two years", "slightly", 27,
  "dev", "in two years", "moderately", 35, 
  "dev", "in two years", "very", 20, 
  "dev", "in two years", "extremely", 6
)

label.breaks <- pretty(c(-max(dta$percentage), max(dta$percentage)))

dta %>% 
  mutate(
    # make percentage negative to have both sides of the pyramid
    percentage = case_when(
      role == "manager" ~ -percentage,
      TRUE ~ percentage
    ),
    answer = as_factor(answer)
  ) %>% 
  ggplot()+
    geom_col(aes(x=percentage, y=answer, fill=role))+
    scale_x_continuous(breaks  = label.breaks,
                       labels = abs(label.breaks)
                    )




# How much AI tools will improve developer productivity within the next two years 


# https://www.njtierney.com/post/2022/08/09/ggplot-pyramid/
