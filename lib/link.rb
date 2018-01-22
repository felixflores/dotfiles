class Link
  attr_reader :file, :link, :files, :error

  class LinkNotCreatedError < StandardError; end
  class CommandNotExecutedError < StandardError; end

  def initialize(file, link, optional, command)
    @files = 'files'
    @file = file
    @link = link
    @optional = optional
    @command = command
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

  def dir?
    return if File.symlink? link_path
    Dir.exist? link_path
  end

  def remove
    File.unlink link_path
  end

  def create
    if creatable?
      symlink!
      execute_optional_command! if command
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

  def command
    return unless @command
    @command.gsub 'LINK_PATH', link_path
  end

  def execute_optional_command!
    raise CommandNotExecutedError, "Error executing \"#{command}\"" unless system command
  rescue CommandNotExecutedError
    remove_symlink
    raise
  end

  def home_path
    File.expand_path '~'
  end

  def remove_symlink
    File.unlink link_path if File.symlink? link_path
  end
end
