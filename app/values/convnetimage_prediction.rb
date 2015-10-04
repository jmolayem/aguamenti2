class ConvnetimagePrediction
	attr_reader :class_name, :probability

	def initialize(attributes)
		@class_name = attributes.fetch("class_name")
		@probability = attributes.fetch("prob")
	end
end