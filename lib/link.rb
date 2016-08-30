class Link
  attr_reader :file, :link, :files

  def initialize(file, link)
    @files = 'files'
    @file = file
    @link = link
  end

  def link_path
    File.join home_path, link
  end

  def file_path
    File.join Dir.pwd, files, file
  end

  private

  def home_path
    File.expand_path '~'
  end
end
