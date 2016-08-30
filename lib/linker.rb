require_relative 'link'

class Linker

  def run
    verify_tmp_dir
    remove_symlinks
    create_symlinks
  end

  private

  def remove_symlinks
    links.each do |link|
      print "Removing #{link.link_path}: "
      if File.exist?(link.link_path)
        if File.unlink(link.link_path)
          print 'removed'
        else
          print 'error'
        end
      else
        print 'skipped'
      end
      print "\n"
    end
  end

  def create_symlinks
    links.each do |link|
      print "Linking #{link.link_path}: "
      if File.symlink(link.file_path, link.link_path)
        print 'linked'
      else
        print 'error'
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
    @links = assignment_map.map { |(k,v)| Link.new k, v }
  end

  def assignment_map
    {
      'dotfiles' => '.dotfiles',
      'gemrc.txt' => '.gemrc',
      'global_gitignore.txt' => '.gitignore_global',
      'gitconfig-include.txt' => '.gitconfig-include',
      'gitshrc.txt' => '.gitshrc',
      'irbrc.txt' => '.irbrc',
      'tmux.conf' => '.tmux.conf',
      'vim' => '.vim',
      'vimrc.txt' => '.vimrc',
      'vimrc.bundles.txt' => '.vimrc.bundles'
    }
  end
end
