library(tidyverse)

# https://www.heise.de/news/Entwickler-sind-von-KI-nicht-begeistert-ihre-Manager-schon-9808503.html
# https://www.atlassian.com/software/compass/resources/state-of-developer-2024
# https://oobeya.io/blog/state-of-developer-experience-in-2024-key-findings-and-highlights/

# How much AI tools are improving developer productivity today
dta <- tribble(
  ~role, ~answer, ~percentage,
  "manager", "not at all", 30,
  "manager", "slightly", 32,
  "manager", "moderately", 22, 
  "manager", "very", 11, 
  "manager", "extremely", 5,
  "dev", "not at all", 0,
  "dev", "slightly", 0,
  "dev", "moderately", 35, 
  "dev", "very", 26, 
  "dev", "extremely", 0
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
