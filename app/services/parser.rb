class Parser
  def initialize(file:, current_user:)
    @file = file
    @current_user = current_user
  end

  def valid?
    @file.present? && @file.content_type.in?(['.txt', 'text/plain'])
  end

  # rubocop:disable Metrics/AbcSize
  def call
    cnab_file = CnabFile.create(user: @current_user)

    File.read(@file.tempfile).each_line do |line|
      t = Transaction.new
      s = Store.find_or_create_by(owner: line[48..61].strip,
                                  name: line[62..81].strip,
                                  cnab_file: cnab_file)

      t.type = line[0].to_i
      t.sold_at = make_date(line)
      t.amount = line[9..18].to_i / 100.00
      t.document = line[19..29]
      t.card = line[30..41]
      t.store_id = s.id

      t.save!
    end

    cnab_file
  end
  # rubocop:enable Metrics/AbcSize

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
