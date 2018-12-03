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
          # единицы c учетом рода
          1 => {1 => "один", 2 => "одна"},
          2 => {1 => "два", 2 => "две"},
          3 => "три",
          4 => "четыре",
          5 => "пять",
          6 => "шесть",
          7 => "семь",
          8 => "восемь",
          9 => "девять"
      }


  # Displays a number as an amount in rubles in words add test comit
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
    # splits a number into an array
    @arr = num_to_array(number)

    (0..8).step(3) do |i|

      str << hundreds(@arr[i], i) << ' ' # hundreds
      # add translation
      str << hundreds_of_thousands_and_millions(i)
      i+=1
      str << tens(@arr[i],  i) << ' '    # then
      # add translation
      i == 4 && @arr[i+1] == 0 && @arr[i] != 0 ? str << TRANSLATIONS[1000][3] :''
      i == 1 && @arr[i+1] == 0 && @arr[i] != 0 ? str << TRANSLATIONS[1000000][3] :''
      i+=1
      str << units(@arr[i], i) << ' '    # units
      # add translation
      str << million_and_thousands(@arr[i],  1000000)<< ' ' if i == 2 && @arr[i] != 0
      str << million_and_thousands(@arr[i],  1000)<< ' ' if i == 5 && @arr[i] != 0
    end
    # Adds the inscription rubles
    str << rubli(@arr[7], @arr[8])
    # Removes extra spaces
    return str.squish
  end

  # million and thousands
  def million_and_thousands(num, ts)
    case num
      when 1
        return TRANSLATIONS[ts][1] << ' '
      when 2
        return TRANSLATIONS[ts][2] << ' '
      when 3..4
        return TRANSLATIONS[ts][2] << ' '
      when 5..9
        return TRANSLATIONS[ts][3] << ' '
      else
        return ''
    end
  end

 # if 100 ..900
  def hundreds_of_thousands_and_millions(position)
    if(@arr[position]!=0 && @arr[position+1]==0 && @arr[position+2]==0)
      if position == 0
        return TRANSLATIONS[1000000][3] << ' '
      elsif position == 3
        return TRANSLATIONS[1000][3] << ' '
      end
    end
    return ''
  end

  # hundreds
  def hundreds(num, position)
    num != 0 ? str = TRANSLATIONS[num*100]  : str = ''
    return str
  end

  # tens
  def tens(num, position)
    case num
      when 1
        str = TRANSLATIONS[@arr[position+1] + 10]
        @arr[position+1] = 0
      when 2..9
        str = TRANSLATIONS[num*10]
      else
        return ''
    end

    return str
  end

  # units
  def units(num, position)
    position == 5 ? sklon = 2 : sklon = 1
    case num
      when 1..2
        str = TRANSLATIONS[num][sklon]
      when 3..9
        str = TRANSLATIONS[num]
      else
        return ''
    end

    return str
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
    if start == 1
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


