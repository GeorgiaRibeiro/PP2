#------------------------------------------#
#           UFPE - PP2 - 2020.3            #
# Grupo: Catarina, Flavia, Georgia e Tales #
#    Problema 1: proposicoes covid-19      #
#------------------------------------------#

#importar pacote
library(stringr)

# carregar banco
banco = read.csv("proposicoes_covid19_abril2020.csv")

# proposicoes por autor
Exec = banco[str_detect(banco$Proposicoes, "MPV"),]
Exec$TipoAutor = "Executivo"

Leg = banco[!str_detect(banco$Proposicoes, "MPV"),]
Leg$TipoAutor = "Legislativo"

banco = rbind(Exec, Leg)

#percentual coronavirus
banco %>% group_by(TipoAutor, Codfificacao.Georgia) %>%
  summarise(cont = n()) %>%
  mutate(freq = (cont / sum(cont))*100)
