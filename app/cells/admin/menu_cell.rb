class Admin::MenuCell < Cell::Rails

  def initialize(*args)
    puts "I'm here"
    super
  end

  def show
    render
  end

end
