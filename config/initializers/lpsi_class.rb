# encoding: utf-8
class Float
  def round_metric(sens_arondissement)
    min = ("%.2f" % self.abs.modulo(1)).to_f
    if (self - min) > 0
      heure = self - min
    else
      heure = 0
    end
    #puts "dans round_metric, self = #{self}, min = #{min} et heure = #{heure}"
    case sens_arondissement
      when '<'
        if min >= 0.75
          min = 0.75
        elsif min >= 0.50
          min = 0.50
        elsif min >= 0.25
          min = 0.25
        elsif min >= 0.0
          min = 0.0
        end
      when '>'
        if min > 0.75
          min = 0.0
          heure += 1.0
        elsif min > 0.50
          min = 0.75
        elsif min > 0.25
          min = 0.50
        elsif min > 0.0
          min = 0.25
        end
    end
    #puts "dans round_metric, apres traitement min = #{min} et heure = #{heure}"
    return heure + min
  end
end
class Time
  # cet classe permet de convertir le temps du type 8:30 a 8.5
  def to_metric
    min = self.min * 100 / 60
    heure = self.hour
    return "#{heure}.#{min}".to_f
  end

end
class String
  def to_time
    return Time.parse(self)
  end

  def to_date
    return Date.parse(self)
  end

  def align_by_last(on_string)
    string = self
    nb_s = (on_string.length - string.length)
    space = ""
    for i in 1..(nb_s)
     space += "."
    end
    string = space + string
    return string
  end

  def enclose_in_brackets(selection)
    self.gsub(/(\b#{selection}\b)/i, '{\1}')
  end

end
=begin
class Hash
  def +(to_add)
    merge(to_add)
  end

  def except(which)
    self.tap{ |h| h.delete(which) }
  end

end
=end
class Dir
  # Modifi la class afin de creer les repertoire recursivement
  def self.mkdirs(p)
     return if File.exists?
     dir, file = File.split(p)
     Dir.mkdirs(dir) if !File.exists?(dir)
     Dir.mkdir(p)
  end
end
class Array
      # define an iterator over each pair of indexes in an array
  def each_pair_index
      (0..(self.length-1)).each do |i|
          ((i+1)..(self.length-1 )).each do |j|
              yield i, j
          end
      end
  end

  # define an iterator over each pair of values in an array for easy reuse
  def each_pair
      self.each_pair_index do |i, j|
          yield self[i], self[j]
      end
  end
end

