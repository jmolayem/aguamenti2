module NatlangsHelper
	def predictions_for(result)
		result.predictions.map do |prediction|
			"%s: %2.1f%" % [prediction.class_name, prediction.probability * 100]
		end.join(', ')
	end
end
