module ModelsHelper
  def input_tag_for_input(input)
    case input.kind
    when 'text' then text_field_tag("model[#{input.name}]")
    when 'number' then number_field_tag("model[#{input.name}]")
    else raise "Invalid input kind: #{input.kind}"
    end
  end
end
