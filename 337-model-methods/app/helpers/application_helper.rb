module ApplicationHelper

  def full_name(p)
    "#{p.first_name} #{p.last_name}"
  end
  
  def person_field(name, form_field)
    "<div class='form-group #{@person.errors[name] != [] && "has-error" }'>
      #{label_tag name,
        "#{name.to_s.humanize}
        #{@person.errors[name].join(", ")}",
        class: "control-label"}
      #{form_field}
    </div>".html_safe
  end
  
end
