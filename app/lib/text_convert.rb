class TextConvert

         Tr = {
          0 => "ноль",
          1000 => {1 =>"тысяча", 2 => "тысячи", 3 =>"тысяч"},
          1000000 => {1 => "миллион", 2 =>"миллиона", 3 =>"миллионов"},
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


  # Выводит число как сумму в рублях прописью
  def rublej(amount)
    if amount > 999999999
      return 'Превышен лимит 999999999'
    elsif amount <= 0
      return 'Введите сумму'
    else
      numbers(amount)
    end
  end

  # Формирует число прописью
  def numbers(number)
    str = ''
    arr = arr_num(number)

    #hundreds million
    str << hundreds(arr[0])

    ## then million
    case arr[1]
      when 1
        str << tens(arr[1], arr[2]) << Tr[1000000][3]<<' '
        arr[2] = 0
      when 2..9
        str << tens(arr[1], arr[2])<<' '
    end

    # million
    case arr[2]
      when 1
        str << Tr[arr[2]][1] << Tr[1000000][1]<<' '
      when 2
        str << Tr[arr[2]][1] << Tr[1000000][2]<<' '
      when 3..4
        str << Tr[arr[2]] << Tr[1000000][2]<<' '
      when 5..9
        str << Tr[arr[2]] << Tr[1000000][3]<<' '
    end

    #hundreds of thousands
    str << hundreds(arr[3])
    #tens of thousands
    case arr[4]
      when 1
        str << tens(arr[4], arr[5]) << Tr[1000][3]<<' '
        arr[5] = 0
      when 2..9
        str << tens(arr[4], arr[5])<<' '
    end

  # thousands
    case arr[5]
      when 1
        str << Tr[arr[5]][2] << Tr[1000][1]<<' '
      when 2
         str << Tr[arr[5]][2] << Tr[1000][2]<<' '
      when 3..4
        str << Tr[arr[5]] << Tr[1000][2]<<' '
      when 5..9
        str << Tr[arr[5]] << Tr[1000][3]<<' '
    end

    str << hundreds(arr[6])
    str << tens(arr[7], arr[8])

    if arr[7] == 1
      arr[8] = 0
    else
      str << units(arr[8])
    end

    return str + rubli(arr[8])
  end

  # hundreds
  def hundreds num
    case num
      when 1..9
        return Tr[num*100]<<' '
      else
        return ''
    end
  end

  # tens
  def tens(num, next_un)
    case num
      when 1
       return Tr[next_un+10]<<' '
      when 2..9
        return Tr[num*10]<<' '
      else
        return ''
    end
  end

  # units
  def units num
    case num
      when 1..2
        return Tr[num][1]<<' '
      when 3..9
        return Tr[num]<<' '
      else
        return ''
    end
  end

# разбивает число на масив
  def arr_num(numb)
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

# склоняет рубль
  def rubli finish
    if finish == 1
        return "рубль"
    elsif finish < 5 && finish > 1
      return "рубля"
    else
      return "рублей"
    end
  end
end


