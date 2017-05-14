require_relative 'link'
require_relative 'sheller'
require 'yaml'

class Linker

  def run
    verify_tmp_dir
    audit_existing_symlinks
    create_symlinks
    update_shells
  end

  private

  def update_shells
    Sheller.new(dotfile_link.link_path).update_shells
  end

  def dotfile_link
    links.find_all { |l| l.file == 'dotfiles' }.first
  end

  def audit_existing_symlinks
    links.each do |link|
      print "Checking #{link.link_path}: "
      if link.exists?
        if link.current?
          print 'looks good'
        elsif link.remove
          print 'removed'
        else
          print 'error'
        end
      else
        print 'not there'
      end
      print "\n"
    end
  end

  def create_symlinks
    links.each do |link|
      print "Linking #{link.link_path}: "
      if link.not_current?
        if link.create
          print 'linked'
        else
          print link.error
        end
      else
        print 'current'
      end
      print "\n"
    end
  end

  def verify_tmp_dir
    Dir.mkdir(tmp_dir) unless Dir.exist?(tmp_dir)
  end

  def tmp_dir
    home '.tmp'
  end

  def home_path
    File.expand_path '~'
  end

  def home(path)
    File.join home_path, path
  end

  def links
    return @links if @links
    @links = assignment_map.map { |f| Link.new f[:link_from], f[:link_to], f.fetch(:optional, false) }
  end

  def assignment_map
    @assignment_map ||= YAML.load_file('config.yml')[:assignment_map]
  end
end
