# frozen_string_literal: true

require 'set'
require_relative '../error/config'

# 模式标签
class ModeTag
  # @param mode[String]
  def initialize(mode)
    @@binary = false
    @@dynamic = false
    @@static = false
    @@invalid = true

    # 将字符串根据+拆分，并放入一个集合中
    mode_set = mode.split('+').to_set
    # 判断集合长度
    if mode_set.length > 3
      # 抛出解析文件异常
      raise ConfigFileParseError 'Only supported:bin,dyn,sta mode'
    end
    if mode_set.include? 'bin'
      @@binary = true
    end
    if mode_set.include? 'dyn'
      @@dynamic = true
    end
    if mode_set.include? 'sta'
      @@static = true
    end
    if @@binary || @@dynamic || @@static
      @@invalid = false
    end
    # 如果三个模式都没有
    if @@invalid
      # 抛出解析文件异常
      raise ConfigFileParseError 'Only supported:bin,dyn,sta mode'
    end
  end

  # @return [Boolean]
  def bin_mode?
    return @@binary
  end

  # @return [Boolean]
  def dyn_mode?
    return @@dynamic
  end

  # @return [Boolean]
  def sta_mode?
    return @@static
  end

end