module ApplicationHelper
  def current_logo(logo = 'familypic.jpg')
    #jaysonpresto-gradpic.jpg
    # 'my-baby.jpg'
    logo
  end
  def current_banner
    'my-family.jpg'
  end
  def my_birthday(birth_date = "1993-02-21")
    ((Time.zone.now -  Date.strptime(birth_date).to_time) / 1.year.seconds).floor
  end
  def answer(truth, opts={})
		truth ? (opts[:affirmative] || "Yes") : (opts[:negative] || "No")
	end
end
