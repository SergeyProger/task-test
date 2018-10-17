class TextConvert

         TRANSLATIONS = {
          0 => "ноль",
          1000 => {1 =>"тысяча", 2 => "тысячи", 3 => "тысяч"},
          1000000 => {1 => "миллион", 2 => "миллиона", 3 => "миллионов"},
          #сотни
          100 => "сто",
          200 => "двести",
          300 => "триста",
          400 => "четыреста",
          500 => "пятьсот",
          600 => "шестьсот",
          700 => "семьсот",
          800 => "восемьсот",
          900 => "девятьсот",
          #десятки
          10 => "десять",
          11 => "одиннадцать",
          12 => "двенадцать",
          13 => "тринадцать",
          14 => "четырнадцать",
          15 => "пятнадцать",
          16 => "шестнадцать",
          17 => "семнадцать",
          18 => "восемнадцать",
          19 => "девятнадцать",
          20 => "двадцать",
          30 => "тридцать",
          40 => "сорок",
          50 => "пятьдесят",
          60 => "шестьдесят",
          70 => "семьдесят",
          80 => "восемьдесят",
          90 => "девяносто",
          # единицы, местами - c учетом рода
          1 => {1 => "один", 2 => "одна"},
          2 => {1 => "два", 2 => "две"},
          3 => "три",
          4 => "четыре",
          5 => "пять",
          6 => "шесть",
          7 => "семь",
          8 => "восемь",
          9 => "девять",
      }


  # Displays a number as an amount in rubles in words
  def rublej(amount)
    if amount > 999999999
      return 'Превышен лимит 999999999'
    elsif amount <= 0
      return 'Введите сумму'
    else
      numbers(amount)
    end
  end

  # Generates a number in words
  def numbers(number)
    str = ''
    @arr = num_to_array(number)

    #hundreds million
    str << hundreds(@arr[0],  1)

    # then million
    str << tens(@arr[1],  1)

    # million
    str << million_and_thousands(@arr[2], 1, 1000000)

    # hundreds of thousands
    str << hundreds(@arr[3],  2)

    # tens of thousands
    str << tens(@arr[4],  2)

    #thousands

    str << million_and_thousands(@arr[5], 2, 1000)

    str << hundreds(@arr[6],  0)

    str << tens(@arr[7], 1)

    str << units(@arr[8], 1)

    str << rubli(@arr[7], @arr[8])

    str.squish
  end

  # million
  def million_and_thousands(num, position, translation)
    case num
      when 1
        return units(num, position) << ' ' << TRANSLATIONS[translation][1] << ' '
      when 2
        return units(num, position) << ' ' << TRANSLATIONS[translation][2] << ' '
      when 3..4
        return units(num, position) << ' ' << TRANSLATIONS[translation][2] << ' '
      when 5..9
        return units(num, position) << ' ' << TRANSLATIONS[translation][3] << ' '
      else
        return ''
    end
  end


  # hundreds
  def hundreds(num, position)
    str = ''
    num != 0 ? str << TRANSLATIONS[num*100] << ' ' : ''
    if(@arr[num]!=0 && @arr[num+1]==0 && @arr[num+2]==0)
      if position == 1
        str << TRANSLATIONS[1000000][3] << ' '
      elsif postion == 2
        str << TRANSLATIONS[1000][3] << ' '
      end
    end
    return str
  end

  # tens
  def tens(num, position)
    str = ' '
    case num
      when 1
       str << TRANSLATIONS[@arr[num+1]+10] << ' '
       @arr[num+1] = 0;
      when 2..9
        str << TRANSLATIONS[num*10] << ' '
      else
        return ''
    end
  end

  # units
  def units(num, position)
    case num
      when 1..2
        return TRANSLATIONS[num][position] << ' '
      when 3..9
        return TRANSLATIONS[num] << ' '
      else
        return ''
    end
  end

# splits a number into an array
  def num_to_array(numb)
    arr = []
    chas = numb
    delitel = 100000000
    ost = 0
      9.times do |i|
        unless delitel == 0
        ost = chas / delitel
        arr[i] = ost
        chas = chas - ost * delitel
        delitel = delitel / 10
        end
      end
    return arr
  end

# inclines ruble
  def rubli(start, finish)
    if(start==1)
      return "рублей"
    end
    if finish == 1
        return "рубль"
    elsif finish < 5 && finish > 1
      return "рубля"
    else
      return "рублей"
    end
  end
end


