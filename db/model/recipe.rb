class Recipe < Sequel::Model
  def validate
    super
    #errors.add(:name, 'cannot be empty') if !name || name.strip.empty?
  end
end
