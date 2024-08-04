# frozen_string_literal: true

# 解析配置文件产生的异常类
class ConfigFileParseError < StandardError
  def initialize(msg = nil)
    super msg
  end
end