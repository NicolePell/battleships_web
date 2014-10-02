class Cell
	attr_accessor :content

	def initialize
		@hit = false
		@content = Water.new
	end

	def shoot
		@hit = content.hit!
	end

	def hit?
		@hit
	end
end