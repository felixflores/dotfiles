class Link
  attr_reader :file, :link, :files, :error

  class LinkNotCreatedError < StandardError; end

  def initialize(file, link, optional)
    @files = 'files'
    @file = file
    @link = link
    @optional = optional
  end

  def link_path
    File.join home_path, link
  end

  def file_path
    File.join Dir.pwd, files, file
  end

  def optional?
    @optional
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
    if creatable?
      symlink!
      return true
    elsif optional?
      @error = 'skipped (optional)'
    else
      @error = 'error'
      raise LinkNotCreatedError
    end
    false
  end

  def creatable?
    File.directory? File.dirname(link_path)
  end

  private

  def symlink!
    File.symlink file_path, link_path
  rescue Errno::ENOENT => e
    @error = :error
    raise e
  end

  def home_path
    File.expand_path '~'
  end
end
