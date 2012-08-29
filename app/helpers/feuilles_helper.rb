module FeuillesHelper
  def total_des_feuilles(feuille)
    date_ft = feuille.debut
    date_ft2 = feuille.fin
    debut = date_ft.to_metric.round_metric("<")

    if date_ft.yday != date_ft2.yday # Verifie si plus d'une journee
      nb_24h = (date_ft2.yday.to_f - date_ft.yday.to_f)
      #puts "*** date_ft2 = #{date_ft2.yday} et date_ft = #{date_ft.yday} et nb_24h = #{nb_24h}"
      nb_fois = 1
      h_travailler = 0.0
      temp_premier_jour = 24 - debut
      while (nb_24h > 1 )
        #puts "nb_24 etait a #{nb_24h} et je passe pour la #{nb_fois} fois"
        nb_fois += 1
        nb_24h -= 1
        h_travailler += 24
      end
      dernier_jour = date_ft2.to_metric
      total = (temp_premier_jour + h_travailler + dernier_jour).round_metric('>')
      fin = date_ft2.to_metric.round_metric('>')
                                       #puts "debut = #{debut}, fin est: #{fin} Total sera:#{total}"
    else
      fin = debut + (date_ft2.to_metric - date_ft.to_metric).round_metric('>')
      fin += 0.25 if fin == debut
      total = fin - debut
    end
    @total += total
    @suretemps += feuille.surtemps
    @nc += feuille.nc
    @voyagement += feuille.voyagement
    @debut = debut
    @fin = fin
    @total_de_la_feuille = total + feuille.surtemps - feuille.nc + feuille.voyagement
  end
end
