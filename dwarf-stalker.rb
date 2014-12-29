require 'libnotify'
require 'rb-inotify'

def read_location_from_file(path)
  File.open(path).to_a[0].strip
end

def read_patterns_from_file(path)
  File.open(path).to_a.map {|e| /#{e.strip}/}
end

def organize_file(path)
  lines = File.open(path).to_a
  lines.sort! {|a, b| a.downcase <=> b.downcase}
  lines.uniq!
  File.open(path, 'w') do |file|
    file.write(lines.join(""))
  end
end

dir_path = File.expand_path('.') + '/'
patterns_path = dir_path + 'patterns.txt'
icon_path = dir_path + 'icon.png'
df_path = read_location_from_file(dir_path + 'df_path.txt')
log_path = df_path + 'gamelog.txt'

organize_file(patterns_path)
patterns = read_patterns_from_file(patterns_path)

log_watcher = INotify::Notifier.new
log_watcher.watch(log_path, :modify) do
  announcement = File.open(log_path).to_a.last
  matches = false
  patterns.each do |pattern|
    if announcement =~ pattern
      matches = true
      break
    end
  end

  if matches
    time = Time.now
    puts "#{time.hour}:#{time.min}\t#{announcement}"
    Libnotify.show(icon_path: icon_path, summary: announcement)
  end
end
log_watcher.run
