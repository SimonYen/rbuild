# frozen_string_literal: true

# main.rb文件主要负责终端命令解析，以及整个主程序的入口

require 'optparse'
require_relative 'config/read'

# 定义版本信息
VERSION = '0.1'

options = {}

# 新建OptionParser对象
begin
  OptionParser.new do |opts|
    # 设置命令行显示的第一行
    opts.banner = 'Usage: ruby main.rb [options]'

    # 初始化新项目
    opts.on('-i', 'init') do
      options[:init] = true
    end

    # 输出版本信息
    opts.on('-v', 'version', 'Print version information') do
      puts "Rbuild v#{VERSION}"
      exit
    end
    # 开启啰嗦模式
    opts.on('-V', 'verbose', 'Run verbosely') do
      options[:verbose] = true
    end

    # 指定配置文件
    opts.on('-f FILE', 'file FILE', 'Your project.toml file') do |file|
      options[:file] = file
    end

    # 帮助信息
    opts.on_tail('-h', 'help', 'Show help messages') do
      puts opts
      exit
    end
  end.parse!
rescue OptionParser::InvalidOption
  puts 'Invalid Option, -h or help for showing help messages!'
end

# 判断是否输入参数
if options.empty?
  # 开始执行默认配置
  puts '开始执行默认配置'
else
  # 初始化配置文件对象
  cf = ConfigFile.new options[:file]
  cf.test
end