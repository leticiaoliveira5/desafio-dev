class ParseFileService
  def initialize(file:)
    @file = file
  end

  def valid?
    @file.present? && @file.content_type.in?(['.txt', 'text/plain'])
  end

  def call
    return false unless valid?

    transactions = []

    @file.read.each_line do |line|
      transactions << { type: line[0].to_i,
                        sold_at: make_date(line),
                        amount: line[9..18].to_i / 100.00,
                        document: line[19..29],
                        card: line[30..41],
                        store: {
                          owner: line[48..61].strip,
                          name: line[62..81].strip
                        } }
    end

    transactions
  rescue Date::Error
    false
  end

  def make_date(line)
    year = line[1..4].to_i
    month = line[5..6].to_i
    day = line[7..8].to_i
    hour = line[42..43].to_i
    minute = line[44..45].to_i
    second = line[46..47].to_i

    DateTime.new(year, month, day, hour, minute, second)
  end
end
