# encoding: utf-8

temps = Time.now
total_des_feuilles(temps)
puts "temps = #{temps}"
puts "temps format = #{temps.to_metric.round_metric('>')}"