
# Combustíveis fósseis em países autocratas e democratas -----------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 03/12/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/fossil-fuels --------------------------------------------------------------------------------------

# Sobre os dados ---------------------------------------------------------------------------------------------------------------------------

### Pela maior parte da história da humanidade nossos ancestrais dependeram de muitas formas
### básicas de energia: força humana e animal, e queima de biomassa de madeira e cultivos.
### Mas a Revolução Industrial desbloqueou uma nova fonte de energia: combustíveis fósseis.
### Energia a partir de combustíveis fósseis tem sido um fundamental condutor social, econômico
### tecnológico e responsável pelo progesso do desenvolvimento que seguiu.

### Combustíveis fósseis (carvão, petróleo e gás) continua a jogar um dominante papel nos
### sistemas de nergia global.

### Mas eles também vem com negativos impactos. Quando queimam, eles produzem dióxido de carbono,
### e são os maiores condutores das mudanças climáticas globais. Eles são também os maiores
### contribuidores da poluição local, que é estimada a estar diretamente ligada a milhões de
### mortes prematuras a cada ano.

### Fontes de energia de baixa emissão de carbono - nuclear e renováveis - se tornam protamente
### disponíveis, o mundo necessita rapidamente aderir a transição e abandonar os combustíveis
### fósseis.

### Esse artigo apresenta as perspectivas recentes e de longo prazo sobre o carvão, petróleo
### e gás - como muitos países produzem e consomem; onde estão as reservas de nosso combustível
### fóssil; e quais os papéis que os combustíveis fósseis desempenham em nossos sistemas de
### energia e eletricidade.

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(cols4all)
library(hrbrthemes)
library(ggthemes)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

comb_fos <- read.csv("fossil-fuel-primary-energy.csv")
view(comb_fos)
names(comb_fos)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

comb_fos <- comb_fos %>%
  select(-Code) %>%
  rename(uso_comb_fos = Fossil.fuels..TWh.) %>%
  view()

comb_fos1 <- comb_fos %>%
  filter(Entity %in% c("United States", "Germany", "Japan", "China")) %>%
  group_by(Entity) %>%
  summarise(media = mean(uso_comb_fos),
            n = n(), sd = sd(uso_comb_fos),
            se = sd/sqrt(n)) %>%
  view()

comb_fos2 <- comb_fos %>%
  filter(Entity %in% c("United States", "Germany", "Japan", "China")) %>%
  view()

comb_fos3 <- comb_fos %>%
  filter(Entity %in% c("United States", "China", "Brazil")) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------


