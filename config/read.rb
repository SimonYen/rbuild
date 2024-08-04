# frozen_string_literal: true

require 'perfect_toml'

class ConfigFile
  # 构造函数
  # @param config_file_path[String]
  def initialize(config_file_path)
    # 根据给出的配置文件路径，直接读取toml配置文件
    @@config_hash = PerfectTOML.load_file(config_file_path)

  end

  # @note 仅测试用
  # @return nil
  def test
    p @@config_hash
  end
end
