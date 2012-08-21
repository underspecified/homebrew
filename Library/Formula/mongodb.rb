require 'formula'

class Mongodb < Formula
  homepage 'http://www.mongodb.org/'

  if Hardware.is_64_bit? and not build.build_32_bit?
    url 'http://fastdl.mongodb.org/osx/mongodb-osx-x86_64-2.0.7.tgz'
    md5 '81b0e8be3206cc60e8031dde302fb983'
    version '2.0.7-x86_64'

    devel do
      url 'http://fastdl.mongodb.org/osx/mongodb-osx-x86_64-2.2.0-rc1.tgz'
      md5 '7cdaafc7373c3fe8d79e963f56a0e011'
      version '2.2.0-rc1-x86_64'
    end
  else
    url 'http://fastdl.mongodb.org/osx/mongodb-osx-i386-2.0.7.tgz'
    md5 '5fee3796ebc4e8721d9784ad8978b2b6'
    version '2.0.7-i386'

    devel do
      url 'http://fastdl.mongodb.org/osx/mongodb-osx-i386-2.2.0-rc1.tgz'
      md5 '4147b128e9b20597eb08c72f06a1e473'
      version '2.2.0-rc1-i386'
    end
  end

  option '32-bit'

  skip_clean :all

  def install
    # Copy the prebuilt binaries to prefix
    prefix.install Dir['*']

    # Create the data and log directories under /var
    (var+'mongodb').mkpath
    (var+'log/mongodb').mkpath

    # Write the configuration files and launchd script
    (prefix+'mongod.conf').write mongodb_conf
    plist_path.write startup_plist
    plist_path.chmod 0644

    # copy the config file to etc if this is the first install.
    etc.install prefix+'mongod.conf' unless File.exists? etc+"mongod.conf"
  end

  def caveats; <<-EOS.undent
    If this is your first install, automatically load on login with:
        mkdir -p ~/Library/LaunchAgents
        cp #{plist_path} ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/#{plist_path.basename}

    If this is an upgrade and you already have the #{plist_path.basename} loaded:
        launchctl unload -w ~/Library/LaunchAgents/#{plist_path.basename}
        cp #{plist_path} ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/#{plist_path.basename}

    Or start it manually:
        mongod run --config #{etc}/mongod.conf

    The launchctl plist above expects the config file to be at #{etc}/mongod.conf.
    EOS
  end

  def mongodb_conf; <<-EOS.undent
    # Store data in #{var}/mongodb instead of the default /data/db
    dbpath = #{var}/mongodb

    # Append logs to #{var}/log/mongodb/mongo.log
    logpath = #{var}/log/mongodb/mongo.log
    logappend = true

    # Only accept local connections
    bind_ip = 127.0.0.1
    EOS
  end

  def startup_plist
    return <<-EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>#{plist_name}</string>
  <key>ProgramArguments</key>
  <array>
    <string>#{HOMEBREW_PREFIX}/bin/mongod</string>
    <string>run</string>
    <string>--config</string>
    <string>#{etc}/mongod.conf</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>KeepAlive</key>
  <false/>
  <key>UserName</key>
  <string>#{`whoami`.chomp}</string>
  <key>WorkingDirectory</key>
  <string>#{HOMEBREW_PREFIX}</string>
  <key>StandardErrorPath</key>
  <string>#{var}/log/mongodb/output.log</string>
  <key>StandardOutPath</key>
  <string>#{var}/log/mongodb/output.log</string>
</dict>
</plist>
EOS
  end
end
