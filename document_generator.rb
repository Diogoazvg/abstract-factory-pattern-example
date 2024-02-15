# Abstract Factory
class DocumentGeneratorFactory
  def create_header
    raise NotImplementedError, 'Subclasses must implement create_header method'
  end

  def create_paragraph
    raise NotImplementedError, 'Subclasses must implement create_paragraph method'
  end
end

# Concrete Factory for HTML Document
class HTMLDocumentGeneratorFactory < DocumentGeneratorFactory
  def create_header
    HTMLHeader.new
  end

  def create_paragraph
    HTMLParagraph.new
  end
end

# Concrete Factory for PDF Document
class PDFDocumentGeneratorFactory < DocumentGeneratorFactory
  def create_header
    PDFHeader.new
  end

  def create_paragraph
    PDFParagraph.new
  end
end

# Abstract Product - Header
class Header
  def render
    raise NotImplementedError, 'Subclasses must implement render method'
  end
end

# Concrete Product for HTML Header
class HTMLHeader < Header
  def render
    puts '<h1>This is an HTML header</h1>'
  end
end

# Concrete Product for PDF Header
class PDFHeader < Header
  def render
    puts 'PDF Header: This is a PDF header'
  end
end

# Abstract Product - Paragraph
class Paragraph
  def render
    raise NotImplementedError, 'Subclasses must implement render method'
  end
end

# Concrete Product for HTML Paragraph
class HTMLParagraph < Paragraph
  def render
    puts '<p>This is an HTML paragraph</p>'
  end
end

# Concrete Product for PDF Paragraph
class PDFParagraph < Paragraph
  def render
    puts 'PDF Paragraph: This is a PDF paragraph'
  end
end

# Client Code
def generate_document(factory)
  header = factory.create_header
  paragraph = factory.create_paragraph

  header.render
  paragraph.render
end

# Using HTML Document Generator
html_factory = HTMLDocumentGeneratorFactory.new
generate_document(html_factory)

# Using PDF Document Generator
pdf_factory = PDFDocumentGeneratorFactory.new
generate_document(pdf_factory)
