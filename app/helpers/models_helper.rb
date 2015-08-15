module ModelsHelper
  def input_tag_for_input(input, options = {})
    case input.kind
    when 'text' then text_field_tag("model[#{input.name}]", nil, options)
    when 'number' then number_field_tag("model[#{input.name}]", nil, options)
    else raise "Invalid input kind: #{input.kind}"
    end
  end

  #def select_for_input(input, options)
    #select_tag("model[#{input.name}]", nil, options)
  #end
end