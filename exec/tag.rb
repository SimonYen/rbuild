# frozen_string_literal: true

require 'set'

# 模式标签
class ModeTag
  # @param mode[String]
  def initialize(mode)
    @@binary = false
    @@dynamic = false
    @@static = false
    @@invalid = true

    # 将字符串根据+拆分，并放入一个集合中
    mode_set=mode.split('+').to_set
    # 判断集合长度
    #
  end
end