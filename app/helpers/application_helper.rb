module ApplicationHelper
  def current_logo
    # 'my-baby.jpg'
    'jaysonpresto-gradpic.jpg'
  end
  def current_banner
    'my-family.jpg'
  end
  def my_birthday(birth_date = "1993-02-21")
    ((Time.zone.now -  Date.strptime(birth_date).to_time) / 1.year.seconds).floor
  end
end
