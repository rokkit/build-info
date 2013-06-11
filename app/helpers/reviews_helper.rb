# encoding: UTF-8
module ReviewsHelper
  def status status
    if status == 1
      return "Ожидание подтверждения"
    elsif status == 2
      return "Подтверждена"
    elsif status == 3
      return "Выполнена"
    elsif status == 4
      return "Отменена"
    end
  end
  
  def io review
    if review.user == current_user
      return "Исходящий"
    else
      return "Входящий"
    end
  end
end
