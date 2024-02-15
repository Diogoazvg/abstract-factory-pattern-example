# Abstract Factory
class GUIFactory
  def create_button
    raise NotImplementedError, 'Subclasses must implement create_button method'
  end

  def create_checkbox
    raise NotImplementedError, 'Subclasses must implement create_checkbox method'
  end
end

# Concrete Factory for Windows GUI
class WindowsGUIFactory < GUIFactory
  def create_button
    WindowsButton.new
  end

  def create_checkbox
    WindowsCheckbox.new
  end
end

# Concrete Factory for macOS GUI
class MacOSGUIFactory < GUIFactory
  def create_button
    MacOSButton.new
  end

  def create_checkbox
    MacOSCheckbox.new
  end
end

# Abstract Product - Button
class Button
  def press
    raise NotImplementedError, 'Subclasses must implement press method'
  end
end

# Concrete Product for Windows Button
class WindowsButton < Button
  def press
    puts 'Windows button pressed'
  end
end

# Concrete Product for MacOS Button
class MacOSButton < Button
  def press
    puts 'MacOS button pressed'
  end
end

# Abstract Product - Checkbox
class Checkbox
  def check
    raise NotImplementedError, 'Subclasses must implement check method'
  end
end

# Concrete Product for Windows Checkbox
class WindowsCheckbox < Checkbox
  def check
    puts 'Windows checkbox checked'
  end
end

# Concrete Product for MacOS Checkbox
class MacOSCheckbox < Checkbox
  def check
    puts 'MacOS checkbox checked'
  end
end

# Client Code
def create_gui(factory)
  button = factory.create_button
  checkbox = factory.create_checkbox

  button.press
  checkbox.check
end

# Using Windows GUI
windows_factory = WindowsGUIFactory.new
create_gui(windows_factory)

# Using MacOS GUI
macos_factory = MacOSGUIFactory.new
create_gui(macos_factory)
