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

  def current?
    File.readlink(link_path) == file_path
  rescue Errno::ENOENT
  end

  def not_current?
    !current?
  end

  def exists?
    File.exist? link_path
  end

  def remove
    File.unlink link_path
  end

  def create
    File.symlink file_path, link_path
  end

  private

  def home_path
    File.expand_path '~'
  end
end
