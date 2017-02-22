module Toyrobot
  class Table
    def initialize(table_length, table_width)
      @table_length = table_length
      @table_width = table_width
    end

    def include?(vector)
      vector.x >=0 && vector.y >= 0 && vector.x <= table_length && vector.y <= table_width
    end

    private

    attr_reader :table_length, :table_width
  end
end
